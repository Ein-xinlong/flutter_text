import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/utils/random_number.dart';
import 'package:untitled/utils/toash.dart';

import '../commitUI/button.dart';
class RandomNumber extends StatefulWidget {

  @override
  _RandomNumberState createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber> {

  String code;
  String textString;
  @override
  void initState() {
    super.initState();
    _getCode();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
        titleContent: "随机数",
        backPressCallback: (){
          Navigator.pop(context);
        }
      ).buildAppBar(),
      body:Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                child: TextField(
                  maxLines: 1,//最大行数
                  decoration: InputDecoration(
                    hintText: "请输入验证码",
                    border: InputBorder.none,
                  ),

                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4)
                  ],
                  onChanged: (text) {
                    textString=text;
                  },
                  onSubmitted: (text) {
                    _contrast();
                  },
                ),
              ),
              InkWell(
                  child:Container(
                      padding: EdgeInsets.only(left:10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:Border(
                              left:BorderSide(
                                  width:1,
                                  color:Color(0xffC7C7C7)
                              )
                          )
                      ),
                      child:CustomVertificationCode(
                        code: code,
                      )
                  ),
                  onTap:(){
                    _getCode();
                  }
              ),
            ],
          ),
          Container(child: TextButtonPurple(text: "随机数",onPressed: (){
            _contrast();
          },),width: double.infinity,),
        ],
      )
    );

  }
  _contrast(){
    FocusScope.of(context).requestFocus(FocusNode());
    if(code==textString){
      Toast.toast(context, "验证成功");
    }else{
      Toast.toast(context, "验证失败，请重新输入");
    }
  }
  // 调用随机数方法
  _getCode(){
    code = '';
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    for (var i = 0; i < 4; i++) {
      String charOrNum = Random().nextInt(2) % 2 == 0 ? "char" : "num";
      switch (charOrNum) {
        case "char":
          code += alphabet[Random().nextInt(alphabet.length)];
          break;
        case "num":
          code += Random().nextInt(9).toString();
          break;
      }
      setState(() {});
    }
  }
}
