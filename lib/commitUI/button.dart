import 'package:flutter/material.dart';



/// 决策按钮
/// 紫色FlatButton
class TextButtonPurple extends StatelessWidget {
  String text;
  Function? onPressed;
  TextStyle? textStyle;
  bool isDisabled = false;
  BorderRadius _borderRadius = BorderRadius.all(Radius.circular(100));
  List<Color> _colors = [Color(0xFFFFCC99), Color(0xFF99CC99)];

  TextButtonPurple(
      {required this.text,
        this.onPressed,
        this.textStyle,
        this.isDisabled = false,
        BorderRadius? borderRadius,
        List<Color>? colors}) {
    if (borderRadius != null) {
      this._borderRadius = borderRadius;
    }
    if (colors != null) {
      _colors = colors;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors;
    if (!isDisabled) {
      colors = _colors;
    } else {
      colors = _colors.map((e) => e.withOpacity(0.6)).toList();
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors,
        ),
        borderRadius: _borderRadius,
      ),
      child: TextButton(
        onPressed: this.isDisabled
            ? null
            : () {
          this.onPressed!.call();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            this.text,
            style: this.textStyle != null
                ? this.textStyle
                : TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: _borderRadius)),
          overlayColor: MaterialStateProperty.resolveWith(
                (states) {
              return Colors.black12;
            },
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
        ),
      ),
    );
  }
}

class TextButtonWhite extends StatelessWidget {
  String text;
  Function onPressed;
  TextStyle _textStyle = TextStyle(
    color: Color(0xFF1A1A1A),
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  bool isDisabled = false;
  BorderRadius _borderRadius = BorderRadius.all(Radius.circular(100));

  TextButtonWhite(
      {required this.text,
        required this.onPressed,
        TextStyle? textStyle,
        this.isDisabled = false,
        BorderRadius? borderRadius}) {
    if (borderRadius != null) {
      this._borderRadius = borderRadius;
    }
    if (textStyle != null) {
      _textStyle = textStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButtonPurple(
      text: text,
      onPressed: onPressed,
      textStyle: _textStyle,
      isDisabled: isDisabled,
      borderRadius: _borderRadius,
      colors: [Colors.white, Colors.white],
    );
  }
}

///灰底蓝色文字的按钮
class TextButtonGray extends StatelessWidget {
  String text;
  Function onPressed;
  TextStyle _textStyle = TextStyle(
    color: Color(0xFF4B5FE1),
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  bool isDisabled = false;
  BorderRadius _borderRadius = BorderRadius.all(Radius.circular(100));

  TextButtonGray(
      {required this.text,
        required this.onPressed,
        TextStyle? textStyle,
        this.isDisabled = false,
        BorderRadius? borderRadius}) {
    if (borderRadius != null) {
      this._borderRadius = borderRadius;
    }
    if (textStyle != null) {
      _textStyle = textStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButtonPurple(
      text: text,
      onPressed: onPressed,
      textStyle: _textStyle,
      isDisabled: isDisabled,
      borderRadius: _borderRadius,
      colors: [Color(0xFFF6F6F6), Color(0xFFF6F6F6)],
    );
  }
}

/// 功能按钮A
/// 紫色边框的OutlineButton
/// 注意默认状态背景是透明，需要额外设置底色
class OutlineButtonPurple extends StatelessWidget {
  String text;
  Function onPressed;
  TextStyle? textStyle;
  bool isDisabled = false;
  BorderRadius _borderRadius = BorderRadius.all(Radius.circular(100));

  OutlineButtonPurple(
      {required this.text,
        required this.onPressed,
        this.textStyle,
        this.isDisabled = false,
        BorderRadius? borderRadius}) {
    if (borderRadius != null) {
      _borderRadius = borderRadius;
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: this.isDisabled
            ? null
            : () {
          this.onPressed.call();
        },
        child: Text(
          this.text,
          style: this.textStyle != null
              ? this.textStyle
              : TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          maxLines: 1,
        ),
        // color: Colors.white,
        // textColor: Color(0xFF1A1A1A),
        // borderSide: BorderSide(color: Color(0xFF4B5FE1)),
        // disabledBorderColor: Color(0xFF4B5FE1).withOpacity(0.6),
        // disabledTextColor: Color(0xFF1A1A1A).withOpacity(0.6),
        // highlightColor: Colors.black12,
        // highlightedBorderColor: Color(0xFF4B5FE1),
        // shape: RoundedRectangleBorder(
        //   borderRadius: _borderRadius,
        // )
        );
  }
}
