

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/bean/new_page_bean.dart';
import 'package:untitled/page/new_details.dart';
import 'package:untitled/page/news_page.dart';
import 'package:untitled/page/page_clock.dart';
import 'package:untitled/page/random_number.dart';
import 'package:untitled/page/router.dart';
import 'package:untitled/page/threeDpage.dart';

import 'package:untitled/page/unit_splash.dart';
import 'package:untitled/page/wan_android_home.dart';
import 'MainTabs.dart';
import 'animation_demo_page.dart';
import 'calendar.dart';
import 'driving_book.dart';
import 'drow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      },
      home: Scaffold(
        resizeToAvoidBottomPadding:false,
        body: UnitSplash(),
      ),
    );
  }
}
