

import 'package:dio/dio.dart';
import 'package:untitled/bean/home_list_bean.dart';
import 'package:untitled/commitUI/banner.dart';
import 'package:untitled/network/network.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/log.dart';
import 'package:untitled/vm/base_viewmodel.dart';
import 'package:untitled/bean/banner_bean.dart';
class AndroidHomeVm extends AnBaseViewModel{
  bool isShow=false;//loading是否展示   ture为隐藏  false为展示
  bool noMore = false;
  List<Data> datas = [];
  List<BannerItem> itemBean = [];
  int _pageIndex = 0;
  List<Item> homeList=[];


  ///loading是否显示
  var loadState= AnPageState.Success;
   getBanner() async {
    var dio = AnNetwork.shareInstance();
    await dio.get("banner/json",
        success: (response){
          isShow=true;
          BannerBean bean=  BannerBean.fromJson(response.data);
          itemBean.clear();
        for(int i=0;i<bean.data.length;i++){
          itemBean.add(BannerItem.defaultBannerItem(bean.data[i].imagePath, bean.data[i].title));
        }
          print(itemBean.length.toString());
          notifyListeners();

        },
        failed: (e){
          isShow=true;

          notifyListeners();
        }
    );
  }

   getList(bool isTrue) async {
    if(isTrue){
      _pageIndex=0;
    }else{
      _pageIndex++;
    }
    var dio = AnNetwork.shareInstance();
    await dio.get("article/list/"+_pageIndex.toString()+"/json",
        success: (response){

          HomeList bean= HomeList.fromJson(response.data);
          if (bean.data.datas.length == 0) {
            noMore = true;
          }
          if(bean.data.datas.length>0){
            if(isTrue==true){
              homeList.clear();
              homeList.addAll(bean.data.datas);
            }else{
              homeList.addAll(bean.data.datas);
            }
          }
          isShow=true;
          print(homeList.length.toString());
          notifyListeners();

        },
        failed: (e){
          isShow=true;
          notifyListeners();
        }
    );
  }
  showloadState(){
    isShow=false;
    notifyListeners();
  }
}