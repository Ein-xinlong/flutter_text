import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/network/an_base.dart';

part 'girl_page_bean.g.dart';


@JsonSerializable()
class GirlPageBean extends AnResponse {

  int? code;

  String? message;

  List<Result>? result;

  GirlPageBean();

  factory GirlPageBean.fromJson(Map<String, dynamic> srcJson) => _$GirlPageBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GirlPageBeanToJson(this);

}


@JsonSerializable()
class Result  {

  int? id;

  String? time;

  String? img;

  Result();

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}


