import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:untitled/calendar/time_util.dart';
import 'package:untitled/utils/colors.dart';

import 'day_grid_view.dart';


class Calendar extends StatefulWidget {
  DateTime initTime;
  DateTime firstTime;
  DateTime endTime;
  ValueChanged onChange;

  Calendar({
    Key key,
    this.initTime,
    this.firstTime,
    this.endTime,
    this.onChange,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  PageController pageController;
  DateTime selectDate;
  int initPage = 0;
  int totalPage = 0;
  String year="";
  String month="";
  @override
  void initState() {
    super.initState();
    print(widget.firstTime.month);
    selectDate = widget.initTime;
    year=widget.initTime.year.toString();
    month=widget.initTime.month.toString();

    /// 总共的月份数目
    totalPage = (widget.endTime.year - widget.firstTime.year == 0
        ? widget.endTime.month
        : ((widget.endTime.year - widget.firstTime.year) * 12 +
        widget.endTime.month -
        widget.firstTime.month +
        1));

    /// 当前月份处于
    initPage = (widget.initTime.year - widget.firstTime.year == 0
        ? widget.initTime.month
        : ((widget.initTime.year - widget.firstTime.year) * 12 +
        widget.initTime.month -
        widget.firstTime.month +
        1));
    print(totalPage);
    print(initPage);
    pageController = PageController(
      initialPage: totalPage,
    );
  }

  onChange(time) {
    if (selectDate != time) {
      setState(() {
        selectDate = time;
        widget.onChange(time);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: TimeUtil.getDayHeaders(MaterialLocalizations.of(context)),
      ),
      Container(
        color: WHITE,
        height: 400,
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            // setState(() {
            //   year=(widget.firstTime.year +
            //       ((widget.firstTime.month + index - 1) / 12)).toString();
            //   month=((widget.firstTime.month + index) % 12 == 0
            //       ? 12
            //       : (widget.firstTime.month + index) % 12).toString();
            // });
            return DayGridView(

              initDate: DateTime(widget.initTime.year, widget.initTime.month,
                  widget.initTime.day),
              selectDate:
              DateTime(selectDate.year, selectDate.month, selectDate.day),
              year: widget.firstTime.year +
                  ((widget.firstTime.month + index - 1) / 12).floor(),
              month: (widget.firstTime.month + index) % 12 == 0
                  ? 12
                  : (widget.firstTime.month + index) % 12,
              onChange: onChange,
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: totalPage,
          controller: pageController,
        ),
      ),
    ]);
  }
}