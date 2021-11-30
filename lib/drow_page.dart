import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DrowPage extends StatefulWidget {
  @override
  _DrowPageState createState() => _DrowPageState();
}

class _DrowPageState extends State<DrowPage> {
  final _controller = Get.put(_Controller());
  GlobalKey comGlobalKey = GlobalKey();
  Uint8List bytes = Uint8List.fromList([
    71,
    73,
    70,
    56,
    57,
    97,
    1,
    0,
    1,
    0,
    128,
    0,
    0,
    0,
    0,
    0,
    255,
    255,
    255,
    33,
    249,
    4,
    1,
    0,
    0,
    0,
    0,
    44,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    0,
    0,
    2,
    1,
    68,
    0,
    59
  ]);

// 获取Uint8List数据
  Future<Uint8List> toPng() async {
    try {
      RenderRepaintBoundary boundary =
          comGlobalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      return pngBytes; //这个对象就是图片数据
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: _controller.onPanStart,
        onPanUpdate: _controller.onPanUpdate,
        onPanEnd: _controller.onPanEnd,
        child: Column(
          children: [
            RepaintBoundary(
              key: comGlobalKey,
              child: Container(
                width: double.infinity,
                height: 300,
                child: Obx(() => CustomPaint(
                      painter: _Painter(_controller.points.toList()),
                    )),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: FlatButton(
                    onPressed: _controller.deleteDorw,
                    child: Text("清除"),
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      toPng().then((data) {
                        setState(() {
                          print(data.toString());
                          bytes = data;
                        });
                      });
                    },
                    child: Text("截图保存"),
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
            Image.memory(
              bytes,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final List<_Model> points;

  _Painter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
            points[i].offset, points[i + 1].offset, points[i].paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(
            PointMode.points, [points[i].offset], points[i].paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _Model {
  final Offset offset;
  final Paint paint;

  _Model({this.offset, this.paint});
}

class _Controller extends GetxController {
  final points = <_Model>[].obs;
  final paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4.0
    ..strokeCap = StrokeCap.round;

  void onPanStart(DragStartDetails d) {
    final model = _Model(offset: d.localPosition, paint: paint);
    points.add(model);
  }

  void onPanUpdate(DragUpdateDetails d) {
    final model = _Model(offset: d.localPosition, paint: paint);
    points.add(model);
  }

  void onPanEnd(DragEndDetails d) {
    points.add(null);
  }

  void deleteDorw() {
    points.clear();
  }
}
