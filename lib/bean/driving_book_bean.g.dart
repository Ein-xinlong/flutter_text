// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driving_book_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrivingBookBean _$DrivingBookBeanFromJson(Map<String, dynamic> json) {
  return DrivingBookBean()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..errorDesc = json['errorDesc'] as String
    ..responseId = json['responseId'] as String
    ..statusCode = json['statusCode'] as String
    ..desc = json['desc'] as String
    ..result = json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DrivingBookBeanToJson(DrivingBookBean instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'errorDesc': instance.errorDesc,
      'responseId': instance.responseId,
      'statusCode': instance.statusCode,
      'desc': instance.desc,
      'result': instance.result?.toJson(),
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result()
    ..driverQuestionList = (json['driverQuestionList'] as List)
        ?.map((e) => e == null
            ? null
            : DriverQuestionList.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'driverQuestionList': instance.driverQuestionList,
      'totalCount': instance.totalCount,
    };

DriverQuestionList _$DriverQuestionListFromJson(Map<String, dynamic> json) {
  return DriverQuestionList()
    ..questionID = json['questionID'] as int
    ..question = json['question'] as String
    ..questionType = json['questionType'] as String
    ..optionA = json['optionA'] as String
    ..optionB = json['optionB'] as String
    ..optionC = json['optionC'] as String
    ..optionD = json['optionD'] as String
    ..key = json['key'] as String
    ..imageURL = json['imageURL'] as String
    ..explains = json['explains'] as String
    ..licenseType = json['licenseType'] as String
    ..subjectType = json['subjectType'] as String
    ..colorOne = json['colorOne'] as int
    ..colorTwo = json['colorTwo'] as int
    ..colorThree = json['colorThree'] as int
    ..colorFour = json['colorFour'] as int;
}

Map<String, dynamic> _$DriverQuestionListToJson(DriverQuestionList instance) =>
    <String, dynamic>{
      'questionID': instance.questionID,
      'question': instance.question,
      'questionType': instance.questionType,
      'optionA': instance.optionA,
      'optionB': instance.optionB,
      'optionC': instance.optionC,
      'optionD': instance.optionD,
      'key': instance.key,
      'imageURL': instance.imageURL,
      'explains': instance.explains,
      'licenseType': instance.licenseType,
      'subjectType': instance.subjectType,
      'colorOne': instance.colorOne,
      'colorTwo': instance.colorTwo,
      'colorThree': instance.colorThree,
      'colorFour': instance.colorFour,
    };
