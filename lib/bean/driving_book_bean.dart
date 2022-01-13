import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/network/an_base.dart';

part 'driving_book_bean.g.dart';


@JsonSerializable(explicitToJson: true)
class DrivingBookBean extends AnResponse{

  String statusCode;

  String desc;

  Result result;

  DrivingBookBean();

  factory DrivingBookBean.fromJson(Map<String, dynamic> srcJson) => _$DrivingBookBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DrivingBookBeanToJson(this);

}


@JsonSerializable()
class Result {

  List<DriverQuestionList> driverQuestionList;

  int totalCount;

  Result();

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}


@JsonSerializable()
class DriverQuestionList{

  int questionID;

  String question;

  String questionType;

  String optionA;

  String optionB;

  String optionC;

  String optionD;

  String key;

  String imageURL;

  String explains;

  String licenseType;

  String subjectType;

  int colorOne;///记录显示的颜色，接口没有返回前端自定义    默认白色 2为回答正确绿色  3为回答错误红色

  int colorTwo;

  int colorThree;

  int colorFour;

  bool isShow;

  DriverQuestionList();

  factory DriverQuestionList.fromJson(Map<String, dynamic> srcJson) => _$DriverQuestionListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DriverQuestionListToJson(this);

}


