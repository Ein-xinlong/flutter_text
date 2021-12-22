import 'package:json_annotation/json_annotation.dart';

part 'an_base.g.dart';


@JsonSerializable(explicitToJson: true)
class AnResponse {
  @JsonKey(name: "errorCode")
  int errorCode;

  @JsonKey(name: "errorMsg")
  String errorMsg;

  @JsonKey(name: "errorDesc")
  String errorDesc;

  @JsonKey(name: "responseId")
  String responseId;

  AnResponse();

  factory AnResponse.fromJson(Map<String, dynamic> json) =>
      _$AnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnResponseToJson(this);
}
