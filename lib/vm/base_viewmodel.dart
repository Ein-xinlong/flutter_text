
import 'package:flutter/cupertino.dart';
import 'package:untitled/utils/common_body.dart';


///提供页面状态设置
class AnBaseViewModel extends ChangeNotifier{

  ///缓存BuildContext
  BuildContext? context;

  ///页面加载状态
  var _loadState = AnPageState.Loading;
  AnPageState get loadState => _loadState;

  set loadState(AnPageState pageState) {
    if (pageState != _loadState) {
      _loadState = pageState;
      notifyListeners();
    }
  }

}