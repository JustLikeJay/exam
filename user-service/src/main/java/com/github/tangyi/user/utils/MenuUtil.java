package com.github.tangyi.user.utils;

import com.github.tangyi.api.user.constant.MenuConstant;
import com.github.tangyi.api.user.model.Menu;
import com.github.tangyi.user.excel.model.MenuExcelModel;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单工具类
 *
 * @author tangyi
 * @date 2018/10/28 15:57
 */
public class MenuUtil {

	private MenuUtil() {
	}

	public static boolean isPermission(Menu menu) {
		return MenuConstant.MENU_TYPE_PERMISSION.equals(menu.getType());
	}

	/**
	 * 转换对象
	 * @param menus menus
	 * @return List
	 */
	public static List<MenuExcelModel> convertToExcelModel(List<Menu> menus) {
		List<MenuExcelModel> menuExcelModels = new ArrayList<>(menus.size());
		menus.forEach(menu -> {
			MenuExcelModel menuExcelModel = new MenuExcelModel();
			BeanUtils.copyProperties(menu, menuExcelModel);
			menuExcelModels.add(menuExcelModel);
		});
		return menuExcelModels;
	}
}