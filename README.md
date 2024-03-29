<h1 align="center">Welcome to sg-exam 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.0.12-blue.svg?cacheSeconds=2592000" />
  <a href="https://mp.weixin.qq.com/s/oal9atlSQxfL4YOiLtYfuA" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="#" target="_blank">
    <img alt="License: Apache2.0" src="https://img.shields.io/badge/License-Apache2.0-yellow.svg" />
  </a>
</p>

> 硕果云，基于 Spring Boot 搭建的方便易用、高颜值的教学管理平台，提供多租户、权限管理、考试、练习、在线学习等功能。
>
> 主要功能为在线考试、练习、刷题，在线学习。
> 
> 课程内容支持图文、视频，考试类型支持考试、练习、问卷。
> 
> 题型支持单选题、多选题、判断题、简答题、视频、语音，题目内容支持图文、视频等。
> 
> 支持题库、刷题功能。

> 本版本为 Spring Boot 版本，没有太多中间件依赖，使用、部署都非常方便，并且持续更新维护。

### [在线体验](http://8.134.179.30/)

| 平台    | 地址                                                     | 账号密码                                                        |
|-------|--------------------------------------------------------|-------------------------------------------------------------|
| 前台    | [http://8.134.179.30/](http://8.134.179.30/)           | 账号：preview，密码：123456                                        |
| h5 前台 | [http://8.134.179.30/h5](http://8.134.179.30/h5)       | 账号：preview，密码：123456                                        |
| 后台    | [http://8.134.179.30/admin](http://8.134.179.30/admin) | 默认租户账号：preview，密码：123456 |

**想体验后台的功能可使用测试租户 ID：sg，租户账号：admin_sg，密码：123456**
该账号可新增用户、部门、课程、考试、题库等信息。

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/sg_login.png" width="200"/>

小程序和公众号：

|   平台   |      二维码     |   说明  |
| --------- | -------- | -------- |
|  小程序  |  <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wx.jpg" width="160"/> | 小程序体验 |
|  公众号  |  <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wxapp.jpeg" height="130"/> | 发布部署文档、源码解析相关的文章 |

## 系统架构

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/framework.png"/>

## 功能概述

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/business.png"/>

项目分 web 前台、后台管理、小程序三部分，前台、小程序主要提供考试功能，后台提供基础管理、考试管理功能。

web 前台主要功能：提供在线考试、课程学习、练习等功能。

后台主要功能：系统管理（单位管理、用户管理、部门管理、角色管理、菜单管理、操作日志、代码生成），考务管理（课程管理、考试管理、题库管理、成绩管理）。

课程用于提供在线学习功能，支持配置章、节、知识点，课程内容支持图文、视频。

考试类型支持考试、练习、问卷，答题模式支持一次性答题、顺序答题，添加题目支持手动添加、从题库选择、随机组题。

用户可收藏考试、题目、课程，选择题库进行刷题等，更多功能可自行体验。

## 部署文档 & 操作手册 & 源码解析 & 视频教程

- 文档获取方式：关注“小傻笔记”公众号，发送“文档”关键词获取

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wxapp.jpeg" height="130"/>

- [Roadmap](https://www.yuque.com/tangyi-5ldnl/paf15u/cwvtvfd0a07ozfk2?singleDoc#)

- [开源使用用户登记](https://gitee.com/wells2333/sg-exam/issues/I63AI3)

## 功能截图

<table>
    <tr>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/web_courses.png" height="200"/></td>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/web_course_detail.png" height="200"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/web_course_chapter.png" height="200"/></td>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/web_course_section.png" height="200"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_course_evaluate.png" height="200"/></td>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/web_1.png" height="200"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_course_evaluate.png" height="200"/></td>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_dashboard.png" height="200"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_exam_manage.png" height="200"/></td>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_subjects.png" height="200"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_subject_detail.png" height="200"/></td>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_courses.png" height="200"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_score_detail.png" height="200"/></td>
        <td><img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/admin_menus.png" height="200"/></td>
    </tr>
    <tr>
        <td>
           <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wxapp_1.png" height="200"/>
           <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wxapp_2.png" height="200"/>
           <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wxapp_3.png" height="200"/>
           <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wxapp_6.png" height="200"/>
           <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wxapp_7.png" height="200"/>
        </td>
        <td> 
           <img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/monitor_1.png" height="200"/>
        </td>
    </tr>
</table>

## 作者

👤 **tangyi**

* Gitee: [@wells2333](https://gitee.com/wells2333)

* Github: [@wells2333](https://github.com/wells2333)

## 参与贡献

欢迎提交 PR、[issues](https://gitee.com/wells2333/sg-exam)一起完善项目

## 反馈交流

微信交流群：

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wechat2.png" width="160"/>

QQ 交流群：

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/qq.png" width="160"/>

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/qq_new.png" width="160"/>

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/qq_3.png" width="160"/>

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/qq_4.png" width="160"/>

## 请作者喝咖啡

如果您觉得有帮助，请点右上角 ⭐️ "Star" 或者**微信扫一扫**支持一下，谢谢！

<img src="https://gitee.com/wells2333/sg-exam/raw/master/docs/images/wechat.png" width="160"/>

## License

[Apache License 2.0](https://gitee.com/wells2333/sg-exam/blob/master/LICENSE)