import 'package:flutter/material.dart';

/// SnackBar工具类
class SnackUtils{

  /// 吐司弹出SnackBar
  static toast(BuildContext context, String msg,
      {duration = const Duration(milliseconds: 600),
        Color color, SnackBarAction action}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: duration,
      action: action,
      backgroundColor: color??Theme.of(context).primaryColor,
    ));
  }

}