// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'girl_page_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GirlPageBean _$GirlPageBeanFromJson(Map<String, dynamic> json) => GirlPageBean()
  ..errorCode = json['errorCode'] as int
  ..errorMsg = json['errorMsg'] as String
  ..errorDesc = json['errorDesc'] as String
  ..responseId = json['responseId'] as String
  ..code = json['code'] as int
  ..message = json['message'] as String
  ..result = (json['result'] as List<dynamic>)
      .map((e) => Result.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$GirlPageBeanToJson(GirlPageBean instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'errorDesc': instance.errorDesc,
      'responseId': instance.responseId,
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result()
  ..id = json['id'] as int
  ..time = json['time'] as String
  ..img = json['img'] as String;

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'img': instance.img,
    };
