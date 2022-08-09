

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../commitUI/appbar.dart';

class SliverAppBarScreen extends StatefulWidget {
  SliverAppBarScreen({Key key}) : super(key: key);

  @override
  _SliverAppBarScreenState createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
          titleContent: "WebView",
          backPressCallback: null
      ).buildAppBar(),
      body: Container(
        child: WebView(
          initialUrl: "https://news.163.com/special/wangsansanhome/",
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}