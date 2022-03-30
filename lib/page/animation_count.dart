import 'package:flutter/material.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/utils/animation_count.dart';

class AnimationCount extends StatefulWidget {
  @override
  _AnimationCountState createState() => _AnimationCountState();
}

class _AnimationCountState extends State<AnimationCount> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
          titleContent: "计数器动画",
          backPressCallback: () {
            Navigator.pop(context);
          }).buildAppBar(),
      body: Center(
        child: Container(
          width: 300,
          height: 120,
          color: Colors.blue,
          child: Counter(//自定义计数器
            count: _count,
            decoration: Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "tooltip",
        child: Icon(Icons.add),
      ),
    );
  }

  _incrementCounter() {
    setState(() {
      _count++;
    });
  }
}
