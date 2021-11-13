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

class SliverAppBarScreen extends StatefulWidget {
  SliverAppBarScreen({Key key}) : super(key: key);

  @override
  _SliverAppBarScreenState createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.none,
            title: Text('spectacular'),
            background: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597491697639&di=b2de8a48915ca5d13c39f8ee0370e83a&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F00%2F11%2F12%2F6656371539b8f64.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context,  int index) {
                  return Card(
                    child: Container(
                      height: 50,
                      color: Colors.primaries[(index % 17)],
                      child: Text(''),
                    ),
                  );
                },
                childCount: 80
            )
        )
      ],
    );
  }
}