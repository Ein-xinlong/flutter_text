import 'package:flutter/material.dart';

import '../commitUI/appbar.dart';

class StateRadioBoxDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StateRadioBoxDemoPageState();
}

class _StateRadioBoxDemoPageState extends State<StateRadioBoxDemoPage> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(false, 'A', 'www.appblog.cn'));
    sampleData.add(new RadioModel(false, 'G', 'www.google.com'));
    sampleData.add(new RadioModel(false, 'B', 'www.baidu.com'));
    sampleData.add(new RadioModel(false, 'G', 'www.github.com'));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AnAppbar(
          titleContent: "单选列表",
          backPressCallback: null
      ).buildAppBar(),
      body: new ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.black12,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 20.0,
            width: 20.0,
            child: Center(
                child: Icon(
                  Icons.check,
                  color:_item.isSelected ? Colors.white: Colors.transparent,
                  size: 14,
                )),
            decoration:  BoxDecoration(
              color: _item.isSelected ? Color(0xFF99CC33
              ) : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Color(0xFF99CC33
                  ) : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
            ),
          ),
          Expanded(child: Container(
            child:Center(
              child: Text(_item.text),
            ),
          )),
          Container(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}