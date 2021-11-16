import 'dart:convert';

import 'package:flutter/foundation.dart';

class Log {
  static const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  static const prettyJson = true;

  ///error日志 红色
  static e(Object object) {
    _parse(object, (s) => debugPrint('\x1B[31m $s \x1B[0m'));
  }

  ///debug日志 绿色
  static d(Object object) {
    _parse(object, (s) => debugPrint('\x1B[32m $s \x1B[0m'));
  }

  ///info日志 白色
  static i(Object object) {
    _parse(object, (s) => debugPrint(s));
  }

  static _parse(Object object, Function(String s) log) {
    if (kReleaseMode) {
      return;
    }
    try {
      log(prettyJson ? encoder.convert(object) : jsonEncode(object));
    } catch (err) {
      log(object.toString());
    }
  }
}
