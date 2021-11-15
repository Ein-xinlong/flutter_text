///请求没返回时 展示loading
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnLoading {
  static OverlayEntry gloableLoadingEntry;

  static show(
      {@required BuildContext context,
        Color backgroundColor = Colors.transparent,
        double top = 0.0}) {
    var paddingTop = top + MediaQuery.of(context).padding.top;

    if (gloableLoadingEntry != null) {
      gloableLoadingEntry.remove();
    }
    gloableLoadingEntry = OverlayEntry(builder: (context) {
      print(MediaQuery.of(context).size.height);
      return Positioned(
          top: paddingTop,
          child: Material(
            color: backgroundColor,
            child: Container(
              height: MediaQuery.of(context).size.height - top,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: AnLoadingView(),
            ),
          ));
    });
    Overlay.of(context).insert(gloableLoadingEntry);
  }

  static dismiss() {
    if (gloableLoadingEntry != null) {
      gloableLoadingEntry.remove();
      gloableLoadingEntry = null;
    }
  }

  static loading() {
    return AnLoadingView();
  }
}

class AnLoadingView extends StatelessWidget {
  const AnLoadingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x33000000),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}
