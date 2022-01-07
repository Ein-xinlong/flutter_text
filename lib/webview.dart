// import 'package:flutter/cupertino.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class WebViewPage extends StatefulWidget {
//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }
//
// class _WebViewPageState extends State<WebViewPage> {
//   WebViewController _controller;
//   String _title = "webview";
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text("$_title"),
//       ),
//       child: SafeArea(
//         child: WebView(
//           initialUrl: "http://www.baidu.com",
//           //JS执行模式 是否允许JS执行
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (controller) {
//             _controller = controller;
//           },
//           onPageFinished: (url) {
//             _controller.evaluateJavascript("document.title").then((result){
//               setState(() {
//                 _title = result;
//               });
//             }
//             );
//           },
//           navigationDelegate: (NavigationRequest request) {
//             if(request.url.startsWith("myapp://")) {
//               print("即将打开 ${request.url}");
//
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           } ,
//           javascriptChannels: <JavascriptChannel>[
//             JavascriptChannel(
//                 name: "share",
//                 onMessageReceived: (JavascriptMessage message) {
//                   print("参数： ${message.message}");
//                 }
//             ),
//           ].toSet(),
//
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'commitUI/appbar.dart';

class SliverAppBarScreen extends StatefulWidget {
  SliverAppBarScreen({Key key}) : super(key: key);

  @override
  _SliverAppBarScreenState createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AnAppbar(
          titleContent: "WebView",
          backPressCallback: null
      ).buildAppBar(),
      body: Container(
        child: WebView(
          initialUrl: "https://app.4399.cn/app-wap-qd-fxhd4399.html",
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}