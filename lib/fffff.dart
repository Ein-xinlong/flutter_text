import 'package:flutter/material.dart';

class button extends StatefulWidget {


  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Container(child:
      Center(
        child: FlatButton(child: Text("ceshi"),onPressed: (){},),
      ),);
  }
}
