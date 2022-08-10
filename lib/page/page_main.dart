

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/bean/new_page_bean.dart';
import 'package:untitled/page/page_login.dart';
import 'package:untitled/page/page_news_details.dart';
import 'package:untitled/page/page_news_page.dart';
import 'package:untitled/page/page_clock.dart';
import 'package:untitled/page/page_random_number.dart';
import 'package:untitled/page/router.dart';
import 'package:untitled/page/page_threeD.dart';

import 'package:untitled/page/page_splash.dart';
import 'package:untitled/page/page_wan_android.dart';
import 'page_main_tabs.dart';
import 'page_animation_demo.dart';
import 'page_calendar.dart';
import 'page_driving_book.dart';
import 'page_write_drow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      routes: {
        Routers.ROUTER_CALENDAR:(context)=>CalendarPage(),
        Routers.ROUTER_CLOCK:(context)=>Clock(),
        Routers.ROUTER_DROWPAGE:(context)=>DrowPage(),
        Routers.ROUTER_WANANDROID:(context)=>AndroidHome(),
        Routers.ROUTER_MAIN:(context)=>Tabs(),
        Routers.ROUTER_RANDOMNUMBER:(context)=>RandomNumber(),
        Routers.ROUTER_NEWPAGE:(context)=>NewsPage(),
        Routers.ROUTER_NEWDETAILS:(context)=>NewDetails(Result("","","测试","")),
        Routers.ROUTER_DRIVINGBOOK:(context)=>DrivingBook(),
        Routers.ROUTER_ANIMATIONDEMO:(context)=>AnimationDemo(),
        Routers.ROUTER_THREEDPAGE:(context)=>ThreeDSpin(),
        Routers.ROUTER_LOGINPAGE:(context)=>LoginPage(title: "登录"),
      },
      home: Scaffold(
        body: UnitSplash(),
      ),
    );
  }
}
