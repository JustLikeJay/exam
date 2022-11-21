export default defineAppConfig({
  pages: [
      'pages/home/index',
      'pages/index/index',
      'pages/login/index',
      'pages/answer/index',
      'pages/record/index',
      'pages/all_subject/index',
      'pages/next_subject/index',
      'pages/user/index',
      'pages/share/index',
      'pages/about/index',
      'pages/favorite/index'
  ],
  window: {
    backgroundTextStyle: 'light',
    navigationBarBackgroundColor: '#fff',
    navigationBarTitleText: 'SG-EXAM',
    navigationBarTextStyle: 'black'
  },
    tabBar: {
        color: "#505050",
        selectedColor: "#3c4a54",
        backgroundColor: "#ffffff",
        borderStyle: "black",
        position: "bottom",
        list: [
            {
                "pagePath": "pages/home/index",
                "text": "首页",
                "iconPath": "assert/home.png",
                "selectedIconPath": "assert/home_selected.png"
            },
            {
                "pagePath": "pages/user/index",
                "text": "我的",
                "iconPath": "assert/user.png",
                "selectedIconPath": "assert/user_select.png"
            }
        ]
    },
    usingComponents: {

    }
})