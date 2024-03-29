package com.github.tangyi.common.base;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.github.tangyi.common.utils.SysUtil;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class BaseEntity<T> implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;
	public static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String TIMEZONE = "GMT+8";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "JDBC")
	@JsonSerialize(using = ToStringSerializer.class)
	protected Long id;

	protected String creator;

	@Column(name = "create_time")
	@JSONField(format = DATE_FORMAT)
	@JsonFormat(pattern = DATE_FORMAT, timezone = TIMEZONE)
	protected Date createTime;

	protected String operator;

	@Column(name = "update_time")
	@JSONField(format = DATE_FORMAT)
	@JsonFormat(pattern = DATE_FORMAT, timezone = TIMEZONE)
	protected Date updateTime;

	/**
	 * 逻辑删除标记：0 正常，1 删除
	 */
	@Column(name = "is_deleted")
	private Boolean isDeleted;

	@Column(name = "tenant_code")
	protected String tenantCode;

	protected boolean isNewRecord;

	public boolean isNewRecord() {
		return this.isNewRecord || this.getId() == null;
	}

	public void setCommonValue() {
		setCommonValue(SysUtil.getUser(), SysUtil.getTenantCode());
	}

	public void setCommonValue(String userCode, String tenantCode) {
		Date now = new Date();
		if (this.isNewRecord()) {
			this.createTime = now;
			this.creator = userCode;
		}
		if (this.updateTime == null) {
			this.updateTime = now;
		}
		this.operator = userCode;
		if (this.isDeleted == null) {
			this.isDeleted = Boolean.FALSE;
		}
		this.tenantCode = tenantCode;
	}

	public void clearCommonValue() {
		this.creator = null;
		this.createTime = null;
		this.operator = null;
		this.updateTime = null;
		this.isDeleted = null;
		this.tenantCode = null;
	}

	@SuppressWarnings({"rawtypes"})
	public static <E extends BaseEntity> Long[] ids(List<E> entities) {
		return entities.stream().map(BaseEntity::getId).toArray(Long[]::new);
	}
}

