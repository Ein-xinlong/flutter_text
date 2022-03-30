import 'package:flutter/material.dart';
import 'package:untitled/commitUI/appbar.dart';

class AnimationDemo extends StatefulWidget {


  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  double _height=200;
  Color _color=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
        titleContent: "测试动画",
        backPressCallback: (){
          Navigator.pop(context);
        }
      ).buildAppBar(),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 300,
          height: _height,
          color: _color,
          child: Center(child: Text("Hi",style: TextStyle(fontSize: 72),)),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          setState(() {
            _color==Colors.red?_color=Colors.blue:_color=Colors.red;
            _height+=100;
            if(_height==500)_height=200;
          });
        },
      ),
    );
  }
}
