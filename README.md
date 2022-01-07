# 个人学习flutter记录

[comment]: <> (## 添加依赖)

[comment]: <> (```)

[comment]: <> (intl: ^0.16.1)

[comment]: <> (```)


## 学习说明（记录）

+ 参见flutter中文网 https://flutterchina.club/
+ 视频教学地址 https://www.td0f7.cn/
+ bean类转换官方地址 https://caijinglong.github.io/json2dart/index.html 详细使用移步百度
+ 宝典 http://laomengit.com/guide/widgets/DatePicker1.html
+ 官方提供的三方说明 https://pub.dev/

## 更新日志

### 1.0.0+1

+ 添加了主页，3个tab。


### 1.0.0+2

+ 添加utils 颜色，日期，double转固定格式。
+ 删除了无用文件，整理项目


### 1.0.0+3

+ 添加语音播报
+ 三方 tts: ^1.0.2
+ 主要方法 TtsHelper.instance.setLanguageAndSpeak("你好我是测试语音", "zh");


### 1.0.0+4

+ 修改demo名称AnDemo
+ 增加commitUI(通用appbar，通用button，通用dialog，通用loding「加载网络时显示」)
+ 所有toolbar换成通用AnAppbar
+ 修复单选列表不能居中的问题，
+ 修复webview页面软键盘导致的布局异常


### 1.0.0+5

+ 封装网络框架dio（AnNetwork.shareInstance()获取dio对象）
+ 主页增加get接口测试，post接口测试，（点击后请求，按钮变为绿色请求成功）
+ 增加loading展示，有延迟操作时展示loading（比如网络请求数据没回来之前）
+ 增加AnBaseViewModel   实现数据和widget的分开管理


### 1.0.0+6

+ 实现自定义日历，选择范围（不能跨月选择）
+ 整理依赖，删除图片选择功能（不是官方的依赖，读取出来的图片太模糊）。

### 1.0.0+7

+ 添加toolbar自定义颜色

### 1.0.0+8

+ 修改主题颜色，toolbar默认颜色
+ 修改渐变按钮默认颜色
+ 修改pageview3张色调

### 1.0.0+9

+ 修改主页title
+ 增加表盘页面

### 1.0.0+10

+ 修改表盘字母没居中问题
+ 增加白板页面，可以截图，浏览，清除文字

### 1.0.0+11

+ 增加GetX的插件
+ 利用getx做出切换主题的效果

### 1.0.0+12

+ 增加玩android页面，调试接口
+ 增加通用banner
+   transparent_image: ^0.1.0  缓存图片
+   build_runner: ^1.10.0    构造bean类
+   json_serializable: ^3.5.0    bean类序列化
+   flutter_easyrefresh: ^2.1.0    上拉加载下拉刷新

### 1.0.0+13

+ 修复玩android主页面刷新banner数量增加
+ 单选列表黑夜模式下能看到对号


### 1.0.0+14

+ 增加通知功能，点击通知跳转页面

### 1.0.0+15

+ 增加随机数（图片验证码）
+ 增加广告业（动画）






