

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:untitled/page/animation_demo_page.dart';
import 'package:untitled/page/news_page.dart';
import 'package:untitled/page/random_number.dart';
import 'package:untitled/page/router.dart';
import 'package:untitled/page/snow_page.dart';
import 'package:untitled/page/threeDpage.dart';

import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/loading.dart';
import 'package:untitled/utils/tts.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/vm/image_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:untitled/page/wan_android_home.dart';

import '../commitUI/button.dart';
import 'animation_count.dart';
import 'driving_book.dart';
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
        titleContent: "??????",
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
                   Container(child: TextButtonPurple(text: "????????????",onPressed: (){
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

                     }, child:Text("get????????????"),),width: double.infinity,),
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

                     }, child:Text("post????????????"),),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "????????????",onPressed: (){
                     Navigator.pushNamed(context, Routers.ROUTER_CALENDAR);
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "????????????",onPressed: (){
                     Navigator.pushNamed(context, Routers.ROUTER_CLOCK);
                   },),width: double.infinity,),
                   SizedBox(height: 10,),

                   Container(child: TextButtonPurple(text: "??????",onPressed: (){
                     //??????????????????
                     //Navigator.pushNamed(context, Routers.ROUTER_DROWPAGE);
                     //git??????
                     Get.to(() => DrowPage(),fullscreenDialog: true,transition: Transition.size,curve: Curves.ease,duration: Duration(milliseconds: 700));
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "????????????",onPressed: (){
                     Get.bottomSheet(
                         Container(
                           child: Wrap(
                             children: [
                               ListTile(
                                 leading: Icon(Icons.wb_sunny_outlined),
                                 title: Text("????????????"),
                                 onTap: () {
                                   Get.changeTheme(ThemeData.light());
                                 },
                               ),
                               ListTile(
                                 leading: Icon(Icons.wb_sunny),
                                 title: Text("????????????"),
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
                   Container(child: TextButtonPurple(text: "???android",onPressed: (){
                     Get.to(AndroidHome());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),

                   Container(child: TextButtonPurple(text: "??????",onPressed: (){
                     _showNotification();
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "?????????",onPressed: (){
                     Get.to(RandomNumber());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "??????",onPressed: (){
                     Get.to(NewsPage());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "??????",onPressed: (){
                     Get.to(GirlPage());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "???????????????",onPressed: (){
                     Get.to(DrivingBook());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "Animation",onPressed: (){
                     Get.to(AnimationDemo());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "3D??????",onPressed: (){
                     Get.to(ThreeDSpin());
                   },),width: double.infinity,),
                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "???????????????",onPressed: (){
                     Get.to(()=>AnimationCount());
                   },),width: double.infinity,),


                   SizedBox(height: 10,),
                   Container(child: TextButtonPurple(text: "??????",onPressed: (){
                     Get.to(()=>SnowPage());
                   },),width: double.infinity,), SizedBox(height: 10,),
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
    await flutterLocalNotificationsPlugin.show(0, 'AnDemo', '????????????????????????', platformChannelSpecifics,payload: 'item x');
  }
  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
     Get.to(AndroidHome());
  }






}