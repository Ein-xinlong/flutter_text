import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/network/an_base.dart';

part 'home_list_bean.g.dart';


@JsonSerializable()
class HomeList extends AnResponse {

  Datas? data;

  int? errorCode;

  String? errorMsg;

  HomeList();

  factory HomeList.fromJson(Map<String, dynamic> srcJson) => _$HomeListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeListToJson(this);

}


@JsonSerializable()
class Datas extends Object {

  int? curPage;

  List<Item>? datas;

  int? offset;

  bool? over;

  int? pageCount;

  int? size;

  int? total;

  Datas();

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

}


@JsonSerializable()
class Item extends Object {

  String? apkLink;

  int? audit;

  String? author;

  bool? canEdit;

  int? chapterId;

  String? chapterName;

  bool? collect;

  int? courseId;

  String? desc;

  String? descMd;

  String? envelopePic;

  bool? fresh;

  String? host;

  int? id;

  String? link;

  String? niceDate;

  String? niceShareDate;

  String? origin;

  String? prefix;

  String projectLink="";

  int? publishTime;

  int? realSuperChapterId;

  int? selfVisible;

  int? shareDate;

  String? shareUser;

  int? superChapterId;

  String? superChapterName;

  List<dynamic>? tags;

  String? title;

  int? type;

  int? userId;

  int? visible;

  int? zan;

  Item();

  factory Item.fromJson(Map<String, dynamic> srcJson) => _$ItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

}


