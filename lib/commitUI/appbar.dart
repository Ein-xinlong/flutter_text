import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AnAppbar {
  String titleContent; //appbar只有文字，存在这个则titleWidget不生效
  Widget titleWidget; //中间位置widget
  Function backPressCallback; //为null，则不展示返回
  Widget actionWidget; //右侧action

  AnAppbar(
      {this.titleContent,
        this.titleWidget,
        this.backPressCallback,
        this.actionWidget});

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: double.infinity,
            color: Color(0xFFE8E8E8),
            height: 1,
          ),
        ),
        brightness: Brightness.light,
        centerTitle: true,
        title: titleContent == null
            ? titleWidget == null
            ? Container()
            : titleWidget
            : createText(titleContent, 20, Colors.black,
            fontWeight: FontWeight.bold),
        actions: <Widget>[
          actionWidget == null ? Container() : actionWidget,
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
              onPressed: backPressCallback),
        ));
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

