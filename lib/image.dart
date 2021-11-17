

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:untitled/router.dart';
import 'package:untitled/utils/loading_dialog.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/loading.dart';
import 'package:untitled/utils/toash.dart';
import 'package:untitled/utils/tts.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/vm/image_viewmodel.dart';
import 'package:provider/provider.dart';
const double itemSpace = 10.0;
const double space = 5.0; //上下左右间距
const double deleBtnWH = 20.0;
const Color bgColor = Colors.white;
const int maxCount = 3;// 最大选择图片数量
typedef CallBack = void Function(List imgData);

class JhPhotoPickerTool extends StatefulWidget {
  final double lfPaddingSpace; //外部设置的左右间距
  final CallBack callBack;

  JhPhotoPickerTool({
    this.lfPaddingSpace,
    this.callBack,
  });

  @override
  _JhPhotoPickerToolState createState() => _JhPhotoPickerToolState();
}

class _JhPhotoPickerToolState extends State<JhPhotoPickerTool> {
  List _imgData = List(); //图片list
  List imgDefaultData = List(); //图片list
  List<AssetEntity> imgPicked = [];
  ImageViewModel vm=new ImageViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   imgDefaultData.add("selectPhoto_add"); //先添加 加号按钮 的图片
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    List data = List();
    data.addAll(_imgData);
    // data.removeAt(_imgData.length - 1);
    widget.callBack(data);
  }

  @override
  Widget build(BuildContext context) {
    var kScreenWidth = MediaQuery.of(context).size.width;

    var lfPadding = widget.lfPaddingSpace == null ? 0.0 : widget.lfPaddingSpace;
    var ninePictureW = (kScreenWidth - space * 2 - 2 * itemSpace - lfPadding);
    var itemWH = ninePictureW / maxCount;
    int columnCount = _imgData.length > 6 ? 3 : _imgData.length <= 3 ? 1 : 2;

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
                 Container(
                     color: bgColor,
                     width: kScreenWidth - lfPadding,
                     height:
                     columnCount * itemWH + space * 2 + (columnCount - 1) * itemSpace,
                     child: GridView.builder(
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           //可以直接指定每行（列）显示多少个Item
                           //一行的Widget数量
                           crossAxisCount: 3,
                           crossAxisSpacing: itemSpace, //水平间距
                           mainAxisSpacing: itemSpace, //垂直间距
                           childAspectRatio: 1.0, //子Widget宽高比例
                         ),
                         physics: NeverScrollableScrollPhysics(),
                         padding: EdgeInsets.all(space),
                         //GridView内边距
                         itemCount: _imgData.length== maxCount?_imgData.length: (_imgData.length + imgDefaultData.length),
                         itemBuilder: (context, index) {
                           if (_imgData.length == maxCount) {
                             return imgItem(index, setState, _imgData, imgPicked);
                           } else {
                             if (index == _imgData.length) {
                               return addBtn(context, setState, imgDefaultData, imgPicked);
                             } else {
                               return imgItem(index, setState, _imgData, imgPicked);
                             }
                           }
                         })),
                 FlatButton(onPressed: (){
                   TtsHelper.instance.setLanguageAndSpeak("你好我是测试语音", "zh");
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

  dialog(BuildContext context){
    if(vm.isShow==false){
      return showDialog(
          context: context, //BuildContext对象
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new LoadingDialog( //调用对话框
              text: '正在获取详情...',
            );
          });
    }else{
      return null;
    }
  }

  /** 添加按钮 */
  Widget addBtn(context, setState, imgData, imgPicked) {
    return GestureDetector(
      child: Container(
        color: Color(0xffF7F7F7),
        padding: EdgeInsets.all(40),
        child: Icon(Icons.add),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return new Container(
              height: 195.0,
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    height:50,
                    child: Text('拍摄'),
                    onPressed: () async {
                      Navigator.pop(context);
                      var image = await ImagePicker.pickImage(
                          source: ImageSource.camera);
                      print(image);
                      if(image.absolute.path.contains('.he') || image.absolute.path.contains('.HE')){
                        String jpegPath = await HeicToJpg.convert(image.absolute.path);
                        _imgData.insert(_imgData.length, jpegPath);
                      }
                      else{
                        _imgData.insert(_imgData.length, image.absolute.path);
                      }
                      // _imgPicked.add(image);

                      setState(() {});

                    },
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Color(0xffF4F4F4),
                    ),
                  ),
                  MaterialButton(
                    height:50,
                    child: Text('从手机相册选择'),
                    onPressed: () async {
                      pickAsset(context, setState, _imgData, imgPicked);
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(
                      color: Color(0xffF4F4F4),
                    ),
                  ),
                  MaterialButton(
                    height:50,
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ).then((val) {
          print(val);
        });
      },
    );
  }

  /** 多图选择 */
  void pickAsset(context, setState, imgData, imgPicked) async {
    final result = await PhotoPicker.pickAsset(
        context: context,
        pickedAssetList: imgPicked,
        maxSelected: maxCount - _imgData.length,
        pickType: PickType.onlyImage);

    if (result != null && result.isNotEmpty) {
      for (var e in result) {
        var file = await e.file;
//         if (!imgData.contains(file.absolute.path)) {// 如果想避免重复选同一张图片，可以加上这个判断
        if(file.absolute.path.contains('.he') || file.absolute.path.contains('.HE')){// 这个判断的意义请继续往下看
          String jpegPath = await HeicToJpg.convert(file.absolute.path);
          _imgData.insert(_imgData.length, jpegPath);
        }
        else{
          _imgData.insert(_imgData.length, file.absolute.path);
        }

        // }
      }
    }
    setState(() {});
  }

  /** 图片和删除按钮 */
  Widget imgItem(index, setState, imgData, imgPicked) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Stack(alignment: Alignment.topRight, children: <Widget>[
          ConstrainedBox(
            child: Image.file(File(imgData[index]), fit: BoxFit.cover),
            constraints: BoxConstraints.expand(),
          ),
          GestureDetector(
            child: Icon(Icons.add),
            onTap: () {
              //点击删除按钮
              setState(() {
                _imgData.removeAt(index);
                // imgPicked.removeAt(index);
              });
            },
          )
        ]),
      ),
      onTap: () {
        Toast.toast(context, "点击了第${index}张图片");
      },
    );
  }
}