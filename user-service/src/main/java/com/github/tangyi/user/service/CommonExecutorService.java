package com.github.tangyi.user.service;

import com.github.tangyi.common.utils.EnvUtils;
import com.github.tangyi.common.utils.executor.ExecutorUtils;
import com.google.common.util.concurrent.ListeningExecutorService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

/**
 * 通用线程池
 * @author tangyi
 * @date 2022/5/20 1:13 下午
 */
@Slf4j
@Service
public class CommonExecutorService {

	public static final int EXECUTOR_QUEUE_SIZE = EnvUtils.getInt("EXECUTOR_QUEUE_SIZE", 2000);

	public static final int EXECUTOR_CORE_SIZE = EnvUtils.getInt("EXECUTOR_CORE_SIZE",
			Runtime.getRuntime().availableProcessors() + 1);

	private ListeningExecutorService commonExecutor;

	private ListeningExecutorService examExecutor;

	private ListeningExecutorService submitExecutor;

	@PostConstruct
	public void init() {
		log.info("start to init common executor");
		int coreSize = EXECUTOR_CORE_SIZE;
		this.commonExecutor = ExecutorUtils.newListeningExecutor("common-%d", coreSize, EXECUTOR_QUEUE_SIZE);
		log.info("init common executor finished, coreSize: {}", coreSize);

		log.info("start to init exam executor");
		this.examExecutor = ExecutorUtils.newListeningExecutor("exam-%d", coreSize, EXECUTOR_QUEUE_SIZE);
		log.info("init exam executor finished, coreSize: {}", coreSize);

		log.info("start to init submit exam executor");
		this.submitExecutor = ExecutorUtils.newListeningExecutor("submit-exam-%d", coreSize, EXECUTOR_QUEUE_SIZE);
		log.info("init submit exam executor finished, coreSize: {}", coreSize);
	}

	public ListeningExecutorService getCommonExecutor() {
		return commonExecutor;
	}

	public ListeningExecutorService getExamExecutor() {
		return examExecutor;
	}

	public ListeningExecutorService getSubmitExecutor() {
		return submitExecutor;
	}
}