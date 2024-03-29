package com.github.tangyi.exam.service.exam;

import com.github.tangyi.api.exam.constants.AnswerConstant;
import com.github.tangyi.api.exam.dto.*;
import com.github.tangyi.api.exam.enums.SubmitStatusEnum;
import com.github.tangyi.api.exam.model.*;
import com.github.tangyi.api.exam.thread.IExecutorHolder;
import com.github.tangyi.common.base.SgPreconditions;
import com.github.tangyi.common.model.R;
import com.github.tangyi.common.utils.*;
import com.github.tangyi.common.vo.UserVo;
import com.github.tangyi.exam.enums.ExaminationType;
import com.github.tangyi.exam.handler.HandlerFactory;
import com.github.tangyi.exam.service.ExamRecordService;
import com.github.tangyi.exam.service.ExaminationSubjectService;
import com.github.tangyi.exam.service.RankInfoService;
import com.github.tangyi.exam.service.answer.AnswerService;
import com.github.tangyi.exam.service.fav.ExamFavoritesService;
import com.github.tangyi.exam.service.subject.SubjectsService;
import com.github.tangyi.exam.utils.ExamUtil;
import com.google.common.collect.Lists;
import com.google.common.util.concurrent.FutureCallback;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.StopWatch;
import org.checkerframework.checker.nullness.qual.Nullable;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
public class ExaminationActionService {

	private final ExaminationService examinationService;
	private final ExaminationSubjectService examinationSubjectService;
	private final ExamRecordService examRecordService;
	private final SubjectsService subjectsService;
	private final AnswerService answerService;
	private final RankInfoService rankInfoService;
	private final IExecutorHolder executorHolder;
	private final ExamFavoritesService examFavoritesService;

	public ExaminationActionService(ExaminationService examinationService,
			ExaminationSubjectService examinationSubjectService, ExamRecordService examRecordService,
			SubjectsService subjectsService, AnswerService answerService, RankInfoService rankInfoService,
			IExecutorHolder executorHolder, ExamFavoritesService examFavoritesService) {
		this.examinationService = examinationService;
		this.examinationSubjectService = examinationSubjectService;
		this.examRecordService = examRecordService;
		this.subjectsService = subjectsService;
		this.answerService = answerService;
		this.rankInfoService = rankInfoService;
		this.executorHolder = executorHolder;
		this.examFavoritesService = examFavoritesService;
	}

	@Transactional
	public StartExamDto start(ExaminationRecord examRecord) {
		SgPreconditions.checkNull(examRecord.getExaminationId(), "参数校验失败，考试 id 为空");
		SgPreconditions.checkNull(examRecord.getUserId(), "参数校验失败，用户 id 为空");
		return this.start(examRecord.getUserId(), SysUtil.getUser(), examRecord.getExaminationId(),
				SysUtil.getTenantCode());
	}

	@Transactional
	public StartExamDto start(Long userId, String identifier, Long examinationId, String tenantCode) {
		StartExamDto dto = new StartExamDto();
		Examination examination = examinationService.get(examinationId);
		dto.setExamination(examination);
		ExaminationRecord record = new ExaminationRecord();
		record.setCommonValue(identifier, tenantCode);
		record.setUserId(userId);
		record.setType(examination.getType());
		record.setExaminationId(examinationId);
		record.setStartTime(record.getCreateTime());
		// 默认未提交状态
		record.setSubmitStatus(SubmitStatusEnum.NOT_SUBMITTED.getValue());
		// 保存考试记录
		examRecordService.insert(record);
		dto.setExamRecord(record);

		// 根据题目 ID，类型获取第一题的详细信息
		SubjectDto subjectDto = subjectsService.findFirstSubjectByExaminationId(examinationId);
		dto.setSubjectDto(subjectDto);
		dto.setTotal(subjectDto.getTotal());

		// 创建第一题的答题
		Answer answer = new Answer();
		answer.setCommonValue(identifier, tenantCode);
		answer.setExamRecordId(record.getId());
		answer.setSubjectId(subjectDto.getId());
		// 默认待批改状态
		answer.setMarkStatus(AnswerConstant.TO_BE_MARKED);
		answer.setAnswerType(AnswerConstant.WRONG);
		answer.setStartTime(answer.getCreateTime());
		// 保存答题
		answerService.save(answer);
		subjectDto.setAnswer(answer);

		// 答题卡
		List<ExaminationSubject> ess = examinationSubjectService.findListByExaminationId(examinationId);
		if (CollectionUtils.isNotEmpty(ess)) {
			List<CardDto> cards = ess.stream().map(es -> {
				CardDto card = new CardDto();
				card.setSubjectId(es.getSubjectId());
				card.setSort(es.getSort());
				return card;
			}).collect(Collectors.toList());
			dto.setCards(cards);
		}
		examFavoritesService.incrStartCount(examinationId);
		return dto;
	}

	@Transactional
	public StartExamDto anonymousUserStart(Long examinationId, String identifier) {
		String tenantCode = SysUtil.getTenantCode();
		// 创建考试记录
		SgPreconditions.checkNull(examinationId, "参数校验失败，考试 id 为空");
		SgPreconditions.checkNull(identifier, "参数校验失败，用户 identifier 为空");
		// 查询用户信息
		R<UserVo> r = null;
		SgPreconditions.checkBoolean(!RUtil.isSuccess(r), "获取用户" + identifier + "信息失败！");
		return this.start(r.getResult().getUserId(), identifier, examinationId, tenantCode);
	}

	/**
	 * 提交答卷，自动统计选择题得分
	 */
	@Transactional
	public Boolean submit(Long recordId, String operator, String tenantCode) {
		List<Answer> answerList = this.answerService.findListByExamRecordId(recordId);
		if (CollectionUtils.isEmpty(answerList)) {
			return Boolean.FALSE;
		}

		ExaminationRecord record = this.examRecordService.get(recordId);
		Long[] subjectIds = answerList.stream().map(Answer::getSubjectId).toArray(Long[]::new);
		Map<Integer, List<Answer>> distinct = this.distinctAnswer(subjectIds, answerList);
		HandlerFactory.Result result = HandlerFactory.handleAll(distinct);
		// 记录总分、正确题目数、错误题目数
		record.setScore(result.getScore());
		record.setCorrectNumber(result.getCorrectNum());
		record.setInCorrectNumber(result.getInCorrectNum());
		// 更新答题状态
		List<Answer> updates = distinct.values().stream().flatMap(Collection::stream).collect(Collectors.toList());
		this.answerService.batchUpdate(updates);
		// 更新状态为统计完成，否则需要阅卷完成后才更改统计状态
		SubmitStatusEnum submitStatus = result.isHasHumanJudgeSubject() ?
				SubmitStatusEnum.SUBMITTED :
				SubmitStatusEnum.CALCULATED;
		record.setSubmitStatus(submitStatus.getValue());
		// 保存成绩
		record.setCommonValue(operator, tenantCode);
		record.setId(recordId);
		record.setEndTime(record.getCreateTime());
		this.examRecordService.update(record);
		// 更新排名数据
		this.rankInfoService.updateRank(record);
		return Boolean.TRUE;
	}

	/**
	 * 异步提交
	 */
	@Transactional
	public boolean submitAsync(Answer answer) {
		long start = System.currentTimeMillis();
		String currentUsername = SysUtil.getUser();
		String tenantCode = SysUtil.getTenantCode();
		answer.setOperator(currentUsername);
		answer.setTenantCode(tenantCode);

		ExaminationRecord examRecord = new ExaminationRecord();
		examRecord.setCommonValue(currentUsername, tenantCode);
		examRecord.setId(answer.getExamRecordId());
		// 提交时间
		examRecord.setEndTime(examRecord.getCreateTime());
		examRecord.setSubmitStatus(SubmitStatusEnum.SUBMITTED.getValue());
		// 更新考试状态
		boolean success = examRecordService.update(examRecord) > 0;
		submitAsync(examRecord.getId(), currentUsername, tenantCode);
		log.debug("async submit examination, username: {}, time consuming: {}ms", currentUsername,
				System.currentTimeMillis() - start);
		return success;
	}

	@Transactional
	public Boolean submitAll(List<AnswerDto> answers) {
		if (CollectionUtils.isEmpty(answers)) {
			return Boolean.FALSE;
		}
		String userCode = SysUtil.getUser();
		String tenantCode = SysUtil.getTenantCode();
		Long recordId = answers.get(0).getExamRecordId();
		Long[] subjectIds = answers.stream().map(AnswerDto::getSubjectId).toArray(Long[]::new);
		List<Answer> dbAnswers = answerService.batchFindByRecordIdAndSubjectId(recordId, subjectIds);
		Map<Long, Answer> answerMap = dbAnswers.stream().collect(Collectors.toMap(Answer::getSubjectId, s -> s));
		// 区分更新和插入
		List<Answer> inserts = Lists.newArrayList();
		List<Answer> updates = Lists.newArrayList();
		Date endTime = new Date();
		for (AnswerDto answer : answers) {
			Answer newAnswer = new Answer();
			BeanUtils.copyProperties(answer, newAnswer);
			newAnswer.setEndTime(endTime);
			Answer dbAnswer = answerMap.get(answer.getSubjectId());
			if (dbAnswer != null) {
				newAnswer.setCommonValue(userCode, tenantCode);
				newAnswer.setAnswer(answer.getAnswer());
				updates.add(newAnswer);
			} else {
				newAnswer.setNewRecord(true);
				newAnswer.setCommonValue(userCode, tenantCode);
				newAnswer.setMarkStatus(AnswerConstant.TO_BE_MARKED);
				newAnswer.setAnswerType(AnswerConstant.WRONG);
				inserts.add(newAnswer);
			}
		}
		if (CollectionUtils.isNotEmpty(inserts)) {
			int update = answerService.batchInsert(inserts);
			log.info("batch insert success, recordId: {}, size: {}", recordId, update);
		}
		if (CollectionUtils.isNotEmpty(updates)) {
			int update = answerService.batchUpdate(updates);
			log.info("batch update success, recordId: {}, size: {}", recordId, update);
		}
		submit(recordId, userCode, tenantCode);
		return Boolean.TRUE;
	}

	/**
	 * 移动端提交答题
	 */
	@Transactional
	public boolean anonymousUserSubmit(Long examinationId, String identifier, List<SubjectDto> dtos) {
		long startMs = System.currentTimeMillis();
		if (StringUtils.isBlank(identifier) || CollectionUtils.isEmpty(dtos)) {
			return false;
		}

		Examination examination = examinationService.get(examinationId);
		if (examination == null) {
			return false;
		}

		String tenantCode = SysUtil.getTenantCode();
		Date now = DateUtils.asDate(LocalDateTime.now());
		// 判断用户是否存在，不存在则自动创建
		R<UserVo> r = null;
		if (!RUtil.isSuccess(r) || r.getResult() == null) {
			return false;
		}

		// TODO 自动注册账号
		UserVo user = r.getResult();
		// 保存考试记录
		ExaminationRecord record = new ExaminationRecord();
		record.setCommonValue(identifier, tenantCode);
		record.setUserId(user.getUserId());

		// 初始化 Answer
		List<Answer> answers = new ArrayList<>(dtos.size());
		List<Long> subjectIds = Lists.newArrayListWithExpectedSize(dtos.size());
		dtos.forEach(dto -> {
			Answer a = new Answer();
			a.setCommonValue(identifier, tenantCode);
			a.setAnswer(dto.getAnswer().getAnswer());
			a.setExamRecordId(record.getId());
			a.setEndTime(now);
			a.setSubjectId(dto.getId());
			a.setType(dto.getType());
			a.setAnswerType(AnswerConstant.WRONG);
			subjectIds.add(dto.getId());
			answers.add(a);
		});
		Map<Integer, List<Answer>> distinct = distinctAnswer(subjectIds.toArray(new Long[0]), answers);
		HandlerFactory.Result result = HandlerFactory.handleAll(distinct);
		// 记录总分、正确题目数、错误题目数
		record.setScore(result.getScore());
		record.setCorrectNumber(result.getCorrectNum());
		record.setInCorrectNumber(result.getInCorrectNum());
		// 更新状态为统计完成，否则需要阅卷完成后才更改统计状态
		record.setType(examination.getType());
		record.setExaminationId(examinationId);
		record.setSubmitStatus(SubmitStatusEnum.CALCULATED.getValue());
		record.setStartTime(now);
		record.setEndTime(now);
		examRecordService.insert(record);
		answers.forEach(answerService::insert);
		log.info("anonymousUser submit, examinationId:{}, identifier: {}, time consuming: {}ms", examinationId,
				identifier, System.currentTimeMillis() - startMs);
		return true;
	}

	/**
	 * 分类题目
	 */
	public Map<Integer, List<Answer>> distinctAnswer(Long[] subjectIds, List<Answer> answers) {
		List<Subjects> subjects = subjectsService.findBySubjectIds(subjectIds);
		Map<Long, Integer> typeMap = ExamUtil.toMap(subjects);
		return ExamUtil.distinctAnswer(answers, typeMap);
	}

	/**
	 * 成绩详情
	 */
	public ExamRecordDetailsDto details(Long id) {
		ExaminationRecord record = examRecordService.get(id);
		SgPreconditions.checkNull(record, "record is not exist");
		Examination examination = examinationService.get(record.getExaminationId());
		SgPreconditions.checkNull(examination, "examination is not exist");
		ExamRecordDetailsDto result = new ExamRecordDetailsDto();
		ExaminationRecordDto dto = new ExaminationRecordDto();
		// 答题卡
		List<CardDto> cards = Lists.newArrayList();
		result.setRecord(dto);
		result.setCards(cards);
		BeanUtils.copyProperties(examination, dto);
		dto.setId(record.getId());
		dto.setTypeLabel(ExaminationType.matchByValue(examination.getType()).getName());
		dto.setStartTime(record.getStartTime());
		dto.setEndTime(record.getEndTime());
		dto.setScore(ObjectUtil.getDouble(record.getScore()));
		dto.setUserId(record.getUserId());
		dto.setExaminationId(record.getExaminationId());
		dto.setDuration(DateUtils.durationNoNeedMillis(record.getStartTime(), record.getEndTime()));
		// 正确题目数
		dto.setCorrectNumber(ObjectUtil.getInt(record.getCorrectNumber()));
		dto.setInCorrectNumber(ObjectUtil.getInt(record.getInCorrectNumber()));
		// 提交状态
		dto.setSubmitStatus(record.getSubmitStatus());
		SubmitStatusEnum status = SubmitStatusEnum.match(record.getSubmitStatus(), SubmitStatusEnum.NOT_SUBMITTED);
		dto.setSubmitStatusName(status.getName());
		// 答题列表
		dto.setAnswers(getDetailAnswers(record, cards));
		examRecordService.fillExamUserInfo(Collections.singletonList(dto), new Long[]{record.getUserId()});
		return result;
	}

	public List<AnswerDto> getDetailAnswers(ExaminationRecord examRecord, List<CardDto> cards) {
		List<AnswerDto> list = Lists.newArrayList();
		List<Answer> answers = answerService.findListByExamRecordId(examRecord.getId());
		if (CollectionUtils.isEmpty(answers)) {
			return list;
		}

		Map<Long, Answer> answerMap = answers.stream().collect(Collectors.toMap(Answer::getSubjectId, e -> e));
		List<ExaminationSubject> esList = examinationService.findListByExaminationId(examRecord.getExaminationId());
		if (CollectionUtils.isEmpty(esList)) {
			return list;
		}

		List<Long> subjectIds = esList.stream().map(ExaminationSubject::getSubjectId).collect(Collectors.toList());
		Collection<SubjectDto> dtoList = subjectsService.getSubjects(subjectIds);
		Map<Long, SubjectDto> map = dtoList.stream().collect(Collectors.toMap(SubjectDto::getId, e -> e));
		for (ExaminationSubject es : esList) {
			CardDto card = new CardDto();
			card.setSort(es.getSort());
			card.setSubjectId(es.getSubjectId());
			cards.add(card);
			Answer answer = answerMap.get(es.getSubjectId());
			if (answer != null) {
				AnswerDto dto = new AnswerDto();
				BeanUtils.copyProperties(answer, dto);
				dto.setSubject(map.get(answer.getSubjectId()));
				dto.setDuration(DateUtils.duration(answer.getStartTime(), answer.getEndTime()));
				dto.setSpeechPlayCnt(answer.getSpeechPlayCnt());
				list.add(dto);
			}
		}
		return list;
	}

	/**
	 * 异步提交
	 */
	public void submitAsync(Long recordId, String userCode, String tenantCode) {
		StopWatch watch = StopWatchUtil.start();
		ListenableFuture<Boolean> future = executorHolder.getSubmitExecutor()
				.submit(() -> submit(recordId, userCode, tenantCode));
		Futures.addCallback(future, new FutureCallback<>() {
			@Override
			public void onSuccess(@Nullable Boolean result) {
				log.info("submit future finished, recordId: {}, user: {}, took: {}", recordId, userCode,
						StopWatchUtil.stop(watch));
			}

			@Override
			public void onFailure(@Nullable Throwable e) {
				log.error("submit future failed, recordId: {}, user: {}", recordId, userCode, e);
			}
		}, executorHolder.getSubmitExecutor());
	}
}
