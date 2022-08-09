import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/bean/main_list.dart';
import 'package:untitled/network/network.dart';
import 'package:untitled/page/page_animation_count.dart';
import 'package:untitled/page/page_animation_demo.dart';
import 'package:untitled/page/page_calendar.dart';
import 'package:untitled/page/page_driving_book.dart';
import 'package:untitled/page/page_write_drow.dart';
import 'package:untitled/page/page_girl_list.dart';
import 'package:untitled/page/page_news_page.dart';
import 'package:untitled/page/page_clock.dart';
import 'package:untitled/page/page_random_number.dart';
import 'package:untitled/page/page_wan_android.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/log.dart';
import 'package:untitled/utils/toash.dart';
import 'package:untitled/vm/base_viewmodel.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class ImageViewModel extends AnBaseViewModel {
  bool isShow = true; //loading是否展示   ture为隐藏  false为展示
  bool getCorrect = false; //get请求是否成功
  bool postCorrect = false; //post请求是否成功
  List<MainList> list = [];
  Uint8List bytes = Uint8List(0);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  init(){
    var an = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var io = new IOSInitializationSettings();
    var mac = new MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
    InitializationSettings(android: an, iOS: io, macOS: mac);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
}
  ///loading是否显示
  var loadState = AnPageState.Success;

  void text() async {
    var dio = AnNetwork.shareInstance();
    dio.get("get", success: (response) {
      isShow = true;
      getCorrect = true;
      print(response.data.toString());
      notifyListeners();
      Log.e(response.data.toString());
    }, failed: (e) {
      isShow = true;
      getCorrect = false;
      notifyListeners();
    });
  }

  void postText() async {
    var dio = AnNetwork.shareInstance();
    await dio.post(
      'post',
      paramaters: {
        "data": {
          "username": "666666@qq.com", //订单号
          "password": "666", //订单号
        },
      },
      options: Options(contentType: Headers.jsonContentType),
      success: (response) {
        isShow = true;
        postCorrect = true;
        print(response.data.toString());
        notifyListeners();
        Log.e(response.data.toString());
      },
      failed: (error) {
        isShow = true;
        postCorrect = false;
        notifyListeners();
      },
    );
  }

  showloadState() {
    isShow = false;
    notifyListeners();
  }
  ///加载主页数据
  loadingMainList() {
    MainList mainList = MainList();
    mainList.ListItemString = "小工具集合";
    ItemList itemList = ItemList();
    itemList.itemName = "Get请求";
    itemList.imageUrl = "assets/images/ADX.png";
    itemList.marker = 0;
    ItemList itemList1 = ItemList();
    itemList1.itemName = "Post请求";
    itemList1.imageUrl = "assets/images/AE.png";
    itemList1.marker = 1;
    ItemList itemList2 = ItemList();
    itemList2.itemName = "切换主题";
    itemList2.imageUrl = "assets/images/ARDR.png";
    itemList2.marker = 2;
    ItemList itemList3 = ItemList();
    itemList3.itemName = "通知";
    itemList3.imageUrl = "assets/images/ARK.png";
    itemList3.marker = 3;
    ItemList itemList14 = ItemList();
    itemList14.itemName = "扫描二维码";
    itemList14.imageUrl = "assets/images/DASH.png";
    itemList14.marker = 14;
    mainList.item.add(itemList);
    mainList.item.add(itemList1);
    mainList.item.add(itemList2);
    mainList.item.add(itemList3);
    mainList.item.add(itemList14);

    MainList mainList1 = MainList();
    mainList1.ListItemString = "新页面集合";
    ItemList itemList4 = ItemList();
    itemList4.itemName = "日历页面";
    itemList4.imageUrl = "assets/images/BCC.png";
    itemList4.marker = 4;
    ItemList itemList5 = ItemList();
    itemList5.itemName = "炫酷时钟";
    itemList5.imageUrl = "assets/images/BCH.png";
    itemList5.marker = 5;
    ItemList itemList6 = ItemList();
    itemList6.itemName = "白板";
    itemList6.imageUrl = "assets/images/BCN.png";
    itemList6.marker = 6;
    ItemList itemList7 = ItemList();
    itemList7.itemName = "玩android";
    itemList7.imageUrl = "assets/images/BLOCK.png";
    itemList7.marker = 7;
    ItemList itemList8 = ItemList();
    itemList8.itemName = "随机数";
    itemList8.imageUrl = "assets/images/BNB.png";
    itemList8.marker = 8;
    ItemList itemList9 = ItemList();
    itemList9.itemName = "新闻";
    itemList9.imageUrl = "assets/images/BNT.png";
    itemList9.marker = 9;
    ItemList itemList10 = ItemList();
    itemList10.itemName = "美女";
    itemList10.imageUrl = "assets/images/BTC.png";
    itemList10.marker = 10;
    ItemList itemList11 = ItemList();
    itemList11.itemName = "驾照考试题";
    itemList11.imageUrl = "assets/images/BTCD.png";
    itemList11.marker = 11;
    ItemList itemList12 = ItemList();
    itemList12.itemName = "Animation";
    itemList12.imageUrl = "assets/images/BTM.png";
    itemList12.marker = 12;
    ItemList itemList13 = ItemList();
    itemList13.itemName = "计数器动画";
    itemList13.imageUrl = "assets/images/BTS.png";
    itemList13.marker = 13;

    mainList1.item.add(itemList4);
    mainList1.item.add(itemList5);
    mainList1.item.add(itemList6);
    mainList1.item.add(itemList7);
    mainList1.item.add(itemList8);
    mainList1.item.add(itemList9);
    mainList1.item.add(itemList10);
    mainList1.item.add(itemList11);
    mainList1.item.add(itemList12);
    mainList1.item.add(itemList13);

    list.add(mainList);
    list.add(mainList1);
    notifyListeners();
  }

  itemClickOn(int pos) {
    switch (pos) {
      case 0:
        showloadState();
        text();
        break;
      case 1:
        showloadState();
        postText();
        break;
      case 2:
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
            backgroundColor: Colors.grey);
        break;
      case 3:
        _showNotification();
        break;
      case 4:
        Get.to(() => CalendarPage(),fullscreenDialog: true,transition: Transition.size,curve: Curves.ease,duration: Duration(milliseconds: 700));
        break;
      case 5:
        Get.to(() => Clock(),fullscreenDialog: true,transition: Transition.size,curve: Curves.ease,duration: Duration(milliseconds: 700));
        break;
      case 6:
        Get.to(() => DrowPage(),fullscreenDialog: true,transition: Transition.size,curve: Curves.ease,duration: Duration(milliseconds: 700));
        break;
      case 7:
        Get.to(AndroidHome());
        break;
      case 8:
        Get.to(RandomNumber());
        break;
      case 9:
        Get.to(NewsPage());
        break;
      case 10:
        Get.to(GirlPage());
        break;
      case 11:
        Get.to(DrivingBook());
        break;
      case 12:
        Get.to(AnimationDemo());
        break;
      case 13:
        Get.to(()=>AnimationCount());
        break;
      case 14:
        _scan();
        break;
      case 15:
        break;
      default:
        break;
    }
  }
  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var mac = new MacOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
        macOS: mac);
    await flutterLocalNotificationsPlugin.show(
        0, 'AnDemo', '测试发送通知成功', platformChannelSpecifics,
        payload: 'item x');
  }
  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    Get.to(AndroidHome());
  }

  Future _scan() async {
     await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      Get.defaultDialog(title:"扫描结果", middleText: barcode);
    }
  }

}
