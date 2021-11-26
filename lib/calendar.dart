import 'package:flutter/material.dart';
import 'package:untitled/commitUI/appbar.dart';

import 'calendar/calendar.dart';

class CalendarPage extends StatefulWidget {


  @override
  _CalendarPageState createState() => _CalendarPageState();
}


class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("现在的日期"+DateTime.now().toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
        titleContent: "日历",
          color:Color(0xFFCCCCFF),
        backPressCallback: (){
          Navigator.pop(context);
        }
      ).buildAppBar(),
      body: Calendar(
        initTime: DateTime.now(),
        firstTime:DateTime.utc(2020, 11, 9),
        endTime: DateTime.now(),
        onChange: (time){
          print("time"+time.toString());
        },
      ),
    );
  }
}
