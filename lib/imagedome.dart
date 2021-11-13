import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'PermissionUtil.dart';
class Imagemodel extends StatefulWidget {


  @override
  _ImagemodelState createState() => _ImagemodelState();
}

class _ImagemodelState extends State<Imagemodel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
         FlatButton(onPressed: (){
           showModalBottomSheet(context: context, builder:(BuildContext bc){
             return Container(
               child: Row(
                 children: [
                   FlatButton(onPressed: () async {

                     }, child: Text("相册")),
                   FlatButton(onPressed: () async { var listPath = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 400);}, child: Text("图库")),
                 ],
               ),
             );
           });

         }, child: Text("ff")),
        ],
      ),
    );
  }
}
