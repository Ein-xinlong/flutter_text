  import 'package:flutter/material.dart';
  import 'package:untitled/bean/new_page_bean.dart';
  import '../commitUI/appbar.dart';

  class NewDetails extends StatefulWidget {///新闻详情页，由列表页传过来数据
    Result result;
    NewDetails(this.result);

    @override
    _NewDetailsState createState() => _NewDetailsState();
  }

  class _NewDetailsState extends State<NewDetails> {


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AnAppbar(
            titleContent: widget.result.title,
            backPressCallback: (){
              Navigator.pop(context);
            }
        ).buildAppBar(),
        body: Container(

        ),
      );
    }
  }

  //注释
  // Container(
  // child: WebView(
  // initialUrl: widget.result.path,
  // //JS执行模式 是否允许JS执行
  // javascriptMode: JavascriptMode.unrestricted,
  // ),
  // )
