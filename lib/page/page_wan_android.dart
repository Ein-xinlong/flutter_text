import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bean/home_list_bean.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/loading.dart';
import 'package:untitled/vm/android_home_viewmodel.dart';

import '../commitUI/banner.dart';

class AndroidHome extends StatefulWidget {
  @override
  _AndroidHomeState createState() => _AndroidHomeState();
}

class _AndroidHomeState extends State<AndroidHome> {
  AndroidHomeVm _vm = AndroidHomeVm();
  EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vm.getBanner();
    _vm.getList(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AnAppbar(
            titleContent: "玩Android",
            backPressCallback: () {
              Navigator.pop(context);
            }).buildAppBar(),
        body: ChangeNotifierProvider(
          create: (_) => _vm,
          child: Consumer<AndroidHomeVm>(builder: (context, value, child) {
            return AnCommonBody(value.loadState,
                bodyWidget:
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: EasyRefresh(
                              child: Column(
                                children: [
                                  BannerWidget(
                                    180.0,
                                    value.itemBean,
                                    bannerPress: (pos, item) {
                                      //TODO去做特别的逻辑
                                    },
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _vm.homeList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      return Material(
                                        // 透明
                                        color: Colors.transparent,
                                        child: Ink(
                                          color: Colors.white,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {});
                                            },
                                            child: item(_vm.homeList[index]),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                              controller: _easyRefreshController,
                              header: MaterialHeader(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                              footer: MaterialFooter(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                              onRefresh: () async {
                                // 下拉刷新
                                await _vm.getList(true);
                                await _vm.getBanner();
                                _easyRefreshController.finishLoad(
                                    success: true, noMore: _vm.noMore);
                              },
                              onLoad: () async {
                                // 上拉加载
                                await _vm.getList(false);

                                _easyRefreshController.finishLoad(
                                    success: true, noMore: _vm.noMore);
                              },
                            )),
                      ],
                    ),
                    Offstage(
                      offstage:_vm.isShow ,
                      child: PdaLoadingView(),
                    )
                  ],
                )
                );
          }),
        ));
  }

  item(Item item) {
    return Card(child: Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                  child:Center(
                    child: Text(item.author!.length<1?"空":item.author!.substring(0,1),style: TextStyle(color: Colors.white),),
                  ),
                ),

              ),
              SizedBox(width: 5,),
              Text(item.author==null?"":item.author!,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(width: 5,),
              Visibility(child: Container(
                decoration: new BoxDecoration(
//背景
                  color: Colors.white,
                  //设置四周圆角 角度
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  //设置四周边框
                  border: new Border.all(width: 1, color: Colors.blue),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5,right: 5,top: 0,bottom:0),
                  child:Center(
                    child: Text("最新",style: TextStyle(color: Colors.grey),),
                  ),
                ),
              ),visible: item.fresh!?true:false,),
              Spacer(),
              Icon(Icons.restore,size: 13,),
              Text(item.niceDate.toString(),style: TextStyle(color: Colors.grey,fontSize: 13),),
            ],
          ),
          SizedBox(height: 10,),
          Text(item.title.toString(),style: TextStyle(color: Colors.grey,fontSize: 14),),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom:3),
                    child:Center(
                      child: Text(item.superChapterName!,style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),

              ),
              SizedBox(width: 5,),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom:3),
                    child:Center(
                      child: Text("广场",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),

              ),
              Spacer(),
            ],
          )
        ],
      ),
    ),);
  }
}
