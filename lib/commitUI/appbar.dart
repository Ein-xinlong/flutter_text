import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AnAppbar {
  String? titleContent; //appbar只有文字，存在这个则titleWidget不生效
  Widget? titleWidget; //中间位置widget
  Function backPressCallback; //为null，则不展示返回
  Widget? actionWidget; //右侧action
  Color? color;//background颜色
  bool? isShowUnderLine;//background颜色
  AnAppbar(
      {this.titleContent,
        this.titleWidget,
        required this.backPressCallback,
        this.actionWidget,
        this.color,
        this.isShowUnderLine
      });

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: color??Color(0xffbbcdc5),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: double.infinity,
            color: Color(0xFFE8E8E8),
            height: isShowUnderLine==false?0:1,
          ),
        ),
        centerTitle: true,
        title: titleContent == null
            ? titleWidget == null
            ? Container()
            : titleWidget
            : createText(titleContent!, 20, Colors.black,
            fontWeight: FontWeight.bold),
        actions: <Widget>[
          actionWidget == null ? Container() : actionWidget!,
        ],
        leading: Visibility(
          visible: backPressCallback != null,
          child: IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: backPressCallback != null ? () => backPressCallback() : null,),
        ), systemOverlayStyle: SystemUiOverlayStyle.dark);
  }
}

Text createText(String str, double fontSize, Color fontColor,
    {FontWeight fontWeight = FontWeight.normal}) {
  return Text(str,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight));
}

