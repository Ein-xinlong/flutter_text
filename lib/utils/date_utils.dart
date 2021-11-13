
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

String formatWeek(DateTime time){

  var format = DateFormat('yyyy.MM.dd (EEE)','zh_CN');
  return format.format(time).replaceFirst("周","");

}
///获取这个月1号到今天
String getThisTime() {
  return DateTime.now().year.toString() +
      "." +
      DateTime.now().month.toString() +
      "." +
      "1" +
      "-" +
      DateTime.now().year.toString() +
      "." +
      DateTime.now().month.toString() +
      "." +
      DateTime.now().day.toString();
}
///日期点确定后返回数据
String retureDate(String data) {
  print("year" + data);
  String year = data.substring(0, 4);
  String month = data.substring(5, 7);
  String day = data.substring(8, 10);
  print('startDate=$year,$month,$day');
  return year + "." + month + "." + day;
}

String calendarManager(int pos) {
  var formater = DateFormat('yyyy.MM.dd');
  DateTime now = DateTime.now(); //2021.8.24   获取今天的日期

  String today = formater.format(DateTime.now()); //2021.8.24   获取今天的日期
  String year = today.substring(0, 4); //2021 今年
  String month = today.substring(5, 7); //08  这个月
// String day=today.substring(8,10);//24  今天
  int nowyear = DateTime.now().year; //今年
  int nowmonth = DateTime.now().month; //这个月是几月
  print("month="+nowmonth.toString());
  int nowday = DateTime.now().day; //今天
  int weekday = DateTime.now().weekday; //今天是本周的第几天
  String weekstart =
  new DateTime(nowyear, nowmonth, nowday - weekday + 1).toString(); //本周一的时间
  String weekend =
  new DateTime(nowyear, nowmonth, nowday - weekday + 7).toString(); //本周日的时间
  String lastweekstart =
  new DateTime(nowyear, nowmonth, nowday - weekday - 6).toString(); //上周一的时间
  String lastweekend =
  new DateTime(nowyear, nowmonth, nowday - weekday).toString(); //上周日的时间
  print(lastweekstart);
  print(lastweekend);
  if (pos == 0) {
    //如果等于0 则返回今天日期
    return formater.format(now);
  } else if (pos == 1) {
    //如果等于1 则返回昨天日期
    var yestoday = now.subtract(new Duration(days: 1));
    return formater.format(yestoday);
  } else if (pos == 2) {//如果等于2 则返回本周日期
    var day = now.day;
    var weekday = now.weekday;//显示几天第几天，1-7
    print('day=$day,week=$weekday');
    var week = now.subtract(new Duration(days: weekday-1));
    return formater.format(week);
  } else if (pos == 3) {
    //如果等于3 则返回上周日期
    var weekday = now.weekday;
    var week = now.subtract(new Duration(days: weekday+6));
    return formater.format(week);
  } else if (pos == 4) {
    //如果等于4则返回本月日期
    return year + "." + month + ".01";
  } else if (pos == 5) {
    //如果等于5 则返回上月日期
    return formater.format(DateTime(nowyear, int.parse(month)-1 , 01));
  } else if (pos == 6) {
    //如果等于6 则返回这个月日期
    return formater.format(DateTime(nowyear, int.parse(month) , 01).subtract(new Duration(days: 1)));
  } else if (pos == 7) {
    //返回上个星期末
    var weekday = now.weekday;
    var week = now.subtract(new Duration(days: weekday));
    return formater.format(week);
  }
}

