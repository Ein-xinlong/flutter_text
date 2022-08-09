import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerTest extends StatefulWidget {
  @override
  _BannerTestState createState() => _BannerTestState();
}

class _BannerTestState extends State<BannerTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            if (i == 0) {
              return Container(
                  height: 180,
                  child: BannerView(
                    children: [
                      Image.network(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2Fv2-0831ab242b01a6de64757dfd7b0197d1_1440w.jpg%3Fsource%3D172ae18b&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1662553620&t=e9d979a0b8e187cde4d3a337b7ca54ba",
                          fit: BoxFit.cover,
                          errorBuilder: (ctx,err,stackTrace) => Image.asset(
                              'assets/images/banner_error_.png',//默认显示图片
                              width: double.infinity)
                      ),
                      Image.network(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fs4.51cto.com%2Fimages%2Fblog%2F202012%2F19%2F3ed5de0666bf5c2a48a46998fed79967.png%3Fx-oss-process%3Dimage%2Fwatermark%2Csize_16%2Ctext_QDUxQ1RP5Y2a5a6i%2Ccolor_FFFFFF%2Ct_100%2Cg_se%2Cx_10%2Cy_10%2Cshadow_90%2Ctype_ZmFuZ3poZW5naGVpdGk%3D&refer=http%3A%2F%2Fs4.51cto.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1662553620&t=f5ae56df883db8f6299843b5f6e6ff5f",
                          fit: BoxFit.cover,
                          errorBuilder: (ctx,err,stackTrace) => Image.asset(
                              'assets/images/banner_error_.png',//默认显示图片
                              width: double.infinity)
                      ),
                      Image.network(
                          "https://img1.baidu.com/it/u=1912735056,1677039589&fm=253&fmt=auto&app=138&f=JPG?w=499&h=208",
                          fit: BoxFit.cover,
                          errorBuilder: (ctx,err,stackTrace) => Image.asset(
                              'assets/images/banner_error_.png',//默认显示图片
                              width: double.infinity)
                      ),
                      Image.network(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F24baed7da3a60f1206dd28bf636c15691713edfff0fa-xRVbEN_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1662553798&t=796677308f5e39718287d58ccb98ba53",
                          fit: BoxFit.cover,
                          errorBuilder: (ctx,err,stackTrace) => Image.asset(
                              'assets/images/banner_error_.png',//默认显示图片
                              width: double.infinity)
                      ),
                      Image.network(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fs11.51cto.com%2Fimages%2F201812%2F27%2F5a050abb60deeef2121d56bf1b68185a.png&refer=http%3A%2F%2Fs11.51cto.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1662553629&t=4ea3649f7ad7ca0a2d019552e8146856",
                          fit: BoxFit.cover,
                          errorBuilder: (ctx,err,stackTrace) => Image.asset(
                              'assets/images/banner_error_.png',//默认显示图片
                              width: double.infinity)
                      ),
                      Image.network(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F010b1e58ca2f3aa801219c777cfe68.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1662553798&t=dbf824142c717e93287df81caaed27e5",
                          fit: BoxFit.cover,
                          errorBuilder: (ctx,err,stackTrace) => Image.asset(
                              'assets/images/banner_error_.png',//默认显示图片
                              width: double.infinity)
                      ),
                    ],
                  ));
            } else {
              return Text("");
            }
          }),
      height: 180,
    );
  }
}

class BannerView extends StatefulWidget {
  final List<Widget> children;

  final Duration switchDuration;

  BannerView(
      {this.children = const <Widget>[],
        this.switchDuration = const Duration(seconds: 3)});

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  Timer _timer;
  int _curPageIndex;
  static const Duration animateDuration = const Duration(milliseconds: 500);

  List<Widget> children = [];

  @override
  void initState() {
    super.initState();
    _curPageIndex = 0;

    _tabController = TabController(length: widget.children.length, vsync: this);
    /// 添加所有的widget到新建的list中
    children.addAll(widget.children);
    /// 定时器完成自动翻页-只有在大于1时才会有翻页
    if (children.length > 1) {
      children.insert(0, widget.children.last);
      children.add(widget.children.first);
      ///如果大于一页，则会在前后都加一页， 初始页要是 1
      _curPageIndex = 1;
      _timer = Timer.periodic(widget.switchDuration, _nextBanner);
    }

    ///初始页面 指定
    _pageController = PageController(initialPage: _curPageIndex);
  }
  /// 进行翻页的动画
  _nextBanner(Timer timer) {
    _curPageIndex++;
    _curPageIndex = _curPageIndex == children.length ? 0 : _curPageIndex;

    //curve:和android一样 动画插值
    _pageController.animateToPage(_curPageIndex,
        duration: animateDuration, curve: Curves.linear);
  }


  @override
  void dispose() {
    /// 页面销毁时进行回收
    _pageController.dispose();
    _tabController.dispose();
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          /// 点击时取消timer效果
            onPointerDown: (_) => _timer?.cancel(),
            onPointerUp: (_) {
              ///重新开启timer
              if (children.length > 1) {
                _timer = Timer.periodic(widget.switchDuration, _nextBanner);
              }
            },
            child: NotificationListener(
              onNotification: (notification){
                if(notification is ScrollUpdateNotification) {
                  ScrollUpdateNotification n = notification;
                  /// 判断是否是一次完整的翻页
                  if (n.metrics.atEdge) {
                    if (_curPageIndex == children.length - 1) {
                      /// 如果是最后一页，那么就跳到第一页
                      _pageController.jumpToPage(1);
                    } else if (_curPageIndex == 0) {
                      /// 如果是第一页，再往前滑动，因为原来的list前后都加了一条数据，所以 -2
                      _pageController.jumpToPage(children.length - 2);
                    }
                  }
                }
              },
              child: PageView.builder(
                itemCount: children.length,
                itemBuilder: (context, index) {
                  /// banner设置点击监听
                  return InkWell(
                    child: children[index],
                    onTap: () {
                      print("点击Item");
                    },
                  );
                },
                onPageChanged: (index) {
                  _curPageIndex = index;
                  if (index == children.length - 1) {
                    /// 如果是最后一页，那么下面的指示器设置为0的位置
                    _tabController.animateTo(0);
                  } else if(index == 0){
                    ///如果是第一页再往左滑，那么久设置为指示器最后的位置
                    _tabController.animateTo(_tabController.length-1);
                  }else {
                    _tabController.animateTo(index-1);
                  }
                },
                controller: _pageController,
              ),
            )
        ),
        Positioned(
          child: TabPageSelector(
            controller: _tabController,
            color: Colors.white,
            selectedColor: Colors.grey,
          ),
          bottom: 8.0,
          right: 8.0,
        ),
      ],
    );
  }
}