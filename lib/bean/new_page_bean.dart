import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/network/an_base.dart';

part 'new_page_bean.g.dart';


@JsonSerializable()
class NewPageBean extends AnResponse {

  int? code;

  String? message;

  List<Result>? result;

  NewPageBean();

  factory NewPageBean.fromJson(Map<String, dynamic> srcJson) => _$NewPageBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewPageBeanToJson(this);

}


@JsonSerializable()
class Result {

  String? path;

  String? image;

  String? title;

  String? passtime;

  Result(this.path,this.image,this.title,this.passtime,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}


