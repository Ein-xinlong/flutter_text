import 'package:flutter/material.dart';

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
      appBar: new AppBar(
        title: new Text("单选列表"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: new ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
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
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 20.0,
            width: 20.0,
            // child: new Center(
            //   child: new Text(_item.buttonText,
            //       style: new TextStyle(
            //           color:
            //           _item.isSelected ? Colors.white : Colors.black,
            //           //fontWeight: FontWeight.bold,
            //           fontSize: 18.0)),
            // ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? Colors.blueAccent
                  : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? Colors.blueAccent
                      : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
            ),
          ),
          SizedBox(width: 100,),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(_item.text),
          )
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