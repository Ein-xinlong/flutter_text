import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:untitled/utils/colors.dart';
import 'package:untitled/calendar/time_util.dart';


class DayGridView extends StatefulWidget {
  DateTime initDate;
  DateTime selectDate;
  int year;
  int month;
  ValueChanged onChange;

  DayGridView({
    Key key,
    @required this.initDate,
    @required this.selectDate,
    @required this.year,
    @required this.month,
    this.onChange,
  });

  @override
  State<DayGridView> createState() => _DayGridViewState();
}

class _DayGridViewState extends State<DayGridView> {
  DateTime startTime;
  DateTime endTime;
  @override
  void initState() {
    super.initState();
  }

  List<Widget> dayItems() {
    List days = TimeUtil.getDay(
        widget.year, widget.month, MaterialLocalizations.of(context));
    List dayWidgets = days.map((value) {
      if (value is int) {
        return Container();
      }
      // if (value == widget.selectDate) {
      //
      //   return GestureDetector(
      //     onTap: () {
      //       widget.onChange(widget.selectDate);
      //       comparisonTime(value);
      //       print("1");
      //     },
      //     child: Container(
      //       color: WHITE,
      //       alignment: Alignment.center,
      //       child: Container(
      //         width: 60,
      //         height: 60,
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //           color: Colors.green,
      //           borderRadius: BorderRadius.all(Radius.circular(100)),
      //         ),
      //         child: Text(
      //           value.day.toString(),
      //           style: TextStyle(color: WHITE),
      //         ),
      //       ),
      //     ),
      //   );
      // } else {
      //
      //
      // }
      if (value == widget.initDate) {
        return GestureDetector(
          onTap: () {
            widget.onChange(widget.initDate);
            comparisonTime(value);
            print("2");
          },
          child: Container(
              color: WHITE,
              alignment: Alignment.center,
              child: Text(
                value.day.toString(),
                style: TextStyle(color: CALENDAR_COLOR),
              )),
        );
      } else {
        if (value.isAfter(widget.initDate)) {
          /// 在今天之后的时间无法点击
          return GestureDetector(
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  value.day.toString(),
                  style: TextStyle(color:CALENDAR_NOT),
                )),
          );
        } else {
          if(startTime!=null&&endTime!=null){
            if(value==startTime){
              return  Container(
                color: WHITE,
                alignment: Alignment.center,
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: getColor(value),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft: Radius.circular(100)),
                  ),
                  child: Text(
                    value.day.toString(),
                    style: TextStyle(color: WHITE),
                  ),
                ),
              );
            }else if(value==endTime){
              return  Container(
                color: WHITE,
                alignment: Alignment.center,
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: getColor(value),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(100),bottomRight: Radius.circular(100)),
                  ),
                  child: Text(
                    value.day.toString(),
                    style: TextStyle(color: WHITE),
                  ),
                ),
              );
            }else{
              print("看下执行的哪个方法222");
              /// 在今天之前的时间可以点击
              return GestureDetector(
                onTap: () {
                  widget.onChange(value);
                  comparisonTime(value);
                  print("3");
                },
                child: Container(
                    color:getColor(value),
                    alignment: Alignment.center,

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100),),
                      ),
                      child: Text(
                        value.day.toString(),
                        style: TextStyle(color: BLACK),
                      ),
                    )),
              );
            }
          }else{
            /// 在今天之前的时间可以点击
            print("看下执行的哪个方法111");
            return GestureDetector(

              onTap: () {
                widget.onChange(value);
                comparisonTime(value);
                print("3");
              },
              child: Container(
                  color:WHITE,
                  alignment: Alignment.center,
                  child: Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:getColor(value),
                      borderRadius: BorderRadius.all(Radius.circular(100),),
                    ),
                    child: Text(
                      value.day.toString(),
                      style: TextStyle(color: BLACK),
                    ),
                  )),
            );
          }
        }
      }
    }).toList();
    return dayWidgets;
  }

  Color getColor(DateTime value){
    if(startTime==null&&endTime==null){
      return WHITE;
    }else{
      if(startTime!=null&&value==startTime){
        return Colors.green;
      }
      if(endTime!=null&&value==endTime){
        return Colors.green;
      }
      if(startTime!=null&&endTime!=null){
        if(value.isAfter(startTime)&&value.isBefore(endTime)){
          return CALENDAR_SECTION;
        }
      }else{
        return WHITE;
      }
    }

  }

  comparisonTime(DateTime value){
    if(startTime==null){
      startTime=value;
    }else{
      if(startTime.isAfter(value)){
        startTime=value;
        endTime=null;
      }else{
        if(endTime==null){
          endTime=value;
        }else{
          startTime=value;
          endTime=null;
        }
      }
    }
    print("测试开始时间"+startTime.toString());
    print("测试结束时间"+endTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = dayItems();
    return  Column(
      children: [
        SizedBox(height: 20,),
        Container(
          alignment: Alignment.topCenter,
          child:Center(
            child: Row(
                mainAxisSize:MainAxisSize.min,
              children: [
                Text(widget.year.toString()+"年",style: TextStyle(fontSize: 15,),),
                Text(widget.month.toString()+"月",style: TextStyle(fontSize: 15,),)
              ],
            ),
          ),
        ),
        Container(
          height:300,
          child: GridView.custom(
              gridDelegate:
              _DayPickerGridDelegate(mainAxisNumber: list.length > 35 ? 6 : 5),
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              childrenDelegate:
              SliverChildListDelegate(list, addRepaintBoundaries: false)),
        )
      ],
    );
  }
}

/// 自定义GridView
class _DayPickerGridDelegate extends SliverGridDelegate {
  final int mainAxisNumber;

  const _DayPickerGridDelegate({
    this.mainAxisNumber,
  });

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;
    final double tileWidth = constraints.crossAxisExtent / columnCount;
    final double tileHeight = 300 / mainAxisNumber;
    return SliverGridRegularTileLayout(
      crossAxisCount: columnCount,
      mainAxisStride: tileHeight,
      crossAxisStride: tileWidth,
      childMainAxisExtent: tileHeight,
      childCrossAxisExtent: tileWidth,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_DayPickerGridDelegate oldDelegate) => false;
}

const _DayPickerGridDelegate _kDayPickerGridDelegate = _DayPickerGridDelegate();