package com.github.tangyi.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StatusEnum {

	ENABLE("启用", 0), DISABLE("禁用", 1);

	private final String name;
	private final Integer value;

	public static StatusEnum matchByValue(Integer value) {
		for (StatusEnum item : StatusEnum.values()) {
			if (item.value.equals(value)) {
				return item;
			}
		}
		return ENABLE;
	}

	public static StatusEnum matchByName(String name) {
		for (StatusEnum item : StatusEnum.values()) {
			if (item.name.equals(name)) {
				return item;
			}
		}
		return ENABLE;
	}
}
