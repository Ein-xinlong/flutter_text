

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/bean/new_page_bean.dart';
import 'package:untitled/new_details.dart';
import 'package:untitled/news_page.dart';
import 'package:untitled/page_clock.dart';
import 'package:untitled/random_number.dart';
import 'package:untitled/router.dart';
import 'package:untitled/unit_splash.dart';
import 'package:untitled/wan_android_home.dart';
import 'MainTabs.dart';
import 'calendar.dart';
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
      },
      home: Scaffold(
        resizeToAvoidBottomPadding:false,
        body: UnitSplash(),
      ),
    );
  }
}
