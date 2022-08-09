import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:untitled/bean/main_list.dart';
import 'package:untitled/commitUI/banner_two.dart';
import 'package:untitled/commitUI/appbar.dart';
import 'package:untitled/vm/image_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:untitled/page/page_wan_android.dart';

class JhPhotoPickerTool extends StatefulWidget {
  @override
  _JhPhotoPickerToolState createState() => _JhPhotoPickerToolState();
}

class _JhPhotoPickerToolState extends State<JhPhotoPickerTool> {
  ImageViewModel vm = new ImageViewModel();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.loadingMainList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF8CD75),
      appBar:
          AnAppbar(titleContent: "主页", backPressCallback: null).buildAppBar(),
      body: ChangeNotifierProvider(
        child: Consumer<ImageViewModel>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  BannerTest(),
                  SizedBox(height: 10,),
                  Container(
                    child: _mainList(),
                  )
                ],
              ),
            );
          },
        ),
        create: (BuildContext context) {
          return vm;
        },
      ),
    );
  }

  _mainList() {
    return ListView.separated(
      itemCount: vm.list.length,
      itemBuilder: (context, index) {
        return _mainListItem(vm.list[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  _mainListItem(MainList mainList) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mainList.ListItemString),
          SizedBox(height: 10,),
          GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //每一行的列数
            mainAxisSpacing: 10, //主轴方向上的间距
            crossAxisSpacing: 10, //交叉轴轴方向上的间距
            childAspectRatio: 1.2, //子元素的宽高比例
          ),
              shrinkWrap:true,
          children:_itemList(mainList.item),
          )
        ],
      ),
    );
  }

  List<Widget> _itemList(List<ItemList> item){
    List<Widget> widget=[];

    for(var a in item){
    Widget con= Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Padding(padding: EdgeInsets.all(5),child:  Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 28,
                width: 28,
                child: Image.asset(a.imageUrl,),
              ),
              SizedBox(height: 5,),
              Text(a.itemName,style: TextStyle(fontSize: 12),),
            ],
          ),
        ),),
        onTap: (){
          vm.itemClickOn(a.marker);
        },
      ),
    );
      widget.add(con);
    }
    return widget;
  }
}