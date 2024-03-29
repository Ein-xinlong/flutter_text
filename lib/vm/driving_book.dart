import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:untitled/bean/driving_book_bean.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/vm/base_viewmodel.dart';

class DrivingBookVm extends AnBaseViewModel{
  List<DriverQuestionList> list=[];
  var rng = new Random();
  Future getpost() async{
    Dio post = Dio()
      ..options = BaseOptions(
          baseUrl: "https://api.apishop.net/common",
          connectTimeout: Duration(minutes: 10),
          receiveTimeout: Duration(days: 1),
          responseType: ResponseType.json,
          headers: {"Content-Type": "application/json; charset=utf-8"});
    FormData formData = FormData.fromMap({
      "apiKey": "ivXyZaLffe39b9a07e29b9f093a614c3a2c7dc677b557ab",
      "page": (rng.nextInt(13) + 1).toString(),
      "pageSize": "100",
      "licenseType": 0,
      "subjectType": 0,
    });
    var result= await post.post("/driverLicense/queryQuestionList",data: formData);
    print(result.data);
   var aa= json.decode(result.data);
   //Map map= new Map<String, dynamic>.from(aa);
    Map<String, dynamic> map = Map<String, dynamic>.from(aa);
    DrivingBookBean bean= DrivingBookBean.fromJson(map);
    list.addAll(bean.result!.driverQuestionList!);
    loadState=AnPageState.Success;
    notifyListeners();

  }
  String? getTitle(String questionType){
    switch(questionType){
      case "1":
        return "判断 ";
        break;
      case "2":
        return "单选";
        break;
      case "3":
        return "多选";
        break;
     }
  }


}