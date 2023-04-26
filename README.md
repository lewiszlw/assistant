# assistant
个人助手（纯个人使用，旨在解决工作生活中的痛点、提高效率）。

功能
- [x] 每日早安
- [x] 即时闹钟
- [x] 每日看点
- [x] 系统配置
- [ ] 电影推荐
- [ ] App时长监督 app_usage/usage_stats

项目结构
- assistant-server: 作为web server提供API
- assistant-script: 爬虫等脚本
- assistant_flutter: flutter客户端

## 脚本 assistant-script
### 每日话语 daily-morning
基于 https://github.com/13812851221/-rxrw-daily_morning 做了些改造。

使用
1. 微信公众平台测试号申请 
2. github actions 添加敏感信息（如appid、appsecret）
3. 修改config.py

## web后端 assistant-server
个人助理后端server，负责提供各类API。

启动
- 安装依赖 `pip3 install -r requirements.txt`
- 启动server `python3 main.py`

通过 localtunnel 从外部访问局域网server
1. `npm install -g localtunnel`
2. `lt --port {server-port}`
3. 参考 https://github.com/localtunnel/localtunnel , https://theboroer.github.io/localtunnel-www/ , https://stackoverflow.com/questions/5108483/access-localhost-from-the-internet

## 移动端 assistant_flutter
个人助手app。

开始
1. `open -a Simulator` 打开ios模拟器
2. `flutter run`

参考
- [《Flutter实战2》](https://github.com/flutterchina/flutter_in_action_2nd)（[源码](https://github.com/wendux/flutter_in_action_2)）
- flutter
  - flutter开发环境搭建：https://docs.flutter.dev/get-started/install/macos
  - flutter ios真机调试：https://www.jianshu.com/p/58a6e272a038
- alarm_clock
  - https://www.youtube.com/watch?v=iKxrt4ASR5Y

## 功能截图
|  页面              | 截图  |
|  ----             | ----  |
| app首页            | ![app首页](https://raw.githubusercontent.com/lewiszlw/assistant/main/doc/screenshot_homepage.png) |
| 即时闹钟首页        | ![即时闹钟首页](https://raw.githubusercontent.com/lewiszlw/assistant/main/doc/screenshot_alarm_clock_homepage.png) |
| 每日看点首页        | ![每日看点首页](https://raw.githubusercontent.com/lewiszlw/assistant/main/doc/screenshot_daily_article_homepage.png) |