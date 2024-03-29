import 'dart:async';

import 'package:flutter/material.dart';

import '../commitUI/dial_plate.dart';



class Clock extends StatefulWidget {


  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer? _timer;
  bool _firstSwitch = true;
  bool _secondSwitch = false;
  bool _thirdSwitch = false;

  Color _colorOn = Colors.yellow;
  Color _colorOff = Colors.yellow.withAlpha(100);



  Color _switchActiveColor = Colors.yellow;
  Color _switchInActiveColor = Colors.yellow.withAlpha(100);
  @override
  void initState() {
    super.initState();
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
          children: [
            CustomPaint(painter: DialPlate(context,Color.fromARGB(255, 70, 0, 144),Color.fromARGB(255, 121, 83, 254))),
            _getAlarms(),
          ],
        ));
  }
  _getAlarms() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            _getRow1(),
            _getRow2(),
            _getRow3(),
          ],
        ),
      ),
    );
  }
  _getRow1() {

    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Text(
            '06:45',
            style: TextStyle(

                fontSize: 25,
                color: _firstSwitch == true ? _colorOn : _colorOff),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              '起床',
              style: TextStyle(

                  fontSize: 18,
                  color: _firstSwitch == true ? _colorOn : _colorOff),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            width: 90,
            height: 10,
            child: Switch(
              value: _firstSwitch,
              onChanged: (onChanged) {
                setState(() {_firstSwitch = onChanged;});
              },
              activeColor: _switchActiveColor,
              activeTrackColor: Colors.black.withAlpha(100),
              inactiveThumbColor: _switchInActiveColor,
              inactiveTrackColor: Colors.black.withAlpha(20),
            ),

          )
        ],
      ),
    );
  }

  _getRow2() {

    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Text(
            '08:00',
            style: TextStyle(

                fontSize: 25,
                color: _secondSwitch == true ? _colorOn : _colorOff),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              '上班',
              style: TextStyle(

                  fontSize: 18,
                  color: _secondSwitch == true ? _colorOn : _colorOff),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            width: 90,
            height: 10,
            child: Switch(
              value: _secondSwitch,
              onChanged: (onChanged) {
                setState(() {_secondSwitch = onChanged;});
              },
              activeColor: _switchActiveColor,
              activeTrackColor: Colors.black.withAlpha(100),
              inactiveThumbColor: _switchInActiveColor,
              inactiveTrackColor: Colors.black.withAlpha(20),
            ),

          )
        ],
      ),
    );
  }

  _getRow3() {

    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Text(
            '12:00',
            style: TextStyle(

                fontSize: 25,
                color: _thirdSwitch == true ? _colorOn : _colorOff),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              '午饭',
              style: TextStyle(

                  fontSize: 18,
                  color: _thirdSwitch == true ? _colorOn : _colorOff),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            width: 90,
            height: 10,
            child: Switch(
              value: _thirdSwitch,
              onChanged: (onChanged) {
                setState(() {_thirdSwitch = onChanged;});
              },
              activeColor: _switchActiveColor,
              activeTrackColor: Colors.black.withAlpha(100),
              inactiveThumbColor: _switchInActiveColor,
              inactiveTrackColor: Colors.black.withAlpha(20),
            ),

          )
        ],
      ),
    );
  }

}
