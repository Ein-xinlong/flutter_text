import 'dart:io';

import 'package:image_pickers/image_pickers.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<File> _image=[];

  Future getImage() async {
    List<Media> _listImagePaths = await ImagePickers.pickerPaths(
        galleryMode: GalleryMode.image,
        selectCount: 2,
        showGif: false,
        showCamera: true,
        compressSize: 500,
        uiConfig: UIConfig(uiThemeColor: Color(0xffff0f50)),
        cropConfig: CropConfig(enableCrop: false, width: 2, height: 1));

    setState(() {
      if (_listImagePaths != null) {
        for(int i=0;i<_listImagePaths.length;i++) {
          _image.add(File(_listImagePaths[i].path.toString()));
        }
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
          child:Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _genImages(),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }


  _genImages() {
    return _image.map((file){
      return Stack(
        children:<Widget> [
          ClipRRect(
            borderRadius:BorderRadius.circular(5),
            child: Image.file(file,width: 90,height: 90,fit: BoxFit.fill,),
          ),Positioned(
            right: 5,
            top: 5,
            child:GestureDetector(
              onTap: (){
                setState(() {
                  _image.remove(file);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(Icons.close,size: 18,color: Colors.white,),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}
