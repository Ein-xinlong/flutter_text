import 'package:flutter/cupertino.dart';

import 'error_page.dart';
import 'loading.dart';


///处理页面状态流转
class AnCommonBody extends StatelessWidget {

  AnPageState pageState;
  Widget? bodyWidget;
  String? tip;
  String? errorIcon;

  AnCommonBody(this.pageState , {this.bodyWidget, this.tip, this.errorIcon});

  @override
  Widget build(BuildContext context) {
    if(pageState == AnPageState.Success){
      AnLoading.dismiss();
      return bodyWidget == null ? Container() : bodyWidget!;
    }else if(pageState == AnPageState.Error){
      //展示错误页面
      AnLoading.dismiss();
      return AnErrorWidget(tip: tip! , errorIcon: errorIcon!);
    }else if(pageState == AnPageState.Loading){
      //展示loading
      return AnLoading.loading();
    }else if(pageState == AnPageState.EmptyData){
      AnLoading.dismiss();
      //展示空页面
      return  AnErrorWidget(tip: tip! , errorIcon: errorIcon!);
    }

    return Container();
  }
}

enum AnPageState {
  Loading,
  Error,
  EmptyData,
  Success,
  ReLoading,
  Load_No_More,
  Load_Error,
  Load_Refresh,
  Wait_Operation
}