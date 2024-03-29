// 第一步：引入相关文件
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/page/page_page_view.dart';
import 'package:untitled/page/page_webview.dart';
import 'page_select_list.dart';
import 'page_home.dart';

// 第二步：创建一个有状态的Tabs 组件
class Tabs extends StatefulWidget {


  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  //记录当前tabbar点击的下标
  int _currentIndex=0;
  //存放tabbar
  List _pageList =[
    JhPhotoPickerTool(),
    pageview(),
    StateRadioBoxDemoPage(),
    SliverAppBarScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          extendBody: true,
        // 设置需要显示的内容。
        body: this._pageList[this._currentIndex],
        //创建tabbar
        bottomNavigationBar:Container(
          decoration: const BoxDecoration(
            color: Color(0xFFbbcdc5),
            borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
            backgroundColor:Colors.transparent,
            currentIndex: this._currentIndex,
            //tabbar的点击事件
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            },
            //设置图标尺寸
            iconSize: 20,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.blue,
            type:BottomNavigationBarType.fixed,
            //设置item
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "工具"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "备用"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "备用"),
              BottomNavigationBarItem(icon: Icon(Icons.web), label: "备用"),
            ],
          ),
        ),
      ),
    );
  }
}