import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bean/driving_book_bean.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/image.dart';
import 'package:untitled/vm/driving_book.dart';

class DrivingBook extends StatefulWidget {
  @override
  _DrivingBookState createState() => _DrivingBookState();
}

class _DrivingBookState extends State<DrivingBook> {
  DrivingBookVm _vm = DrivingBookVm();

  /// 初始化控制器
  PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vm.getpost();

    ///创建控制器的实例
    pageController = new PageController(
      //用来配置PageView中默认显示的页面 从0开始
      initialPage: 0,

      ///为true是保持加载的每个页面的状态
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
          titleContent: "驾考宝典（自制版）",
          backPressCallback: () {
            Navigator.pop(context);
          }).buildAppBar(),
      body: ChangeNotifierProvider(
          create: (_) => _vm,
          child: Consumer<DrivingBookVm>(builder: (context, value, child) {
            return AnCommonBody(_vm.loadState, bodyWidget: _body());
          })),
    );
  }

  _body() {
    return Container(
      child: PageView.builder(
        //当页面选中后回调此方法
        //参数[index]是当前滑动到的页面角标索引 从0开始
        onPageChanged: (int index) {
          print("当前的页面是 $index");
        },
        //值为flase时 显示第一个页面 然后从左向右开始滑动
        //值为true时 显示最后一个页面 然后从右向左开始滑动
        reverse: false,
        //滑动到页面底部无回弹效果
        physics: BouncingScrollPhysics(),
        //纵向滑动切换
        scrollDirection: Axis.horizontal,
        //字条目数量
        itemCount: _vm.list.length,
        //页面控制器
        controller: pageController,
        //所有的子Widget
        itemBuilder: (BuildContext context, int pageViewIndex) {
          return Center(
            child: _item(_vm.list[pageViewIndex]),
          );
        },
      ),
    );
  }

  _item(DriverQuestionList bean) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            child: Container(
              child: ImageBuildView(
                url: bean.imageURL,
              ),
              height: 200,
            ),
            visible: bean.imageURL == null ? false : true,
          ),
          Visibility(
            child: Container(
              child: SizedBox(
                height: 10,
              ),
              height: 20,
            ),
            visible: bean.imageURL == null ? false : true,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline:TextBaseline.alphabetic ,
            children: [
              Container(
                child: Text(
                  _vm.getTitle(bean.questionType),
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  bean.question,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 30.0,
                  width: 30.0,
                  child: Center(
                      child: Text(
                    "A",
                    style: TextStyle(fontSize: 20,color:bean.colorOne==null?Colors.black:Colors.white ),
                  )),
                  decoration: BoxDecoration(
                    color: bean.colorOne==null?Colors.transparent:bean.colorOne==2?Colors.green:Colors.red,
                    border: new Border.all(width: 1.0, color: Colors.white),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(50.0)),
                  ),
                ),
                Text(
                  bean.optionA,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,color: bean.colorOne==null?Colors.black:bean.colorOne==2?Colors.green:Colors.red,),
                ),
                Container(
                  width: 20,
                ),
              ],
            ),
            onTap: () {
              _judge(bean,1);
            },
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 30.0,
                  width: 30.0,
                  child: Center(
                      child: Text(
                    "B",
                    style: TextStyle(fontSize: 18,color:bean.colorTwo==null?Colors.black:Colors.white),
                  )),
                  decoration: BoxDecoration(
                    color:  bean.colorTwo==null?Colors.transparent:bean.colorTwo==2?Colors.green:Colors.red,
                    border: new Border.all(width: 1.0, color: Colors.white),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(50.0)),
                  ),
                ),
                Expanded(
                  child: Text(
                    bean.optionB,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,color: bean.colorTwo==null?Colors.black:bean.colorTwo==2?Colors.green:Colors.red,),
                  ),
                ),
                Container(
                  width: 20,
                ),
              ],
            ),
            onTap: () {
             _judge(bean,2);
            },
          ),
          SizedBox(
            height: 15,
          ),
          Visibility(
            child: InkWell(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    child: Center(
                        child: Text(
                      "C",
                      style: TextStyle(fontSize: 18,color:bean.colorThree==null?Colors.black:Colors.white),
                    )),
                    decoration: BoxDecoration(
                      color:bean.colorThree==null?Colors.transparent:bean.colorThree==2?Colors.green:Colors.red,
                      border: new Border.all(width: 1.0, color: Colors.white),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(50.0)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bean.optionC.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18,color: bean.colorThree==null?Colors.black:bean.colorThree==2?Colors.green:Colors.red,),
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                ],
              ),
              onTap: () {
                _judge(bean,3);
              },
            ),
            visible: bean.optionC == null ? false : true,
          ),
          SizedBox(
            height: 15,
          ),
          Visibility(
            child: InkWell(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    child: Center(
                        child: Text(
                      "D",
                      style: TextStyle(fontSize: 18,color:bean.colorFour==null?Colors.black:Colors.white),
                    )),
                    decoration: BoxDecoration(
                      color: bean.colorFour==null?Colors.transparent:bean.colorFour==2?Colors.green:Colors.red,
                      border: new Border.all(width: 1.0, color: Colors.white),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(50.0)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bean.optionD.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18,color: bean.colorFour==null?Colors.black:bean.colorFour==2?Colors.green:Colors.red,),
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                ],
              ),
              onTap: () {
                _judge(bean,4);
              },
            ),
            visible: bean.optionD == null ? false : true,
          ),
          SizedBox(height: 20,),
          Visibility(child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [

              Expanded(
                child: Text(
                  bean.explains,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                ),
              ),
            ],
          ),visible: bean.isShow==null?false:true,),

        ],
      ),
    );
  }

  ///点击条目后执行此方法，判断是否回答正确
  _judge(DriverQuestionList bean,int number){///1：判断题，2：单选题，3：多选题
    print(bean.key.toString());

    if(bean.questionType=="1"){
      if(bean.colorOne==null&&bean.colorTwo==null){///只能点击一次
        if(number==1){///如果点击的条目是正确的
          if(bean.key=="正确"){
            bean.colorOne=2;///2为回答正确绿色  3为回答错误红色
          }else{
            bean.colorOne=3;
            bean.colorTwo=2;
          }
        }else{
          if(bean.key=="正确"){
            bean.colorOne=2;
            bean.colorTwo=3;
          }else{
            bean.colorTwo=2;
          }
        }
      }

    }else{
      if(bean.colorOne==null&&bean.colorTwo==null&&bean.colorThree==null&&bean.colorFour==null){
        if(number==1){
          if(bean.key=="A"){
            bean.colorOne=2;
          }else{
            bean.colorOne=3;
            if(bean.key=="B"){
              bean.colorTwo=2;
            }else if(bean.key=="C"){
              bean.colorThree=2;
            }else if(bean.key=="D"){
              bean.colorFour=2;
            }
          }
        }else if(number==2){
          if(bean.key=="B"){
            bean.colorTwo=2;
          }else{
            bean.colorTwo=3;
            if(bean.key=="A"){
              bean.colorOne=2;
            }else if(bean.key=="C"){
              bean.colorThree=2;
            }else if(bean.key=="D"){
              bean.colorFour=2;
            }
          }
        }else if(number==3){
          if(bean.key=="C"){
            bean.colorThree=2;
          }else{
            bean.colorThree=3;
            if(bean.key=="A"){
              bean.colorOne=2;
            }else if(bean.key=="B"){
              bean.colorTwo=2;
            }else if(bean.key=="D"){
              bean.colorFour=2;
            }
          }
        }else{
          if(bean.key=="D"){
            bean.colorFour=2;
          }else{
            bean.colorFour=3;
            if(bean.key=="A"){
              bean.colorOne=2;
            }else if(bean.key=="B"){
              bean.colorTwo=2;
            }else if(bean.key=="C"){
              bean.colorThree=2;
            }
          }
        }
      }
    }
    bean.isShow=true;
    setState(() {

    });
  }
}
