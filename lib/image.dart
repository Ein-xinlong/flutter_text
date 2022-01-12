

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:untitled/news_page.dart';
import 'package:untitled/random_number.dart';
import 'package:untitled/router.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/loading.dart';
import 'package:untitled/utils/tts.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/vm/image_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:untitled/wan_android_home.dart';

import 'commitUI/button.dart';
import 'drow_page.dart';
import 'girl_list_page.dart';


class JhPhotoPickerTool extends StatefulWidget {

  @override
  _JhPhotoPickerToolState createState() => _JhPhotoPickerToolState();
}

class _JhPhotoPickerToolState extends State<JhPhotoPickerTool> {

  ImageViewModel vm=new ImageViewModel();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var an = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var io = new IOSInitializationSettings();
    var mac = new MacOSInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(android: an,iOS: io,macOS: mac);
    //flutterLocalNotificationsPlugin.initialize(initializationSettings,);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomPadding:false,
      appBar: AnAppbar(
        titleContent: "主页",
        backPressCallback: null
      ).buildAppBar(),
      body: ChangeNotifierProvider(
        child: Consumer<ImageViewModel>(builder: (context,model,child){
          return AnCommonBody(vm.loadState,bodyWidget:
         Stack(
           children: [
             SingleChildScrollView(
               child: Column(
                 children: [
                   Container(child: TextButtonPurple(text: "语音测试",onPressed: (){
                     TtsHelper.instance.setLanguageAndSpeak("Hello, welcome to my demo", "en");
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color:vm.getCorrect? Color(0xFFFFCC99): Color(0xFF99CC99),
                     ),
                     child: FlatButton(onPressed: (){
                       vm.showloadState();
                       vm.text();
                       // dialog(context);

                     }, child:Text("get接口测试"),),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color:vm.postCorrect?Color(0xFFFFCC99):Color(0xFF99CC99),
                     ),
                     child: FlatButton(onPressed: (){
                       vm.showloadState();
                       vm.postText();
                       // dialog(context);

                     }, child:Text("post接口测试"),),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "日历页面",onPressed: (){
                     Navigator.pushNamed(context, Routers.ROUTER_CALENDAR);
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "炫酷时钟",onPressed: (){
                     Navigator.pushNamed(context, Routers.ROUTER_CLOCK);
                   },),width: double.infinity,),
                   SizedBox(height: 10,),

                   Container(child: TextButtonPurple(text: "白板",onPressed: (){
                     //普通路由跳转
                     //Navigator.pushNamed(context, Routers.ROUTER_DROWPAGE);
                     //git跳转
                     Get.to(() => DrowPage(),fullscreenDialog: true,transition: Transition.size,curve: Curves.ease,duration: Duration(milliseconds: 700));
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "切换主题",onPressed: (){
                     Get.bottomSheet(
                         Container(
                           child: Wrap(
                             children: [
                               ListTile(
                                 leading: Icon(Icons.wb_sunny_outlined),
                                 title: Text("白天模式"),
                                 onTap: () {
                                   Get.changeTheme(ThemeData.light());
                                 },
                               ),
                               ListTile(
                                 leading: Icon(Icons.wb_sunny),
                                 title: Text("黑夜模式"),
                                 onTap: () {
                                   Get.changeTheme(ThemeData.dark());
                                 },
                               )
                             ],
                           ),
                         ),
                         backgroundColor: Colors.grey
                     );

                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "玩android",onPressed: (){
                     Get.to(AndroidHome());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),

                   Container(child: TextButtonPurple(text: "通知",onPressed: (){
                     _showNotification();
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "随机数",onPressed: (){
                     Get.to(RandomNumber());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "新闻",onPressed: (){
                     Get.to(NewsPage());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "美女",onPressed: (){
                     Get.to(GirlPage());
                   },),width: double.infinity,),
                 ],
               ),
             ),
             Offstage(
               offstage:vm.isShow ,
               child: PdaLoadingView(),
             )
           ],
         ),);
        },),
        create: (BuildContext context){
          return vm;
        },
      ),
    );
  }
  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var mac = new MacOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics,iOS: iOSPlatformChannelSpecifics,macOS:mac);
    await flutterLocalNotificationsPlugin.show(0, 'AnDemo', '测试发送通知成功', platformChannelSpecifics,payload: 'item x');
  }
  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
     Get.to(AndroidHome());
  }






}