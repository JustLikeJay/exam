package com.github.tangyi.user.service.attach;

import com.github.tangyi.api.user.constant.AttachmentConstant;
import com.github.tangyi.api.user.model.AttachGroup;
import com.github.tangyi.api.user.service.IAttachGroupService;
import com.github.tangyi.common.service.CrudService;
import com.github.tangyi.constants.UserCacheName;
import com.github.tangyi.user.mapper.attach.AttachGroupMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@AllArgsConstructor
@Service
public class AttachGroupService extends CrudService<AttachGroupMapper, AttachGroup> implements IAttachGroupService {

	private void validateUrlExpire(AttachGroup group) {
		if (group.getUrlExpire() <= 0) {
			group.setUrlExpire(AttachmentConstant.DEFAULT_EXPIRE_SECOND);
		}
	}

	@Override
	@Cacheable(value = UserCacheName.ATTACHMENT_GROUP, key = "#id")
	public AttachGroup get(Long id) {
		return super.get(id);
	}

	@Override
	@Cacheable(value = UserCacheName.ATTACHMENT_GROUP, key = "#groupCode")
	public AttachGroup findByGroupCode(String groupCode) {
		return this.dao.findByIdentifier(groupCode);
	}

	@Override
	@Transactional
	public int insert(AttachGroup group) {
		group.setCommonValue();
		validateUrlExpire(group);
		return super.insert(group);
	}

	@Override
	@Transactional
	@CacheEvict(value = UserCacheName.ATTACHMENT_GROUP, key = "#group.groupCode")
	public int update(AttachGroup group) {
		group.setCommonValue();
		validateUrlExpire(group);
		return super.update(group);
	}

	@Override
	@Transactional
	@CacheEvict(value = UserCacheName.ATTACHMENT_GROUP, key = "#group.groupCode")
	public int delete(AttachGroup group) {
		return super.delete(group);
	}

	@Override
	@Transactional
	@CacheEvict(value = UserCacheName.ATTACHMENT_GROUP, allEntries = true)
	public int deleteAll(Long[] ids) {
		return super.deleteAll(ids);
	}
}
