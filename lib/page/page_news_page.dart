import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bean/new_page_bean.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/commitUI/button.dart';
import 'package:untitled/page/page_news_details.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/vm/new_page_vm.dart';

class NewsPage extends StatefulWidget {

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewPageVm _vm=NewPageVm();

  @override
  void initState() {
    super.initState();
     _vm.getList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
        titleContent: "新闻",
        backPressCallback: (){
          Navigator.pop(context);
        }
      ).buildAppBar(),
      body:  ChangeNotifierProvider(
          create: (_) => _vm,
          child: Consumer<NewPageVm>(builder: (context, value, child) {
            return AnCommonBody(_vm.loadState, bodyWidget: _body());
          })),
    );
  }
  _body(){
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _vm.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            // 透明
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  Get.to(NewDetails(_vm.list[index]));
                });

              },
              child: item(_vm.list[index]),
            ),
          );
        },
      ),
    );
  }
  item(Result result){
    return Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(result.title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        SizedBox(height: 10,),
        Image.network(result.image!,width:double.infinity,height: 150,fit: BoxFit.fill,),
        SizedBox(height: 10,),
        Text(result.passtime!),
        SizedBox(height: 15,)
      ],
    ),);
  }
}
