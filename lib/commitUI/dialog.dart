import 'package:flutter/material.dart';
import 'package:untitled/utils/back_press_channel.dart';

import 'button.dart';

///1. 只有内容时，title传content
///2. 只需要一个按钮时，根据样式，选择只传 btnNegative or btnPositive
Future<bool> showCommonDialog(BuildContext contextFrom,
    {String title, String content, String btnNegative, String btnPositive, Function positiveCallback, Function negativeCallback}) {
  return Navigator.of(contextFrom).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        BackPressChannel.instance()
            .register(context, pageName: 'HdDialog of $title');
        return Material(
          color: Color(0xA6000000),
          child: Center(
            child: Container(
              width: 280,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 24, right: 24),
                    child: Text(
                      "$title",
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: content != null ? 18 : 20,
                        fontWeight: content != null
                            ? FontWeight.normal
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: content == null,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, left: 24, right: 24),
                      child: Text(
                        '$content',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Color(0xFF646468), fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(height: 1, color: Colors.black12),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: _getButtons(context, btnNegative, btnPositive, positiveCallback , negativeCallback),
                  )
                ],
              ),
            ),
          ),
        );
      },
      opaque: false,
      transitionDuration: Duration(milliseconds: 150),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
            child: child,
          ),
    ),
  );
}

List<Widget> _getButtons(
    BuildContext context, String btnNegative, String btnPositive, Function positiveCallback, Function negativeCallback) {
  var isSingleBtn = btnNegative == null || btnPositive == null;
  var btns = <Widget>[];
  double buttonHeight = 49;
  TextStyle positiveTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  TextStyle negativeTextStyle = TextStyle(
    color: Color(0xFF1A1A1A),
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  if (btnNegative != null) {
    if (isSingleBtn) {
      btns.add(
        Expanded(
          child: Container(
            height: buttonHeight,
            child: TextButtonWhite(
              text: btnNegative,
              onPressed: () {
                Navigator.pop(context, false);
                negativeCallback?.call();
              },
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              textStyle: negativeTextStyle,
            ),
          ),
        ),
      );
    } else {
      btns.add(Expanded(
        child: Container(
          height: buttonHeight,
          child: TextButtonWhite(
            text: btnNegative,
            onPressed: () {
              Navigator.pop(context, false);
              negativeCallback?.call();
            },
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
            ),
            textStyle: negativeTextStyle,
          ),
        ),
      ));
    }
  }
  if (btnPositive != null) {
    if (isSingleBtn) {
      btns.add(
        Expanded(
          child: Container(
            height: buttonHeight,
            child: TextButtonPurple(
              text: btnPositive,
              onPressed: () {
                Navigator.pop(context, true);
                positiveCallback?.call();
              },
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              textStyle: positiveTextStyle,
            ),
          ),
        ),
      );
    } else {
      btns.add(Expanded(
        child: Container(
          height: buttonHeight,
          child: TextButtonPurple(
            text: btnPositive,
            onPressed: () {
              Navigator.pop(context, true);
              positiveCallback?.call();
            },
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
            ),
            textStyle: positiveTextStyle,
          ),
        ),
      ));
    }
  }
  return btns;
}
