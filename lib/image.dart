

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/router.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/loading.dart';
import 'package:untitled/utils/tts.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/vm/image_viewmodel.dart';
import 'package:provider/provider.dart';


class JhPhotoPickerTool extends StatefulWidget {

  @override
  _JhPhotoPickerToolState createState() => _JhPhotoPickerToolState();
}

class _JhPhotoPickerToolState extends State<JhPhotoPickerTool> {

  ImageViewModel vm=new ImageViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomPadding:false,
      appBar: AnAppbar(
        titleContent: "图片加载",
        backPressCallback: null
      ).buildAppBar(),
      body: ChangeNotifierProvider(
        child: Consumer<ImageViewModel>(builder: (context,model,child){
          return AnCommonBody(vm.loadState,bodyWidget:
         Stack(
           children: [
             Column(
               children: [

                 FlatButton(onPressed: (){
                   TtsHelper.instance.setLanguageAndSpeak("Hello, welcome to my demo", "en");
                 }, child:Text("语音测试"),color: Colors.black12,),
                 FlatButton(onPressed: (){
                   vm.showloadState();
                   vm.text();
                   // dialog(context);

                 }, child:Text("get接口测试"),color:vm.getCorrect? Colors.green: Colors.red,),
                 FlatButton(onPressed: (){
                   vm.showloadState();
                   vm.postText();
                   // dialog(context);

                 }, child:Text("post接口测试"),color: vm.postCorrect? Colors.green: Colors.red,),

                 FlatButton(onPressed: (){
                   Navigator.pushNamed(context, Routers.ROUTER_CALENDAR);
                 }, child:Text("日历页面"),color: Colors.black12,),

                 Container(
                   width: 100,
                   child: TextField(
                     maxLines: 1,//最大行数
                     decoration: InputDecoration(
                       hintText: "请输入字体码",
                       border: InputBorder.none,
                     ),

                     textInputAction: TextInputAction.done,
                     inputFormatters: [
                       LengthLimitingTextInputFormatter(50)

                     ],

                     onChanged: (text) {
                       //内容改变的回调
                       print('change $text');
                     },
                     onSubmitted: (text) {
                       //内容提交(按回车)的回调
                       print('submit $text');
                     },
                   ),
                 )
               ],
             ),
             Offstage(
               offstage:vm.isShow ,
               child: PdaLoadingView(),
             )
           ],
         ),);
        },),
        create: (BuildContext context){
          return vm;
        },
      ),
    );
  }






}