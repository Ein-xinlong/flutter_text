import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/network/an_base.dart';

part 'banner_bean.g.dart';


@JsonSerializable()
class BannerBean  extends AnResponse{

  List<Data> data;

  int errorCode;

  String errorMsg;

  BannerBean();

  factory BannerBean.fromJson(Map<String, dynamic> srcJson) => _$BannerBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerBeanToJson(this);

}


@JsonSerializable()
class Data {

  String desc;

  int id;

  String imagePath;

  int isVisible;

  int order;

  String title;

  int type;

  String url;

  Data();

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


