

import 'package:dio/dio.dart';
import 'package:untitled/bean/new_page_bean.dart';
import 'package:untitled/network/network.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/log.dart';
import 'package:untitled/vm/base_viewmodel.dart';

class NewPageVm extends AnBaseViewModel{
  Dio dio = Dio()
    ..options = BaseOptions(
        baseUrl: "https://api.apiopen.top",
        connectTimeout: Duration(minutes: 10),
        receiveTimeout: Duration(days: 1),
        responseType: ResponseType.json,
        headers: {"content-type": "application/json;charset=UTF-8"});
  List<Result> list=[];
  Future getList() async{
   var s= await dio.post("/getWangYiNews",data: {"page":"2","count":"10"});
  NewPageBean bean= NewPageBean.fromJson(s.data);
  list.addAll(bean.result!);
   loadState= AnPageState.Success;
  notifyListeners();
  }
}