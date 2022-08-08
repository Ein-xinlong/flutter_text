

import 'package:dio/dio.dart';
import 'package:untitled/bean/main_list.dart';
import 'package:untitled/network/network.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/log.dart';
import 'package:untitled/vm/base_viewmodel.dart';

class ImageViewModel extends AnBaseViewModel{
  bool isShow=true;//loading是否展示   ture为隐藏  false为展示
  bool getCorrect=false;  //get请求是否成功
  bool postCorrect=false; //post请求是否成功
  List<MainList> list=[];
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
  loadingMainList(){
    MainList mainList=MainList();
    mainList.ListItemString="小工具集合";
    ItemList itemList=ItemList();
    itemList.itemName="Get请求";
    itemList.imageUrl="地址测试1";
    itemList.marker=0;
    ItemList itemList1=ItemList();
    itemList1.itemName="Post请求";
    itemList1.imageUrl="地址测试1";
    itemList1.marker=1;
    ItemList itemList2=ItemList();
    itemList2.itemName="切换主题";
    itemList2.imageUrl="地址测试1";
    itemList2.marker=2;
    ItemList itemList3=ItemList();
    itemList3.itemName="通知";
    itemList3.imageUrl="地址测试1";
    itemList3.marker=3;
    mainList.item.add(itemList);
    mainList.item.add(itemList1);
    mainList.item.add(itemList2);
    mainList.item.add(itemList3);


    MainList mainList1=MainList();
    mainList1.ListItemString="新页面集合";
    ItemList itemList4=ItemList();
    itemList4.itemName="日历页面";
    itemList4.imageUrl="地址测试1";
    itemList4.marker=4;
    ItemList itemList5=ItemList();
    itemList5.itemName="炫酷时钟";
    itemList5.imageUrl="地址测试1";
    itemList5.marker=5;
    ItemList itemList6=ItemList();
    itemList6.itemName="白板";
    itemList6.imageUrl="地址测试1";
    itemList6.marker=6;
    ItemList itemList7=ItemList();
    itemList7.itemName="玩android";
    itemList7.imageUrl="地址测试1";
    itemList7.marker=7;
    ItemList itemList8=ItemList();
    itemList8.itemName="随机数";
    itemList8.imageUrl="地址测试1";
    itemList8.marker=8;
    ItemList itemList9=ItemList();
    itemList9.itemName="新闻";
    itemList9.imageUrl="地址测试1";
    itemList9.marker=9;
    ItemList itemList10=ItemList();
    itemList10.itemName="美女";
    itemList10.imageUrl="地址测试1";
    itemList10.marker=10;
    ItemList itemList11=ItemList();
    itemList11.itemName="驾照考试题";
    itemList11.imageUrl="地址测试1";
    itemList11.marker=11;
    ItemList itemList12=ItemList();
    itemList12.itemName="Animation";
    itemList12.imageUrl="地址测试1";
    itemList12.marker=12;
    ItemList itemList13=ItemList();
    itemList13.itemName="计数器动画";
    itemList13.imageUrl="地址测试1";
    itemList13.marker=13;



    mainList1.item.add(itemList4);
    mainList1.item.add(itemList5);
    mainList1.item.add(itemList6);
    mainList1.item.add(itemList7);
    mainList1.item.add(itemList8);
    mainList1.item.add(itemList9);
    mainList1.item.add(itemList10);
    mainList1.item.add(itemList11);
    mainList1.item.add(itemList12);
    mainList1.item.add(itemList13);

    list.add(mainList);
    list.add(mainList1);
    notifyListeners();
  }

}