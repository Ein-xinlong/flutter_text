

import 'package:dio/dio.dart';
import 'package:untitled/network/network.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/log.dart';
import 'package:untitled/vm/base_viewmodel.dart';

class ImageViewModel extends AnBaseViewModel{
  bool isShow=true;//loading是否展示   ture为隐藏  false为展示
  bool getCorrect=false;  //get请求是否成功
  bool postCorrect=false; //post请求是否成功
  ///loading是否显示
  var loadState= AnPageState.Success;
  void text() async {
    var dio = AnNetwork.shareInstance();
    dio.get("get",
        success: (response){
          isShow=true;
          getCorrect=true;
          print(response.data.toString());
          notifyListeners();
          Log.e(response.data.toString());
        },
        failed: (e){
          isShow=true;
          getCorrect=false;
          notifyListeners();
        }
    );
  }

  void postText() async{
    var dio = AnNetwork.shareInstance();
    await dio.post(
      'post',
      paramaters: {
        "data": {
          "username": "666666@qq.com", //订单号
          "password": "666", //订单号
        },
      },
      options: Options(contentType: Headers.jsonContentType),
      success: (response) {
        isShow=true;
        postCorrect=true;
        print(response.data.toString());
        notifyListeners();
        Log.e(response.data.toString());
      },
      failed: (error) {
        isShow=true;
        postCorrect=false;
        notifyListeners();
      },

    );
  }
  showloadState(){
    isShow=false;
    notifyListeners();
  }
}