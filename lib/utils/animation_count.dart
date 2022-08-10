import 'package:flutter/cupertino.dart';

class Counter extends StatelessWidget{
  final int? count;
  final Duration? decoration;

  const Counter( {this.count,this.decoration});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TweenAnimationBuilder(
      duration: decoration!,
      tween: Tween(end: count!.toDouble()),
      builder: (BuildContext context, value, Widget? child) {  // 修改这里的类型声明
        final whole = value ~/ 1;
        final decimal = value - whole;
        return Stack(children: [
          Positioned(
            top: -100 * decimal,
            child: Opacity(
              opacity: 1.0 - decimal,
              child: Text(
                "$whole",
                style: TextStyle(fontSize: 100),
              ),
            ),
          ),
          Positioned(
            top: 100 - decimal * 100,
            child: Opacity(
              opacity: decimal,
              child: Text(
                "${whole + 1}",
                style: TextStyle(fontSize: 100),
              ),
            ),
          ),
        ]);
      },
    );
  }

}