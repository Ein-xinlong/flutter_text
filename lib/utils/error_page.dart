import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AnErrorWidget extends StatelessWidget {

  String tip;
  String errorIcon;
  AnErrorWidget({this.tip , this.errorIcon});

  @override
  Widget build(BuildContext context) {
    return _ErrorPage(
        errorImage: Icon(Icons.error,size: 140,color: Colors.red,),
        errorText: Text("加载失败",style: TextStyle(fontSize: 16),));
  }
}

typedef OnReTryPress = void Function();

class _ErrorPage extends StatefulWidget {
  final Icon errorImage;
  final Text errorText;
  final Widget btnWidget;
  final double space1;
  final double space2;
  final double offsetY;
  final OnReTryPress retry;

  _ErrorPage(
      {Key key,
      this.errorImage,
      this.errorText,
      this.btnWidget,
      this.space1 = 12,
      this.space2 = 12,
      this.retry,
      this.offsetY})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ErrorPageState();
  }
}

class _ErrorPageState extends State<_ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          top: widget.offsetY,
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.errorImage ?? Container(),
                SizedBox(height: widget.errorImage == null ? 0 : widget.space1),
                widget.errorText ?? Container(),
                SizedBox(height: widget.errorText == null ? 0 : widget.space2),
                GestureDetector(
                  onTap: () {
                    if (widget.retry != null) {
                      widget.retry();
                    }
                  },
                  child: widget.btnWidget ?? Container(),
                )
              ],
            ),
          ))
    ]);
  }
}
