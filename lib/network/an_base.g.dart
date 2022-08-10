// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'an_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnResponse _$AnResponseFromJson(Map<String, dynamic> json) => AnResponse()
  ..errorCode = json['errorCode'] as int
  ..errorMsg = json['errorMsg'] as String
  ..errorDesc = json['errorDesc'] as String
  ..responseId = json['responseId'] as String;

Map<String, dynamic> _$AnResponseToJson(AnResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'errorDesc': instance.errorDesc,
      'responseId': instance.responseId,
    };
