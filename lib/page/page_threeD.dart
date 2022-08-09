import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:untitled/commitUI/appbar.dart';
///暂未成功
class ThreeDSpin extends StatefulWidget {
  @override
  _ThreeDSpinState createState() => _ThreeDSpinState();
}

class _ThreeDSpinState extends State<ThreeDSpin> with SingleTickerProviderStateMixin{

  Offset _offset = Offset.zero;
  Widget _child1 = ClipRect(
    child: Align(
      alignment: Alignment.centerLeft,
      widthFactor: 0.5,
      child: Container(
        width: 100,
        height: 200,
        color: Colors.red,
      ),
    ),
  );
  Widget _child2 = ClipRect(
    child: Align(
      alignment: Alignment.centerRight,
      widthFactor: 0.5,
      child: Container(
        width: 100,
        height: 200,
        color: Colors.red,
      ),
    ),
  );
  Widget _child3 = ClipRect(
    child: Align(
      alignment: Alignment.centerLeft,
      widthFactor: 0.5,
      child: Container(
        width: 100,
        height: 200,
        color: Colors.yellow,
      ),
    ),
  );

  Widget _child4 = ClipRect(
    child: Align(
      alignment: Alignment.centerRight,
      widthFactor: 0.5,
      child: Container(
        width: 100,
        height: 200,
        color: Colors.yellow,
      ),
    ),
  );
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation1;
@override
  void initState() {
    // TODO: implement initState
    timeDilation=5.0;
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 5))..repeat(reverse: true)
      ..addListener(() {
        setState(() {});
      });
    _animation = Tween(begin: .0, end: pi / 2)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(.0, .5)));
    _animation1 = Tween(begin: -pi / 2, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(.5, 1.0)));
   // _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() => _offset += details.delta);
      },
      child: Scaffold(
        appBar: AnAppbar(
            titleContent: "3D旋转",
            backPressCallback: () {
              Navigator.pop(context);
            }).buildAppBar(),
        body: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(_offset.dy * pi / 180)
            ..rotateY(_offset.dx * pi / 180),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  _child1,
                  Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animation1.value),
                    child: _child3,
                  ),
                ],
              ),
              Container(
                width: 3,
                color: Colors.white,
              ),
              Stack(
                children: [
                  _child4,
                  Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animation.value),
                    child: _child2,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Cube extends StatefulWidget {
//   @override
//   _CubeState createState() => _CubeState();
// }
//
// class _CubeState extends State<Cube> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Stack(
//           children: [
//             ClipRect(
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 widthFactor: 0.5,
//                 child: child1,
//               ),
//             )
//             Transform(
//               alignment: Alignment.centerRight,
//               transform: Matrix4.identity()
//                 ..setEntry(3, 2, 0.001)
//                 ..rotateY(_animation1.value),
//               child: _child3,
//             ),
//           ],
//         ),
//         Container(
//           width: 3,
//           color: Colors.white,
//         ),
//         Stack(
//           children: [
//             _child4,
//             Transform(
//               alignment: Alignment.centerLeft,
//               transform: Matrix4.identity()
//                 ..setEntry(3, 2, 0.001)
//                 ..rotateY(_animation.value),
//               child: _child2,
//             )
//           ],
//         )
//       ],
//     );
//   }
//
// }
