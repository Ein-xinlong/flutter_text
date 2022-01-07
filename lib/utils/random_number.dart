import 'package:flutter/material.dart';
import 'dart:math';

class CustomVertificationCode extends StatefulWidget {
  final String code;
  final int dotCount;
  final double width;
  final double height;
  final Color backgroundColor;

  const CustomVertificationCode(
      {Key key,
        @required this.code,
        this.backgroundColor,
        this.dotCount = 50,
        this.width = 120,
        this.height = 40})
      : super(key: key);

  @override
  _CustomVertificationCodeState createState() => _CustomVertificationCodeState();
}

class _CustomVertificationCodeState extends State<CustomVertificationCode> {
  //随机生成绘图数据
  Map getRandomData() {
    // 数字list
    List list = widget.code.split("");
    // X坐标
    double x = 0.0;
    // 最大字体大小
    double maxFontSize = 35.0;
    //将painter保存起来，先计算出位置
    List mList = [];
    for (String item in list) {
      Color color = Color.fromARGB(255, Random().nextInt(255),
          Random().nextInt(255), Random().nextInt(255));
      int fontWeight = Random().nextInt(9);
      TextSpan span = TextSpan(
          text: item,
          style: TextStyle(
              color: color,
              fontWeight: FontWeight.values[fontWeight],
              fontSize: maxFontSize - Random().nextInt(10)));
      TextPainter painter =
      TextPainter(text: span, textDirection: TextDirection.ltr);
      painter.layout();
      double y =
          Random().nextInt(widget.height.toInt()).toDouble() - painter.height;
      if (y < 0) {
        y = 0;
      }
      Map strMap = {"painter": painter, "x": x, "y": y};
      mList.add(strMap);
      x += painter.width + 3;
    }
    double offsetX = (widget.width - x) / 2;
    List dotData = [];
    //绘制干扰点
    for (var i = 0; i < widget.dotCount; i++) {
      int r = Random().nextInt(255);
      int g = Random().nextInt(255);
      int b = Random().nextInt(255);
      double x = Random().nextInt(widget.width.toInt() - 5).toDouble();
      double y = Random().nextInt(widget.height.toInt() - 5).toDouble();
      double dotWidth = Random().nextInt(6).toDouble();
      Color color = Color.fromARGB(255, r, g, b);
      Map dot = {"x": x, "y": y, "dotWidth": dotWidth, "color": color};
      dotData.add(dot);
    }

    Map checkCodeDrawData = {
      "painterData": mList,
      "offsetX": offsetX,
      "dotData": dotData,
    };
    return checkCodeDrawData;
  }

  @override
  Widget build(BuildContext context) {
    print("buid?");
    double maxWidth = 0.0;
    Map drawData = getRandomData();
    //计算最大宽度做自适应
    maxWidth = getTextSize("8" * widget.code.length,
        TextStyle(fontWeight: FontWeight.values[8], fontSize: 25))
        .width;
    return Container(
        color: widget.backgroundColor,
        width: maxWidth > widget.width ? maxWidth : widget.width,
        height: widget.height,
        child: CustomPaint(
          painter: CustomVertificationCodePainter(drawData: drawData),
        ));
  }

  Size getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

class CustomVertificationCodePainter extends CustomPainter {
  final Map drawData;
  CustomVertificationCodePainter({
    @required this.drawData,
  });

  Paint _paint = new Paint()
    ..color = Colors.grey
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill;
  @override
  void paint(Canvas canvas, Size size) {
    List mList = drawData["painterData"];

    double offsetX = drawData["offsetX"];
    //为了能��居中显示移动画布
    canvas.translate(offsetX, 0);
    //从Map中取出值，直接绘制
    for (var item in mList) {
      TextPainter painter = item["painter"];
      double x = item["x"];
      double y = item["y"];
      painter.paint(
        canvas,
        Offset(x, y),
      );
    }
    // //将画布平移回去

    canvas.translate(-offsetX, 0);
    List dotData = drawData["dotData"];
    for (var item in dotData) {
      double x = item["x"];
      double y = item["y"];
      double dotWidth = item["dotWidth"];
      Color color = item["color"];
      _paint.color = color;
      canvas.drawOval(Rect.fromLTWH(x, y, dotWidth, dotWidth), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

