import 'package:flutter/material.dart';

/// Android 系统返回键监听
class BackPressChannel{
  List<BuildContext> contextStack = [];
  List<String> pageNameStack = [];
  Map<String, dynamic> pageResults = {};

  bool _isPreventBack = false;

  /// 是否禁用android系统返回键的回调
  set isPreventBack(bool value) {
    if (_isPreventBack != value) {
      _isPreventBack = value;
    }
  }

  /// 是否禁用android系统返回键的回调
  bool get isPreventBack => _isPreventBack;

  static final BackPressChannel _instance = BackPressChannel._();

  BackPressChannel._();

  factory BackPressChannel.instance() {
    return _instance;
  }

  register(BuildContext context, {String? pageName}) {
    contextStack.add(context);
    pageNameStack.add(pageName ?? 'unknownPage');
    _isPreventBack = false; // 打开新页面时，总是还原

  }

  BuildContext? unregisterLast() {
    BuildContext? context;
    try {
      context = contextStack.removeLast();
      pageNameStack.removeLast();
      _isPreventBack = false; // 关闭新页面时，总是还原
    } catch (e) {

    }
    return context;
  }

  // 设置需要pop时，传递给上一页面的数据
  setPageResult(String pageName, dynamic result) {
    if (pageName != null && pageName != '') {
      pageResults[pageName] = result;
    }
  }

  @override
  String getModuleName() {
    return 'back_press_channel';
  }

  @override
  Future<Map>? onChannel(
      String moduleName, String methodName, Map<String, dynamic> map) {
    if (methodName == 'onBackPressed') {
      if (!_isPreventBack) {

        var last = contextStack.removeLast();
        var lastPageName = pageNameStack.removeLast() ?? '';
        if (last != null) {
          Navigator.pop(last, pageResults[lastPageName]);
        }
      } else {

      }
    }
  }
}
