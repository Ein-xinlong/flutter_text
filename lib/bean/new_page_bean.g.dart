// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_page_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPageBean _$NewPageBeanFromJson(Map<String, dynamic> json) {
  return NewPageBean()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..errorDesc = json['errorDesc'] as String
    ..responseId = json['responseId'] as String
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..result = (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewPageBeanToJson(NewPageBean instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'errorDesc': instance.errorDesc,
      'responseId': instance.responseId,
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    json['path'] as String,
    json['image'] as String,
    json['title'] as String,
    json['passtime'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'path': instance.path,
      'image': instance.image,
      'title': instance.title,
      'passtime': instance.passtime,
    };
