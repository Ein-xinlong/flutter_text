

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/page_clock.dart';
import 'package:untitled/router.dart';
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
      },
      home: Scaffold(
        resizeToAvoidBottomPadding:false,
        body: Tabs(),
      ),
    );
  }
}
