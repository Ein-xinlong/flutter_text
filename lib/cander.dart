import 'package:flutter/material.dart';




class DatePickerDemo extends StatefulWidget {
  DatePickerDemo({Key key}) : super(key: key);
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime _nowDate = DateTime.now();
  _showDatePicker() {
    // showDatePicker(
    //   context: context, //上下文对象
    //   initialDate: _nowDate, //初始化显示的日期
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //
    // ).then((value) => print(value));
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Stack(
            children: <Widget>[
              Container(
                height: 30.0,
                width: double.infinity,
                color: Colors.black54,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
              ),
              Container(
                child: FlatButton(
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                    EdgeInsets.only(top: 33.0, bottom: 33.0),
                    child: Text(
                      "bottomSheet的内容",
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        }
    );

  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    //var now = DateTime.now();
    //print(now);//打印当前时间 2020-12-29 06:21:34.729165

    //print(now.millisecondsSinceEpoch);//时间戳  1609222955510
    //print(DateTime.fromMicrosecondsSinceEpoch(1608623002151));//时间戳转换成时间 1970-01-19 14:50:23.002151
    // print(formatDate(DateTime(2020, 12, 29), [yyyy, '年', mm, '月', dd]));//打印时间 格式
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("datepicker"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              //相当于button，实质是带水波纹效果的点击
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("2020-12-29"),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              onTap: () {
                _showDatePicker();
                print("打开日期组件");
              },
            )
          ],
        ));
  }
}

