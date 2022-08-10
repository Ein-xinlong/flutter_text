import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bean/girl_page_bean.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/utils/common_body.dart';
import 'package:untitled/utils/image.dart';
import 'package:untitled/vm/girl_page_vm.dart';


class GirlPage extends StatefulWidget {


  @override
  _GirlPageState createState() => _GirlPageState();
}

class _GirlPageState extends State<GirlPage> {
  GirlPageVm _vm = GirlPageVm();

  @override
  void initState() {
    super.initState();
    _vm.getList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnAppbar(
          titleContent: "美女",
          backPressCallback: () {
            Navigator.pop(context);
          }
      ).buildAppBar(),
      body: ChangeNotifierProvider(
          create: (_) => _vm,
          child: Consumer<GirlPageVm>(builder: (context, value, child) {
            return AnCommonBody(_vm.loadState, bodyWidget: _body());
          })),
    );
  }

  _body() {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
              crossAxisCount: 2,
            //宽高比 默认1
            childAspectRatio: 1 / 1.5,
              ),
          itemCount: _vm.list.length,

          shrinkWrap:true,
          itemBuilder: (context, index) {
            return item(_vm.list[index]);
          }),
    );
  }

  item(Result result) {
    return Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageBuildView(url: result.img!,),
            Text(result.time.toString()),
          ],
        ),
      ),);
  }

}

