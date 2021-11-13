
import 'package:common_utils/common_utils.dart';
import 'package:intl/intl.dart';
//number 为后台返回的double类型数字  index为想要保留几位  自动抹零   返回string类型字符串
String planTotalAmt(double number, int index) {
  if(number==null){
    return "--";
  }
  //小数点的处理
  double num = (NumUtil.getNumByValueDouble(number, index));
  String endString = num.toStringAsFixed(index).substring(
      num.toString().lastIndexOf("."), num
      .toString()
      .length).toString();
  if (endString == ".0") {
    endString = "";
  }
  String startString = num.toStringAsFixed(index).substring(
      0, num.toString().lastIndexOf(".")).toString();
  return startString + endString;
}

///转换为2021.10.01(五)-2021.10.25(一)
String formatDate(DateTime date){
  var formatter = DateFormat('yyyy.MM.dd HH:mm:ss');
  String week= weekDay(date.weekday);
  String dateStr = formatter.format(date)+week;

  return dateStr;
}

String weekDay(int number){
  switch (number){
    case 1:
      return "(一)";
    case 2:
      return "(二)";
    case 3:
      return "(三)";
    case 4:
      return "(四)";
    case 5:
      return "(五)";
    case 6:
      return "(六)";
    case 7:
      return "(日)";
  }
}

String dateTransition(DateTime date){
  var formatter = DateFormat('yyyy/MM/dd HH:mm:ss');
  String dateStr = formatter.format(date);
  return dateStr;
}