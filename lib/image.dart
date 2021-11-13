import 'package:flutter/material.dart';


import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
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

    return Container(
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
            }));
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
        print("点击第${index}张图片");
      },
    );
  }
}