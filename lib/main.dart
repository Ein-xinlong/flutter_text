import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:untitled/pageview.dart';
import 'package:untitled/ujkiuyhgbnk.dart';
import 'package:untitled/webview.dart';

import 'PDApageview.dart';
import 'PermissionUtil.dart';
import 'StateRadioBoxDemoPage.dart';
import 'cander.dart';
import 'dd.dart';
import 'f.dart';
import 'fffff.dart';
import 'image.dart';
import 'imagedome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: SliverAppBarScreen(),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    List<File> image=[];
    return Scaffold(
        appBar:AppBar(
            title:Text('PhotoSelectTest')
        ),
        body:Row(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(80, 10, 30, 10),
                color: Colors.red,
                child:
                JhPhotoPickerTool(
                  lfPaddingSpace: 110,
                  callBack: (var img) async{



                    print("img-------${File(img[0]).lengthSync()}------");
                    print(img.length);
                    for(var i=0;i<img.length;i++){
                      String imgName=  img[i].substring(img[i].lastIndexOf("/") + 1, img[i].length);
                      String suffix = imgName.substring(imgName.lastIndexOf(".") + 1, imgName.length);
                      print("img     "+img[i]);
                      print("imgName     "+imgName);
                      print("suffix      "+suffix);
                    }
                  },
                )

            ),

          ],
        ),


    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';
  final selections = <bool>[];
  final List<String> items = <String>['One', 'Two', 'Free', 'Four'];
  int groupValue = 0;
  List list = [
    {
      "title": "影视特效",
      "type": 0,
    },
    {"title": "室内设计", "type": 1},
    {"title": "游戏原画", "type": 2},
    {"title": "次时代", "type": 3},
    {"title": "UI设计", "type": 4},
    {"title": "后期合成", "type": 5},
  ];
  bool _value = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //selections.addAll(List.filled(widget.data.length, false));
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 300,
    //   child: DropdownButtonHideUnderline(
    //     child: ButtonTheme(
    //       alignedDropdown: false,
    //       minWidth: 10,
    //       child: DropdownButton<String>(
    //         value: dropdownValue,
    //         icon: Icon(Icons.arrow_downward),
    //         iconSize: 24,
    //         elevation: 8,
    //         style: TextStyle(fontSize: 10.0,color: Colors.deepPurple),
    //         iconEnabledColor: Colors.red,
    //         underline: Container(
    //           height: 2,
    //           color: Colors.deepPurpleAccent,
    //         ),
    //         onChanged: (String newValue) {
    //           setState(() {
    //             dropdownValue = newValue;
    //           });
    //         },
    //         items: <String>['One', 'Two', 'Free', 'Four']
    //             .map<DropdownMenuItem<String>>((String value) {
    //           return DropdownMenuItem<String>(
    //             value: value,
    //             child: Text(value),
    //           );
    //         }).toList(),
    //       ),
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Circle CheckBox"),
    //   ),
    //   body: Center(
    //       child: InkWell(
    //         onTap: () {
    //           setState(() {
    //             _value = !_value;
    //           });
    //         },
    //         child: Container(
    //           decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    //           child: Padding(
    //             padding: const EdgeInsets.all(10.0),
    //             child: _value
    //                 ? Icon(
    //               Icons.check,
    //               size: 30.0,
    //               color: Colors.blue,
    //             )
    //                 : Icon(
    //               Icons.check_box_outline_blank,
    //               size: 30.0,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //       )),
    // );
    //
    //
    // return
    //   CustomScrollView(
    //     scrollDirection: Axis.horizontal,
    //     slivers: <Widget>[
    //       SliverList(
    //         delegate: new SliverChildListDelegate(
    //           [
    //             Container(
    //               width: 1000,
    //               child: Text(
    //                 "CustomScrollView   scrollDirection: Axis.horizjjjuhjjjjjjiiiiiiiiiiiijjjjontal",
    //
    //               ),
    //               alignment: Alignment.center,
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   );

    //   return Scaffold(
    //     appBar:  AppBar(
    //       title: (Text("日历的使用")),
    //     ),
    //     body: Container(
    //       margin: EdgeInsets.symmetric(
    //         horizontal: 2.0,
    //         vertical: 10.0,
    //       ),
    //       child: ListView(
    //         children: <Widget>[
    //           Calendar(
    //             onSelectedRangeChange: (range) =>
    //                 print("Range is ${range.item1}, ${range.item2}"),
    //             onDateSelected: (date) => handleNewDate(date),
    //           ),
    //           Divider(
    //             height: 50.0,
    //           ),
    //           _buildTimeLine('啊啊啊'),
    //           _buildTimeLine('啊啊啊'),
    //           _buildTimeLine('啊啊啊'),
    //           _buildTimeLine('啊啊啊'),
    //           _buildTimeLine('啊啊啊'),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    //
    //
    // /// handle new date selected event
    // void handleNewDate(date) {
    //   ///可以在这里通过改变日历更换数据
    // }
    //
    // Widget _buildTimeLine(String message) {
    //   return Stack(
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.only(left: 50.0),
    //         child: Card(
    //           margin: EdgeInsets.all(20.0),
    //           child: Container(
    //             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    //             width: double.infinity,
    //             child: Text(message),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         top: 0.0,
    //         bottom: 0.0,
    //         left: 35.0,
    //         child: Container(
    //           height: double.infinity,
    //           width: 2.0,
    //           color: Colors.blue,
    //         ),
    //       ),
    //       Positioned(
    //         top: 13.0,
    //         left: 22.5,
    //         child: Container(
    //           height: 26.0,
    //           width: 26.0,
    //           decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: Colors.lightGreen,
    //           ),
    //           child: Container(
    //             margin: EdgeInsets.all(3.0),
    //             height: 26.0,
    //             width: 26.0,
    //             decoration:
    //             BoxDecoration(shape: BoxShape.circle, color: Colors.red),
    //           ),
    //         ),
    //       )
    //     ],
    //   );


      return GridView.count(
        padding: EdgeInsets.all(5.0),
        //一行多少个
        crossAxisCount: 3,
        //滚动方向
        scrollDirection: Axis.vertical,
        // 左右间隔
        crossAxisSpacing: 10.0,
        // 上下间隔
        mainAxisSpacing: 15.0,
        //宽高比
        childAspectRatio: 1 / 0.4,
        shrinkWrap: true,
        children: list.map((value) {
          return listitem(context, value);
        }).toList(),
      );
    }

    Widget listitem(context, value) {
      var deviceSize = MediaQuery.of(context).size;
      print(value['type']);
      return groupValue == value['type']
          ? RaisedButton(
              color: Colors.black,
              onPressed: () {
                print('切换${value}');
                updateGroupValue(value['type']);
              },
              child: Text(
                value['title'],
                style: TextStyle(color: Colors.white),
              ),
            )
          : OutlineButton(
              onPressed: () {
                print('切换${value}');
                updateGroupValue(value['type']);
              },
              child: Text(value['title']),
            );
    }

    void updateGroupValue(int v) {
      setState(() {
        groupValue = v;
      });
    }
   // return Row();

}