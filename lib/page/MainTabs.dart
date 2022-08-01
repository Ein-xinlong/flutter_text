// 第一步：引入相关文件
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/page/pageview.dart';
import 'package:untitled/page/webview.dart';
import 'statera_diobox_demopage.dart';
import 'image.dart';

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
        // 设置需要显示的内容。
        body: this._pageList[this._currentIndex],
        //创建tabbar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          //tabbar的点击事件
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          //设置图标尺寸
          iconSize: 20,
          //设置选中图标的颜色
          fixedColor: Color(0xFF003333),
          type:BottomNavigationBarType.fixed,
          //设置item
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "图片"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "PageView"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "单选"),
            BottomNavigationBarItem(icon: Icon(Icons.web), label: "网页"),
          ],
        ),
      ),
    );
  }
}