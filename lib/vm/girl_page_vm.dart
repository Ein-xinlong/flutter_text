

import 'package:dio/dio.dart';
import 'package:untitled/bean/girl_page_bean.dart';
import 'package:untitled/utils/common_body.dart';
 import 'package:untitled/vm/base_viewmodel.dart';

class GirlPageVm extends AnBaseViewModel{
  Dio dio = Dio()
    ..options = BaseOptions(
        baseUrl: "https://api.apiopen.top",
        connectTimeout: 10000,
        receiveTimeout: 1000 * 60 * 60 * 24,
        responseType: ResponseType.json,
        headers: {"content-type": "application/json;charset=UTF-8"});
  List<Result> list=[];
  Future getList() async{
    var s= await dio.post("/getImages",data: {"page":"2","count":"10"});
    GirlPageBean bean= GirlPageBean.fromJson(s.data);
    list.addAll(bean.result);
    loadState= AnPageState.Success;
    notifyListeners();
  }
}