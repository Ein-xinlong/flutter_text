import 'package:flutter/material.dart';

import 'commitUI/appbar.dart';

class pageview extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<pageview> {
  List<Map> list = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 100; i++) {
      list.add({
        "number": 212345665 + i,
        "name": "测试数据都是假的" + i.toString(),
        "date":"2021.1.2-2021.1.3(四)"
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
          titleContent: "PageView",
          backPressCallback: null
      ).buildAppBar(),
      body: PageView(
        scrollDirection: Axis.vertical,
        reverse: false,
        controller: PageController(
          initialPage: 0,
          viewportFraction: 1,
          keepPage: true,
        ),
        physics:BouncingScrollPhysics(),
        pageSnapping: true,
        onPageChanged: (index) {
          //监听事件
          print('index=====$index');
        },
        children: <Widget>[
          Container(
            color: Color(0xFFFFCC99),
            child: Center(
              child: Text(
                '第1页',
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
          ),
          Container(
            color:Color(0xFFFFFFCC),
            child: Center(
              child: Text(
                '第2页',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            color: Color(0xFF99CCFF),
            child: Center(
              child: Text(
                '第3页',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
