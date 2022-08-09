import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/commitUI/appbar.dart';

class SnowPage extends StatefulWidget {
  @override
  _SnowPageState createState() => _SnowPageState();
}

class _SnowPageState extends State<SnowPage>
    with SingleTickerProviderStateMixin {
  AnimationController _container;
  List<Snowflake> _list = List.generate(1000, (index) => Snowflake());

  @override
  void initState() {
    _container = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )
      ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _container.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
        backPressCallback: () {
          Navigator.pop(context);
        },
        color: Colors.blue,
        titleContent: "下雪啦",
        isShowUnderLine: false,
      ).buildAppBar(),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
                colors: [Colors.blue,Colors.blueAccent,Colors.white]
            )
          ),
          child: AnimatedBuilder(builder: (_, __) {
            _list.forEach((element) {element.fall();});
            return CustomPaint(
              painter: MyParinter(_list),
            );
          }, animation: _container,),
        ),
      ),
    );
  }
}

class MyParinter extends CustomPainter {
  List<Snowflake> _list;

  MyParinter(this._list);

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    final paint = Paint()
      ..color = Colors.white;
    canvas.drawCircle(size.center(Offset(0, 100)), 40.0, paint);
    canvas.drawOval(
        Rect.fromCenter(
          center: size.center(Offset(0, 230)),
          width: 200,
          height: 250,
        ),
        paint);
    _list.forEach((element) {
      canvas.drawCircle(Offset(element.x, element.y), element.radius, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Snowflake {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  double radius = Random().nextDouble() * 2 + 2;
  double velocity = Random().nextDouble() * 4 + 2;

  fall() {
    y += velocity;
    if (y > 800) {
      y = 0;
      x = Random().nextDouble() * 400;
      radius = Random().nextDouble() * 2 + 2;
      velocity = Random().nextDouble() * 4 + 2;
    }
  }
}
