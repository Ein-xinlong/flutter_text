import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/unit_paint.dart';

import 'MainTabs.dart';
import '../commitUI/flutter_unit_text.dart';


class UnitSplash extends StatefulWidget {
  const UnitSplash();

  @override
  _UnitSplashState createState() => _UnitSplashState();
}

class _UnitSplashState extends State<UnitSplash> with TickerProviderStateMixin {
    AnimationController _controller;

  ValueNotifier<bool> _animEnd = ValueNotifier<bool>(false);

  final Duration animTime = const Duration(milliseconds: 1000);
  final Duration delayTime = const Duration(milliseconds: 500);
  final Duration fadeInTime = const Duration(milliseconds: 600);

   Animation<Offset> logoOffsetAnim;
    Animation<Offset> headOffsetAnim;
    Animation<double> logoScaleAnim;

    UnitPainter unitPainter;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    _controller = AnimationController(duration: animTime, vsync: this)
      ..addStatusListener(_listenStatus)
      ..forward();
    unitPainter= UnitPainter(repaint: _controller);
    initAnimation();

    Future.delayed(delayTime).then((e) => _animEnd.value = true);
  }

  void initAnimation() {
    logoOffsetAnim = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1.5),
    ).animate(_controller);

    headOffsetAnim = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(0, -5),
    ).animate(_controller);

    logoScaleAnim = Tween(begin: 2.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animEnd.dispose();
    super.dispose();
  }

  void _listenStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(delayTime).then((e) {
          Get.offAll(Tabs());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size winSize = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildFlutterLogo(),
          CustomPaint(
            painter: unitPainter,
            size: winSize,
          ),
          _buildFlutterUnitText(winSize.height, winSize.width),
          _buildHead(),
        ],
      ),
    );
  }

  Widget _buildFlutterUnitText(double winH, double winW) {
    return Positioned(
      top: winH / 1.4,
      child: ValueListenableBuilder(
        child: FlutterUnitText(
          text: "AnDemo",
          color: Theme.of(context).primaryColor,
        ),
        valueListenable: _animEnd,
        builder: (_, bool value, Widget  child) => value
            ? child  : const SizedBox(),
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return SlideTransition(
      position: logoOffsetAnim,
      child: RotationTransition(
          turns: _controller,
          child: ScaleTransition(
            scale: logoScaleAnim,
            child: FadeTransition(
                opacity: _controller,
                child: SizedBox(
                  height: 120,
                  child: const FlutterLogo(
                    size: 60,
                  ),
                )),
          )),
    );
  }

  Widget _buildHead() => SlideTransition(
        position: headOffsetAnim,
        child: Image.asset(
          'assets/images/icon_head.webp',
          width: 45,
          height: 45,
        ),
      );

  // // 监听资源加载完毕，启动，触发事件
  // void _listenStart(BuildContext context, GlobalState state) {
  //     BlocProvider.of<WidgetsBloc>(context).add(const EventTabTap(WidgetFamily.statelessWidget));
  //     BlocProvider.of<LikeWidgetBloc>(context).add(const EventLoadLikeData());
  //     BlocProvider.of<CategoryBloc>(context).add(const EventLoadCategory());
  // }
}
