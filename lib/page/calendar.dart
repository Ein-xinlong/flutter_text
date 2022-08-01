import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:untitled/commitUI/appbar.dart';

import '../calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("现在的日期" + DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
          titleContent: "日历",
          color: Color(0xFFCCCCFF),
          backPressCallback: () {
            Navigator.pop(context);
          }).buildAppBar(),
      body: Column(
        children: [
          Calendar(
            initTime: DateTime.now(),
            firstTime: DateTime.utc(2020, 11, 9),
            endTime: DateTime.now(),
            onChange: (time) {
              print("time" + time.toString());
            },
          ),
          TextButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 3, 5),
                    maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.zh);

              },
              child: Text(
                'show date time picker (Chinese)',
                style: TextStyle(color: Colors.blue),
              )),
        ],
      ),
    );
  }
}
