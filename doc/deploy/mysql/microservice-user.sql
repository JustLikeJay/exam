/*
 Navicat Premium Data Transfer

 Source Server         : mysql_localhost
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost:3306
 Source Schema         : microservice-user

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 09/06/2019 17:17:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attach_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件大小',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `fast_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件ID',
  `busi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `busi_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务模块',
  `busi_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型 0-普通，1-头像',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------
INSERT INTO `sys_attachment` VALUES ('587326094462554112', '简易.jpg', '30366', 'group1', 'group1/M00/00/00/rBAAClz8zQeAcxdFAAB2nqimI80188.jpg', NULL, NULL, '1', 'admin', '2019-06-09 17:04:12', 'admin', '2019-06-09 17:04:12', '0', 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父部门id',
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序号',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0-启用，1-禁用',
  `dept_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  `dept_leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门负责人',
  `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('571347099191480320', '测试部门', '-1', '30', 'admin', '2019-04-26 14:49:23', 'admin', '2019-06-07 13:24:53', '0', 'EXAM', '0', '测试部门', '管理员', 'gitee');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `title` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志标题',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户的IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户代理信息',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的URI',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的方式',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作提交的数据',
  `exception` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `service_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗时',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向url',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('571348650370928640', '个人管理', 'personal', '/api/user/v1/personal/**', '-1', 'form', '30', '0', 'admin', '2019-04-26 14:55:33', 'admin', '2019-04-26 15:04:16', '0', 'EXAM', 'Layout', '/personal', NULL, '个人管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571349816924311552', '个人资料', 'personal:message', '/api/user/v1/user/updateInfo', '571348650370928640', '', '29', '0', 'admin', '2019-04-26 15:00:11', 'admin', '2019-04-26 15:00:11', '0', 'EXAM', 'views/personal/message', 'message', NULL, '个人资料', 'gitee');
INSERT INTO `sys_menu` VALUES ('571350099653955584', '修改密码', 'personal:password', '/api/user/v1/user/updateInfo', '571348650370928640', '', '30', '0', 'admin', '2019-04-26 15:01:18', 'admin', '2019-04-26 15:01:18', '0', 'EXAM', 'views/personal/password', 'password', NULL, '修改密码', 'gitee');
INSERT INTO `sys_menu` VALUES ('571351763521769472', '附件管理', 'attachment', '/api/user/v1/attachment/**', '-1', 'excel', '10', '0', 'admin', '2019-04-26 15:07:55', 'admin', '2019-04-26 15:09:59', '0', 'EXAM', 'Layout', '/attachment', NULL, '附件管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571352087896657920', '附件列表', 'attachment:list', '/api/user/v1/attachment/list', '571351763521769472', '', '30', '0', 'admin', '2019-04-26 15:09:12', 'admin', '2019-04-26 15:09:12', '0', 'EXAM', 'views/attachment/list', 'list', NULL, '附件列表', 'gitee');
INSERT INTO `sys_menu` VALUES ('571352797233156096', '考务管理', 'exam', '/api/exam/**', '-1', 'nested', '8', '0', 'admin', '2019-04-26 15:12:02', 'admin', '2019-05-23 21:28:32', '0', 'EXAM', 'Layout', '/exam', NULL, '考务管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353230286655488', '课程管理', 'exam:course', '/api/exam/v1/course/**', '571352797233156096', '', '1', '0', 'admin', '2019-04-26 15:13:45', 'admin', '2019-04-26 15:13:45', '0', 'EXAM', 'views/exam/course', 'course', NULL, '课程管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353525381107712', '考试管理', 'exam:exam', '/api/exam/v1/examination/**', '571352797233156096', '', '2', '0', 'admin', '2019-04-26 15:14:55', 'admin', '2019-04-26 15:14:55', '0', 'EXAM', 'views/exam/exam', 'exam', NULL, '考试管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353992756596736', '题库管理', 'exam:subject', '/api/exam/v1/subject/**', '571352797233156096', '', '3', '0', 'admin', '2019-04-26 15:16:47', 'admin', '2019-04-26 15:16:47', '0', 'EXAM', 'views/exam/subject', 'subject', NULL, '题库管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571354428217626624', '成绩管理', 'exam:examRecord', '/api/exam/v1/examRecord/**', '571352797233156096', '', '4', '0', 'admin', '2019-04-26 15:18:30', 'admin', '2019-04-26 15:18:30', '0', 'EXAM', 'views/exam/examRecord', 'score', NULL, '成绩管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571354823258148864', '知识库', 'exam:knowledge', '/api/exam/v1/knowledge/**', '571352797233156096', '', '5', '0', 'admin', '2019-04-26 15:20:05', 'admin', '2019-04-26 15:20:05', '0', 'EXAM', 'views/exam/knowledge', 'knowledge', NULL, '知识库', 'gitee');
INSERT INTO `sys_menu` VALUES ('571355240792723456', '新增课程', 'exam:course:add', NULL, '571353230286655488', '', '1', '1', 'admin', '2019-04-26 15:21:44', 'admin', '2019-04-26 15:21:44', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355418715099136', '修改课程', 'exam:course:edit', NULL, '571353230286655488', '', '2', '1', 'admin', '2019-04-26 15:22:27', 'admin', '2019-04-26 15:22:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355486121758720', '删除课程', 'exam:course:del', NULL, '571353230286655488', '', '3', '1', 'admin', '2019-04-26 15:22:43', 'admin', '2019-04-26 15:22:43', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355686403969024', '新增考试', 'exam:exam:add', NULL, '571353525381107712', '', '1', '1', 'admin', '2019-04-26 15:23:30', 'admin', '2019-04-26 15:23:30', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355830226653184', '修改课程', 'exam:exam:edit', NULL, '571353525381107712', '', '2', '1', 'admin', '2019-04-26 15:24:05', 'admin', '2019-04-26 15:24:05', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355921259827200', '删除考试', 'exam:exam:del', NULL, '571353525381107712', '', '3', '1', 'admin', '2019-04-26 15:24:26', 'admin', '2019-04-26 15:24:26', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356206782877696', '题目管理', 'exam:exam:subject', NULL, '571353525381107712', '', '4', '1', 'admin', '2019-04-26 15:25:34', 'admin', '2019-04-26 15:25:34', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356537642160128', '导出题目', 'exam:exam:subject:export', NULL, '571353525381107712', '', '5', '1', 'admin', '2019-04-26 15:26:53', 'admin', '2019-04-26 15:27:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356877741494272', '导入题目', 'exam:exam:subject:import', NULL, '571353525381107712', '', '6', '1', 'admin', '2019-04-26 15:28:14', 'admin', '2019-04-26 15:28:14', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357072436891648', '新增题目', 'exam:exam:subject:add', NULL, '571353525381107712', '', '7', '1', 'admin', '2019-04-26 15:29:01', 'admin', '2019-04-26 15:29:01', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357235276550144', '删除题目', 'exam:exam:subject:del', NULL, '571353525381107712', '', '8', '1', 'admin', '2019-04-26 15:29:40', 'admin', '2019-04-26 15:29:40', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357509638557696', '新增题目', 'exam:subject:bank:add', NULL, '571353992756596736', '', '1', '1', 'admin', '2019-04-26 15:30:45', 'admin', '2019-04-26 15:30:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357821778661376', '修改题目', 'exam:subject:bank:edit', NULL, '571353992756596736', '', '2', '1', 'admin', '2019-04-26 15:32:00', 'admin', '2019-04-26 15:32:00', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357937931522048', '删除题目', 'exam:subject:bank:del', NULL, '571353992756596736', '', '3', '1', 'admin', '2019-04-26 15:32:27', 'admin', '2019-04-26 17:41:21', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358188264361984', '新增题目分类', 'exam:subject:category:add', NULL, '571353992756596736', '', '4', '1', 'admin', '2019-04-26 15:33:27', 'admin', '2019-04-26 15:33:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358308477308928', '修改题目分类', 'exam:subject:category:edit', NULL, '571353992756596736', '', '5', '1', 'admin', '2019-04-26 15:33:56', 'admin', '2019-04-26 15:33:56', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358407353831424', '删除题目分类', 'exam:subject:category:del', NULL, '571353992756596736', '', '6', '1', 'admin', '2019-04-26 15:34:19', 'admin', '2019-04-26 15:34:19', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358617991778304', '导入题目', 'exam:subject:bank:import', NULL, '571353992756596736', '', '7', '1', 'admin', '2019-04-26 15:35:09', 'admin', '2019-04-26 15:35:09', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358928483520512', '导出题目', 'exam:subject:bank:export', NULL, '571353992756596736', '', '8', '1', 'admin', '2019-04-26 15:36:23', 'admin', '2019-04-26 15:36:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571359163205160960', '导出成绩', 'exam:examRecord:export', NULL, '571354428217626624', '', '30', '1', 'admin', '2019-04-26 15:37:19', 'admin', '2019-04-26 15:37:19', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571361163502292992', '系统监控', 'sys', '/api/monitor/**', '-1', 'chart', '7', '0', 'admin', '2019-04-26 15:45:16', 'admin', '2019-04-26 15:59:22', '0', 'EXAM', 'Layout', '/monitor', NULL, '系统监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571361526066319360', '日志监控', 'monitor:log', '/api/user/v1/log/**', '571361163502292992', '', '30', '0', 'admin', '2019-04-26 15:46:43', 'admin', '2019-04-26 15:46:43', '0', 'EXAM', 'views/monitor/log', 'log', NULL, '日志监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571361746552492032', 'consul监控', 'monitor:service', '/api/monitor/service/**', '571361163502292992', '', '31', '0', 'admin', '2019-04-26 15:47:35', 'admin', '2019-04-26 15:47:35', '0', 'EXAM', NULL, 'http://localhost:8500', NULL, 'consul监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571362994005610496', 'zipkin监控', 'monitor:link', '/api/monitor/**', '571361163502292992', '', '32', '0', 'admin', '2019-04-26 15:52:33', 'admin', '2019-04-26 15:52:33', '0', 'EXAM', NULL, 'http://localhost:9411/zipkin', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571363268497641472', '服务监控', 'monitor:admin', '/api/monitor/**', '571361163502292992', '', '33', '0', 'admin', '2019-04-26 15:53:38', 'admin', '2019-04-26 15:53:38', '0', 'EXAM', NULL, 'http://localhost:8085/admin', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571363537549660160', '接口文档', 'monitor:document', '/api/monitor/**', '571361163502292992', '', '34', '0', 'admin', '2019-04-26 15:54:42', 'admin', '2019-04-26 15:54:42', '0', 'EXAM', NULL, 'http://localhost:8000/swagger-ui.html', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571364115214372864', '删除日志', 'monitor:log:del', NULL, '571361526066319360', '', '30', '1', 'admin', '2019-04-26 15:57:00', 'admin', '2019-04-26 15:57:00', '0', 'EXAM', NULL, NULL, NULL, '删除日志', 'gitee');
INSERT INTO `sys_menu` VALUES ('571365178965364736', '首页', 'dashboard', '/', '-1', 'dashboard', '0', '0', 'admin', '2019-04-26 16:01:14', 'admin', '2019-06-07 13:43:10', '0', 'EXAM', 'Layout', '/dashboard', NULL, '首页', 'gitee');
INSERT INTO `sys_menu` VALUES ('571367565360762880', '系统管理', 'sys', '/api/user/v1/**', '-1', 'component', '1', '0', 'admin', '2019-04-26 16:10:43', 'admin', '2019-05-23 21:52:26', '0', 'EXAM', 'Layout', '/sys', NULL, '系统管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571367969767165952', '用户管理', 'sys:user', '/api/user/v1/user/**', '571367565360762880', '', '2', '0', 'admin', '2019-04-26 16:12:19', 'admin', '2019-04-26 16:12:19', '0', 'EXAM', 'views/sys/user', 'user', NULL, '用户管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571368181252362240', '部门管理', 'sys:dept', '/api/user/v1/dept/**', '571367565360762880', '', '8', '0', 'admin', '2019-04-26 16:13:09', 'admin', '2019-04-26 16:13:09', '0', 'EXAM', 'views/sys/dept', 'dept', NULL, '部门管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571368627413061632', '角色管理', 'sys:role', '/api/user/v1/role/**', '571367565360762880', '', '9', '0', 'admin', '2019-04-26 16:14:56', 'admin', '2019-04-26 16:14:56', '0', 'EXAM', 'views/sys/role', 'role', NULL, '角色管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369094226513920', '菜单管理', 'sys:menu', '/api/user/v1/menu/**', '571367565360762880', '', '10', '0', 'admin', '2019-04-26 16:16:47', 'admin', '2019-04-26 16:16:47', '0', 'EXAM', 'views/sys/menu', 'menu', NULL, '菜单管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369709904203776', '终端管理', 'sys:client', '/api/user/v1/client/**', '571367565360762880', '', '11', '0', 'admin', '2019-04-26 16:19:14', 'admin', '2019-04-26 16:19:14', '0', 'EXAM', 'views/sys/client', 'client', NULL, '终端管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369965811273728', '路由管理', 'sys:route', '/api/user/route/**', '571367565360762880', '', '12', '0', 'admin', '2019-04-26 16:20:15', 'admin', '2019-04-26 16:20:15', '0', 'EXAM', 'views/sys/route', 'route', NULL, '路由管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571371375550402560', '新增用户', 'sys:user:add', NULL, '571367969767165952', '', '1', '1', 'admin', '2019-04-26 16:25:51', 'admin', '2019-04-26 16:25:51', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371477828505600', '删除用户', 'sys:user:del', NULL, '571367969767165952', '', '2', '1', 'admin', '2019-04-26 16:26:15', 'admin', '2019-04-26 16:26:15', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371606652358656', '修改用户', 'sys:user:edit', NULL, '571367969767165952', '', '3', '1', 'admin', '2019-04-26 16:26:46', 'admin', '2019-04-26 16:26:46', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371699010932736', '导出用户', 'sys:user:export', NULL, '571367969767165952', '', '4', '1', 'admin', '2019-04-26 16:27:08', 'admin', '2019-04-26 16:27:08', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371773073952768', '导入用户', 'sys:user:import', NULL, '571367969767165952', '', '5', '1', 'admin', '2019-04-26 16:27:26', 'admin', '2019-04-26 16:27:26', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372425787346944', '新增部门', 'sys:dept:add', NULL, '571368181252362240', '', '1', '1', 'admin', '2019-04-26 16:30:01', 'admin', '2019-04-26 16:30:01', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372559308820480', '修改部门', 'sys:dept:edit', NULL, '571368181252362240', '', '2', '1', 'admin', '2019-04-26 16:30:33', 'admin', '2019-04-26 16:30:33', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372707153842176', '删除部门', 'sys:dept:del', NULL, '571368181252362240', '', '3', '1', 'admin', '2019-04-26 16:31:08', 'admin', '2019-04-26 17:41:02', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373219269971968', '新增角色', 'sys:role:add', NULL, '571368627413061632', '', '1', '1', 'admin', '2019-04-26 16:33:11', 'admin', '2019-04-26 16:33:11', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373292582211584', '修改角色', 'sys:role:edit', NULL, '571368627413061632', '', '2', '1', 'admin', '2019-04-26 16:33:28', 'admin', '2019-04-26 16:33:28', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373363046518784', '删除角色', 'sys:role:del', NULL, '571368627413061632', '', '3', '1', 'admin', '2019-04-26 16:33:45', 'admin', '2019-04-26 16:33:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373478440210432', '分配权限', 'sys:role:auth', NULL, '571368627413061632', '', '4', '1', 'admin', '2019-04-26 16:34:12', 'admin', '2019-04-26 16:34:12', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373881496047616', '新增菜单', 'sys:menu:add', NULL, '571369094226513920', '', '1', '1', 'admin', '2019-04-26 16:35:48', 'admin', '2019-04-26 16:35:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373962609692672', '修改菜单', 'sys:menu:edit', NULL, '571369094226513920', '', '2', '1', 'admin', '2019-04-26 16:36:08', 'admin', '2019-04-26 16:36:08', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374025859796992', '删除菜单', 'sys:menu:del', NULL, '571369094226513920', '', '3', '1', 'admin', '2019-04-26 16:36:23', 'admin', '2019-04-26 16:36:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374113881460736', '导入菜单', 'sys:menu:import', NULL, '571369094226513920', '', '4', '1', 'admin', '2019-04-26 16:36:44', 'admin', '2019-04-26 16:36:44', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374178956087296', '导出菜单', 'sys:menu:export', NULL, '571369094226513920', '', '5', '1', 'admin', '2019-04-26 16:36:59', 'admin', '2019-04-26 16:36:59', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374593844056064', '新增终端', 'sys:client:add', NULL, '571369709904203776', '', '1', '1', 'admin', '2019-04-26 16:38:38', 'admin', '2019-04-26 16:38:38', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374671245742080', '修改终端', 'sys:client:edit', NULL, '571369709904203776', '', '2', '1', 'admin', '2019-04-26 16:38:57', 'admin', '2019-04-26 16:38:57', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374747460440064', '删除终端', 'sys:client:del', NULL, '571369709904203776', '', '3', '1', 'admin', '2019-04-26 16:39:15', 'admin', '2019-04-26 16:39:15', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374884270247936', '新增路由', 'sys:route:add', NULL, '571369965811273728', '', '1', '1', 'admin', '2019-04-26 16:39:48', 'admin', '2019-04-26 16:39:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374951823708160', '修改路由', 'sys:route:edit', NULL, '571369965811273728', '', '2', '1', 'admin', '2019-04-26 16:40:04', 'admin', '2019-04-26 16:40:04', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571375033570693120', '删除路由', 'sys:route:del', NULL, '571369965811273728', '', '3', '1', 'admin', '2019-04-26 16:40:23', 'admin', '2019-04-26 16:40:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571375135655858176', '刷新路由', 'sys:route:refresh', NULL, '571369965811273728', '', '4', '1', 'admin', '2019-04-26 16:40:47', 'admin', '2019-04-26 16:40:47', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571454722205159424', '修改题目', 'exam:exam:subject:edit', NULL, '571353525381107712', '', '9', '1', 'admin', '2019-04-26 21:57:02', 'admin', '2019-04-26 21:57:02', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581237996276289536', '租户中心', 'tenant', '/api/user/v1/tenent/**', '-1', 'component', '3', '0', 'admin', '2019-05-23 21:52:17', 'admin', '2019-05-23 22:00:51', '0', 'EXAM', 'Layout', '/tenant', NULL, '租户管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('581238351663861760', '单位管理', 'tenant:tenant', '/api/user/tenant/**', '581237996276289536', '', '1', '0', 'admin', '2019-05-23 21:53:41', 'admin', '2019-05-23 21:55:30', '0', 'EXAM', 'views/tenant/tenant', 'tenant', NULL, '单位管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('581238560250793984', '新增单位', 'tenant:tenant:add', NULL, '581238351663861760', '', '1', '1', 'admin', '2019-05-23 21:54:31', 'admin', '2019-05-23 21:55:05', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581238795467362304', '修改单位', 'tenant:tenant:edit', '', '581238351663861760', '', '2', '1', 'admin', '2019-05-23 21:55:27', 'admin', '2019-05-23 21:55:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581238883182841856', '删除单位', 'tenant:tenant:del', NULL, '581238351663861760', '', '3', '1', 'admin', '2019-05-23 21:55:48', 'admin', '2019-05-23 21:55:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `is_default` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否默认',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 0-启用，1-禁用',
  `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('571347202849509376', '管理员', 'role_admin', '管理员', '0', 'admin', '2019-04-26 14:49:48', 'admin', '2019-06-07 14:24:17', '0', 'EXAM', '0', 'gitee');
INSERT INTO `sys_role` VALUES ('571347272906969088', '教师', 'role_teacher', '教师', '0', 'admin', '2019-04-26 14:50:04', 'admin', '2019-05-19 17:40:08', '0', 'EXAM', '0', 'gitee');
INSERT INTO `sys_role` VALUES ('571347357346697216', '普通用户', 'role_user', '普通用户', '1', 'admin', '2019-04-26 14:50:25', 'admin', '2019-05-22 22:15:42', '0', 'EXAM', '0', 'gitee');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('581239021590679552', '571347202849509376', '571365178965364736');
INSERT INTO `sys_role_menu` VALUES ('581239021590679553', '571347202849509376', '571367565360762880');
INSERT INTO `sys_role_menu` VALUES ('581239021590679554', '571347202849509376', '571367969767165952');
INSERT INTO `sys_role_menu` VALUES ('581239021590679555', '571347202849509376', '571371375550402560');
INSERT INTO `sys_role_menu` VALUES ('581239021590679556', '571347202849509376', '571371477828505600');
INSERT INTO `sys_role_menu` VALUES ('581239021590679557', '571347202849509376', '571371606652358656');
INSERT INTO `sys_role_menu` VALUES ('581239021590679558', '571347202849509376', '571371699010932736');
INSERT INTO `sys_role_menu` VALUES ('581239021590679559', '571347202849509376', '571371773073952768');
INSERT INTO `sys_role_menu` VALUES ('581239021590679560', '571347202849509376', '571368181252362240');
INSERT INTO `sys_role_menu` VALUES ('581239021590679561', '571347202849509376', '571372425787346944');
INSERT INTO `sys_role_menu` VALUES ('581239021590679562', '571347202849509376', '571372559308820480');
INSERT INTO `sys_role_menu` VALUES ('581239021590679563', '571347202849509376', '571372707153842176');
INSERT INTO `sys_role_menu` VALUES ('581239021590679564', '571347202849509376', '571368627413061632');
INSERT INTO `sys_role_menu` VALUES ('581239021590679565', '571347202849509376', '571373219269971968');
INSERT INTO `sys_role_menu` VALUES ('581239021590679566', '571347202849509376', '571373292582211584');
INSERT INTO `sys_role_menu` VALUES ('581239021590679567', '571347202849509376', '571373363046518784');
INSERT INTO `sys_role_menu` VALUES ('581239021590679568', '571347202849509376', '571373478440210432');
INSERT INTO `sys_role_menu` VALUES ('581239021590679569', '571347202849509376', '571369094226513920');
INSERT INTO `sys_role_menu` VALUES ('581239021590679570', '571347202849509376', '571373881496047616');
INSERT INTO `sys_role_menu` VALUES ('581239021590679571', '571347202849509376', '571373962609692672');
INSERT INTO `sys_role_menu` VALUES ('581239021590679572', '571347202849509376', '571374025859796992');
INSERT INTO `sys_role_menu` VALUES ('581239021590679573', '571347202849509376', '571374113881460736');
INSERT INTO `sys_role_menu` VALUES ('581239021590679574', '571347202849509376', '571374178956087296');
INSERT INTO `sys_role_menu` VALUES ('581239021590679575', '571347202849509376', '571369709904203776');
INSERT INTO `sys_role_menu` VALUES ('581239021590679576', '571347202849509376', '571374593844056064');
INSERT INTO `sys_role_menu` VALUES ('581239021590679577', '571347202849509376', '571374671245742080');
INSERT INTO `sys_role_menu` VALUES ('581239021590679578', '571347202849509376', '571374747460440064');
INSERT INTO `sys_role_menu` VALUES ('581239021590679579', '571347202849509376', '571369965811273728');
INSERT INTO `sys_role_menu` VALUES ('581239021590679580', '571347202849509376', '571374884270247936');
INSERT INTO `sys_role_menu` VALUES ('581239021590679581', '571347202849509376', '571374951823708160');
INSERT INTO `sys_role_menu` VALUES ('581239021590679582', '571347202849509376', '571375033570693120');
INSERT INTO `sys_role_menu` VALUES ('581239021590679583', '571347202849509376', '571375135655858176');
INSERT INTO `sys_role_menu` VALUES ('581239021590679584', '571347202849509376', '581237996276289536');
INSERT INTO `sys_role_menu` VALUES ('581239021590679585', '571347202849509376', '581238351663861760');
INSERT INTO `sys_role_menu` VALUES ('581239021590679586', '571347202849509376', '581238560250793984');
INSERT INTO `sys_role_menu` VALUES ('581239021590679587', '571347202849509376', '581238795467362304');
INSERT INTO `sys_role_menu` VALUES ('581239021590679588', '571347202849509376', '581238883182841856');
INSERT INTO `sys_role_menu` VALUES ('581239021590679589', '571347202849509376', '571361163502292992');
INSERT INTO `sys_role_menu` VALUES ('581239021590679590', '571347202849509376', '571361526066319360');
INSERT INTO `sys_role_menu` VALUES ('581239021590679591', '571347202849509376', '571364115214372864');
INSERT INTO `sys_role_menu` VALUES ('581239021590679592', '571347202849509376', '571361746552492032');
INSERT INTO `sys_role_menu` VALUES ('581239021590679593', '571347202849509376', '571362994005610496');
INSERT INTO `sys_role_menu` VALUES ('581239021590679594', '571347202849509376', '571363268497641472');
INSERT INTO `sys_role_menu` VALUES ('581239021590679595', '571347202849509376', '571363537549660160');
INSERT INTO `sys_role_menu` VALUES ('581239021590679596', '571347202849509376', '571352797233156096');
INSERT INTO `sys_role_menu` VALUES ('581239021590679597', '571347202849509376', '571353230286655488');
INSERT INTO `sys_role_menu` VALUES ('581239021590679598', '571347202849509376', '571355240792723456');
INSERT INTO `sys_role_menu` VALUES ('581239021590679599', '571347202849509376', '571355418715099136');
INSERT INTO `sys_role_menu` VALUES ('581239021590679600', '571347202849509376', '571355486121758720');
INSERT INTO `sys_role_menu` VALUES ('581239021590679601', '571347202849509376', '571353525381107712');
INSERT INTO `sys_role_menu` VALUES ('581239021590679602', '571347202849509376', '571355686403969024');
INSERT INTO `sys_role_menu` VALUES ('581239021590679603', '571347202849509376', '571355830226653184');
INSERT INTO `sys_role_menu` VALUES ('581239021590679604', '571347202849509376', '571355921259827200');
INSERT INTO `sys_role_menu` VALUES ('581239021590679605', '571347202849509376', '571356206782877696');
INSERT INTO `sys_role_menu` VALUES ('581239021590679606', '571347202849509376', '571356537642160128');
INSERT INTO `sys_role_menu` VALUES ('581239021590679607', '571347202849509376', '571356877741494272');
INSERT INTO `sys_role_menu` VALUES ('581239021590679608', '571347202849509376', '571357072436891648');
INSERT INTO `sys_role_menu` VALUES ('581239021590679609', '571347202849509376', '571357235276550144');
INSERT INTO `sys_role_menu` VALUES ('581239021590679610', '571347202849509376', '571353992756596736');
INSERT INTO `sys_role_menu` VALUES ('581239021590679611', '571347202849509376', '571357509638557696');
INSERT INTO `sys_role_menu` VALUES ('581239021590679612', '571347202849509376', '571357821778661376');
INSERT INTO `sys_role_menu` VALUES ('581239021590679613', '571347202849509376', '571357937931522048');
INSERT INTO `sys_role_menu` VALUES ('581239021590679614', '571347202849509376', '571358188264361984');
INSERT INTO `sys_role_menu` VALUES ('581239021590679615', '571347202849509376', '571358308477308928');
INSERT INTO `sys_role_menu` VALUES ('581239021590679616', '571347202849509376', '571358407353831424');
INSERT INTO `sys_role_menu` VALUES ('581239021590679617', '571347202849509376', '571358617991778304');
INSERT INTO `sys_role_menu` VALUES ('581239021590679618', '571347202849509376', '571358928483520512');
INSERT INTO `sys_role_menu` VALUES ('581239021590679619', '571347202849509376', '571354428217626624');
INSERT INTO `sys_role_menu` VALUES ('581239021590679620', '571347202849509376', '571359163205160960');
INSERT INTO `sys_role_menu` VALUES ('581239021590679621', '571347202849509376', '571354823258148864');
INSERT INTO `sys_role_menu` VALUES ('581239021590679622', '571347202849509376', '571351763521769472');
INSERT INTO `sys_role_menu` VALUES ('581239021590679623', '571347202849509376', '571352087896657920');
INSERT INTO `sys_role_menu` VALUES ('581239021590679624', '571347202849509376', '571348650370928640');
INSERT INTO `sys_role_menu` VALUES ('581239021590679625', '571347202849509376', '571349816924311552');
INSERT INTO `sys_role_menu` VALUES ('581239021590679626', '571347202849509376', '571350099653955584');
INSERT INTO `sys_role_menu` VALUES ('586547078973493248', '571347272906969088', '571365178965364736');
INSERT INTO `sys_role_menu` VALUES ('586547078973493249', '571347272906969088', '571367565360762880');
INSERT INTO `sys_role_menu` VALUES ('586547078973493250', '571347272906969088', '571367969767165952');
INSERT INTO `sys_role_menu` VALUES ('586547078973493251', '571347272906969088', '571371375550402560');
INSERT INTO `sys_role_menu` VALUES ('586547078973493252', '571347272906969088', '571371477828505600');
INSERT INTO `sys_role_menu` VALUES ('586547078973493253', '571347272906969088', '571371606652358656');
INSERT INTO `sys_role_menu` VALUES ('586547078973493254', '571347272906969088', '571371699010932736');
INSERT INTO `sys_role_menu` VALUES ('586547078973493255', '571347272906969088', '571371773073952768');
INSERT INTO `sys_role_menu` VALUES ('586547078973493256', '571347272906969088', '571368181252362240');
INSERT INTO `sys_role_menu` VALUES ('586547078973493257', '571347272906969088', '571372425787346944');
INSERT INTO `sys_role_menu` VALUES ('586547078973493258', '571347272906969088', '571372559308820480');
INSERT INTO `sys_role_menu` VALUES ('586547078973493259', '571347272906969088', '571372707153842176');
INSERT INTO `sys_role_menu` VALUES ('586547078973493260', '571347272906969088', '571368627413061632');
INSERT INTO `sys_role_menu` VALUES ('586547078973493261', '571347272906969088', '571373219269971968');
INSERT INTO `sys_role_menu` VALUES ('586547078973493262', '571347272906969088', '571373292582211584');
INSERT INTO `sys_role_menu` VALUES ('586547078973493263', '571347272906969088', '571373363046518784');
INSERT INTO `sys_role_menu` VALUES ('586547078973493264', '571347272906969088', '571373478440210432');
INSERT INTO `sys_role_menu` VALUES ('586547078973493265', '571347272906969088', '571369094226513920');
INSERT INTO `sys_role_menu` VALUES ('586547078973493266', '571347272906969088', '571373881496047616');
INSERT INTO `sys_role_menu` VALUES ('586547078973493267', '571347272906969088', '571373962609692672');
INSERT INTO `sys_role_menu` VALUES ('586547078973493268', '571347272906969088', '571374025859796992');
INSERT INTO `sys_role_menu` VALUES ('586547078973493269', '571347272906969088', '571374113881460736');
INSERT INTO `sys_role_menu` VALUES ('586547078973493270', '571347272906969088', '571374178956087296');
INSERT INTO `sys_role_menu` VALUES ('586547078973493271', '571347272906969088', '571369709904203776');
INSERT INTO `sys_role_menu` VALUES ('586547078973493272', '571347272906969088', '571374593844056064');
INSERT INTO `sys_role_menu` VALUES ('586547078973493273', '571347272906969088', '571374671245742080');
INSERT INTO `sys_role_menu` VALUES ('586547078973493274', '571347272906969088', '571374747460440064');
INSERT INTO `sys_role_menu` VALUES ('586547078973493275', '571347272906969088', '571369965811273728');
INSERT INTO `sys_role_menu` VALUES ('586547078973493276', '571347272906969088', '571374884270247936');
INSERT INTO `sys_role_menu` VALUES ('586547078973493277', '571347272906969088', '571374951823708160');
INSERT INTO `sys_role_menu` VALUES ('586547078973493278', '571347272906969088', '571375033570693120');
INSERT INTO `sys_role_menu` VALUES ('586547078973493279', '571347272906969088', '571375135655858176');
INSERT INTO `sys_role_menu` VALUES ('586547078973493280', '571347272906969088', '571352797233156096');
INSERT INTO `sys_role_menu` VALUES ('586547078973493281', '571347272906969088', '571353230286655488');
INSERT INTO `sys_role_menu` VALUES ('586547078973493282', '571347272906969088', '571355240792723456');
INSERT INTO `sys_role_menu` VALUES ('586547078973493283', '571347272906969088', '571355418715099136');
INSERT INTO `sys_role_menu` VALUES ('586547078973493284', '571347272906969088', '571355486121758720');
INSERT INTO `sys_role_menu` VALUES ('586547078973493285', '571347272906969088', '571353525381107712');
INSERT INTO `sys_role_menu` VALUES ('586547078973493286', '571347272906969088', '571355686403969024');
INSERT INTO `sys_role_menu` VALUES ('586547078973493287', '571347272906969088', '571355830226653184');
INSERT INTO `sys_role_menu` VALUES ('586547078973493288', '571347272906969088', '571355921259827200');
INSERT INTO `sys_role_menu` VALUES ('586547078973493289', '571347272906969088', '571356206782877696');
INSERT INTO `sys_role_menu` VALUES ('586547078973493290', '571347272906969088', '571356537642160128');
INSERT INTO `sys_role_menu` VALUES ('586547078973493291', '571347272906969088', '571356877741494272');
INSERT INTO `sys_role_menu` VALUES ('586547078973493292', '571347272906969088', '571357072436891648');
INSERT INTO `sys_role_menu` VALUES ('586547078973493293', '571347272906969088', '571357235276550144');
INSERT INTO `sys_role_menu` VALUES ('586547078973493294', '571347272906969088', '571454722205159424');
INSERT INTO `sys_role_menu` VALUES ('586547078973493295', '571347272906969088', '571353992756596736');
INSERT INTO `sys_role_menu` VALUES ('586547078973493296', '571347272906969088', '571357509638557696');
INSERT INTO `sys_role_menu` VALUES ('586547078973493297', '571347272906969088', '571357821778661376');
INSERT INTO `sys_role_menu` VALUES ('586547078973493298', '571347272906969088', '571357937931522048');
INSERT INTO `sys_role_menu` VALUES ('586547078973493299', '571347272906969088', '571358188264361984');
INSERT INTO `sys_role_menu` VALUES ('586547078973493300', '571347272906969088', '571358308477308928');
INSERT INTO `sys_role_menu` VALUES ('586547078973493301', '571347272906969088', '571358407353831424');
INSERT INTO `sys_role_menu` VALUES ('586547078973493302', '571347272906969088', '571358617991778304');
INSERT INTO `sys_role_menu` VALUES ('586547078973493303', '571347272906969088', '571358928483520512');
INSERT INTO `sys_role_menu` VALUES ('586547078973493304', '571347272906969088', '571354428217626624');
INSERT INTO `sys_role_menu` VALUES ('586547078973493305', '571347272906969088', '571359163205160960');
INSERT INTO `sys_role_menu` VALUES ('586547078973493306', '571347272906969088', '571354823258148864');
INSERT INTO `sys_role_menu` VALUES ('586547078973493307', '571347272906969088', '571348650370928640');
INSERT INTO `sys_role_menu` VALUES ('586547078973493308', '571347272906969088', '571349816924311552');
INSERT INTO `sys_role_menu` VALUES ('586547078973493309', '571347272906969088', '571350099653955584');
INSERT INTO `sys_role_menu` VALUES ('586914539136749568', '571347357346697216', '571365178965364736');
INSERT INTO `sys_role_menu` VALUES ('586914539136749569', '571347357346697216', '571367565360762880');
INSERT INTO `sys_role_menu` VALUES ('586914539136749570', '571347357346697216', '571367969767165952');
INSERT INTO `sys_role_menu` VALUES ('586914539136749571', '571347357346697216', '571371375550402560');
INSERT INTO `sys_role_menu` VALUES ('586914539136749572', '571347357346697216', '571371477828505600');
INSERT INTO `sys_role_menu` VALUES ('586914539136749573', '571347357346697216', '571371606652358656');
INSERT INTO `sys_role_menu` VALUES ('586914539136749574', '571347357346697216', '571371699010932736');
INSERT INTO `sys_role_menu` VALUES ('586914539136749575', '571347357346697216', '571371773073952768');
INSERT INTO `sys_role_menu` VALUES ('586914539136749576', '571347357346697216', '571368181252362240');
INSERT INTO `sys_role_menu` VALUES ('586914539136749577', '571347357346697216', '571372425787346944');
INSERT INTO `sys_role_menu` VALUES ('586914539136749578', '571347357346697216', '571372559308820480');
INSERT INTO `sys_role_menu` VALUES ('586914539136749579', '571347357346697216', '571372707153842176');
INSERT INTO `sys_role_menu` VALUES ('586914539136749580', '571347357346697216', '571368627413061632');
INSERT INTO `sys_role_menu` VALUES ('586914539136749581', '571347357346697216', '571373219269971968');
INSERT INTO `sys_role_menu` VALUES ('586914539136749582', '571347357346697216', '571373292582211584');
INSERT INTO `sys_role_menu` VALUES ('586914539136749583', '571347357346697216', '571373363046518784');
INSERT INTO `sys_role_menu` VALUES ('586914539136749584', '571347357346697216', '571373478440210432');
INSERT INTO `sys_role_menu` VALUES ('586914539136749585', '571347357346697216', '571369094226513920');
INSERT INTO `sys_role_menu` VALUES ('586914539136749586', '571347357346697216', '571373881496047616');
INSERT INTO `sys_role_menu` VALUES ('586914539136749587', '571347357346697216', '571373962609692672');
INSERT INTO `sys_role_menu` VALUES ('586914539136749588', '571347357346697216', '571374025859796992');
INSERT INTO `sys_role_menu` VALUES ('586914539136749589', '571347357346697216', '571374113881460736');
INSERT INTO `sys_role_menu` VALUES ('586914539136749590', '571347357346697216', '571374178956087296');
INSERT INTO `sys_role_menu` VALUES ('586914539136749591', '571347357346697216', '571369709904203776');
INSERT INTO `sys_role_menu` VALUES ('586914539136749592', '571347357346697216', '571374593844056064');
INSERT INTO `sys_role_menu` VALUES ('586914539136749593', '571347357346697216', '571374671245742080');
INSERT INTO `sys_role_menu` VALUES ('586914539136749594', '571347357346697216', '571374747460440064');
INSERT INTO `sys_role_menu` VALUES ('586914539136749595', '571347357346697216', '571369965811273728');
INSERT INTO `sys_role_menu` VALUES ('586914539136749596', '571347357346697216', '571374884270247936');
INSERT INTO `sys_role_menu` VALUES ('586914539136749597', '571347357346697216', '571374951823708160');
INSERT INTO `sys_role_menu` VALUES ('586914539136749598', '571347357346697216', '571375033570693120');
INSERT INTO `sys_role_menu` VALUES ('586914539136749599', '571347357346697216', '571375135655858176');
INSERT INTO `sys_role_menu` VALUES ('586914539136749600', '571347357346697216', '571348650370928640');
INSERT INTO `sys_role_menu` VALUES ('586914539136749601', '571347357346697216', '571349816924311552');
INSERT INTO `sys_role_menu` VALUES ('586914539136749602', '571347357346697216', '571350099653955584');
INSERT INTO `sys_role_menu` VALUES ('586915493013753856', '586914735614726144', '571371375550402560');

-- ----------------------------
-- Table structure for sys_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_route`;
CREATE TABLE `sys_route`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `route_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由ID',
  `route_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `predicates` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '断言',
  `filters` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过滤器',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URI',
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '排序',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_route
-- ----------------------------
INSERT INTO `sys_route` VALUES ('0f1aec35a545433c8cc0c8e78995f039', 'auth-service', '认证授权服务', '[\n  {\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/api/auth/**\"\n    }\n  }\n]', '[\n  {\n    \"name\": \"StripPrefix\",\n    \"args\": {\n      \"_genkey_0\": \"2\"\n    }\n  },\n  {\n    \"name\": \"RemoveRequestHeader\",\n    \"args\": {\n      \"_genkey_0\": \"Cookie\",\n      \"_genkey_1\": \"Set-Cookie\"\n    }\n  }\n]', 'lb://auth-service', '0', '0', 'admin', '2019-04-07 11:20:55', 'admin', '2019-04-26 22:45:28', '0', 'EXAM');
INSERT INTO `sys_route` VALUES ('5d9dd5f2cb1147aaad6f8b82a58586e8', 'exam-service', '考试服务', '[\n  {\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/api/exam/**\"\n    }\n  }\n]', '[\n  {\n    \"name\": \"StripPrefix\",\n    \"args\": {\n      \"_genkey_0\": \"2\"\n    }\n  },\n  {\n    \"name\": \"RemoveRequestHeader\",\n    \"args\": {\n      \"_genkey_0\": \"Cookie\",\n      \"_genkey_1\": \"Set-Cookie\"\n    }\n  }\n]', 'lb://exam-service', '0', '0', 'admin', '2019-04-02 21:39:30', 'admin', '2019-04-26 22:45:30', '0', 'EXAM');
INSERT INTO `sys_route` VALUES ('e9199257e8dc4f2d8fbb2a113c407eca', 'user-service', '用户服务', '[\n  {\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/api/user/**\"\n    }\n  }\n]', '[\n  {\n    \"name\": \"StripPrefix\",\n    \"args\": {\n      \"_genkey_0\": \"2\"\n    }\n  },\n  {\n    \"name\": \"RemoveRequestHeader\",\n    \"args\": {\n      \"_genkey_0\": \"Cookie\",\n      \"_genkey_1\": \"Set-Cookie\"\n    }\n  }\n]', 'lb://user-service', '0', '0', 'admin', '2019-04-07 11:22:05', 'admin', '2019-06-07 21:48:45', '0', 'EXAM');

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `tenant_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户标识',
  `tenant_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `tenant_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户描述信息',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES ('581236567985754112', 'gitee', '码云', '码云', '1', 'admin', '2019-05-23 21:46:36', 'admin', '2019-05-23 21:46:36', '0');
INSERT INTO `sys_tenant` VALUES ('586561187559378944', 'github', 'github', 'github', '1', 'admin', '2019-06-07 14:24:44', 'admin', '2019-06-07 14:24:44', '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '盐',
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '头像',
  `avatar_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像对应的附件id',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '性别',
  `born` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '生日',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(20) NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '系统编号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('571346919268421632', '管理员', 'admin', '$2a$10$8yt8NHRaABugHEd/hKelmeJD3.vj5OuhUiad8fk5.Uxi5ILMTDPcW', NULL, '15512345678', 'group1/M00/00/00/rBAAClz8zQeAcxdFAAB2nqimI80188.jpg', '587326094462554112', '15512345678@qq.com', '0', '2019-04-26', '0', 'admin', '2019-04-26 14:48:40', 'admin', '2019-04-26 14:51:13', 0, 'EXAM', '管理员', '571347099191480320', 'gitee');
INSERT INTO `sys_user` VALUES ('571347698284892160', '林老师', 'teacher', '$2a$10$PvRqajVApOtseEy8jJCzU.AnvrtoE5ecwQHQ9zuf.ezYnlFTF1Vm2', NULL, '155123456789', NULL, NULL, '155123456789@qq.com', '0', '2019-04-26', '0', 'admin', '2019-04-26 14:51:46', 'admin', '2019-05-16 22:07:08', 0, 'EXAM', '林老师', '571347099191480320', 'gitee');
INSERT INTO `sys_user` VALUES ('571347817814167552', '梁同学', 'student', '$2a$10$fhJsTqOM8d9ynpGqWBOgqez.gBunIwIWUM7q7.uGdQzvvQ6ZDPBlS', NULL, '15512345678', NULL, NULL, '155123456789@qq.com', '1', '2019-04-26', '0', 'admin', '2019-04-26 14:52:14', 'admin', '2019-06-08 13:40:01', 0, 'EXAM', '梁同学', '571347099191480320', 'gitee');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('571347558564237312', '571346919268421632', '571347202849509376');
INSERT INTO `sys_user_role` VALUES ('578705020137115648', '571347698284892160', '571347272906969088');
INSERT INTO `sys_user_role` VALUES ('580887228469874688', '580887227983335424', '571347357346697216');
INSERT INTO `sys_user_role` VALUES ('586912320949719040', '571347817814167552', '571347272906969088');
INSERT INTO `sys_user_role` VALUES ('587321912426893312', '587321911759998976', '571347357346697216');
INSERT INTO `sys_user_role` VALUES ('587322084502409216', '587322083936178176', '571347357346697216');
INSERT INTO `sys_user_role` VALUES ('587322559050158080', '587322558496509952', '571347357346697216');
INSERT INTO `sys_user_role` VALUES ('587322834196500480', '587322833626075136', '571347357346697216');

SET FOREIGN_KEY_CHECKS = 1;
