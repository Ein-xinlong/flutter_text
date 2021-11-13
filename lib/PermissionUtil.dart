import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';//toast
import 'package:image_picker/image_picker.dart';//从相册里面选择图片或者拍照获取照片


class HeadImageUploadPage extends StatefulWidget {
  @override
  _HeadImageUploadPageState createState() => _HeadImageUploadPageState();
}

class _HeadImageUploadPageState extends State<HeadImageUploadPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Row(
        children: [
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image,width: 200,height: 200,),
          ),
          FlatButton(onPressed: (){_upLoadImage();}, child:Text("请求接口")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  List<String> imagePath(String imagelist){
    print(imagelist.split(",").toString());
    return imagelist.split(",");
  }
//上传图片
  _upLoadImage(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return AnimatedPadding(padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            child: Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: double.infinity,
                    color: Colors.black54,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "详细信息",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, 0, 20, 0),
                            child: Container(
                                width: 20,
                                child: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                )),
                          ),

                        ],
                      ),
                      Expanded(
                        child: Container(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [

                                Container(
                                  height: 200,
                                  width: 200,
                                  color: Colors.green,
                                ),
                                Container(
                                  height: 200,
                                  width: 200,
                                  color: Colors.green,
                                ),
                                Container(
                                  height: 200,
                                  width: 200,
                                  color: Colors.green,
                                ),
                                Container(
                                  height: 200,
                                  width: 200,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}