

import 'package:flutter/material.dart';
import 'package:untitled/router.dart';
import 'MainTabs.dart';
import 'calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      routes: {
        Routers.ROUTER_CALENDAR:(context)=>CalendarPage(),
      },
      home: Scaffold(
        resizeToAvoidBottomPadding:false,
        body: Tabs(),
      ),
    );
  }
}
