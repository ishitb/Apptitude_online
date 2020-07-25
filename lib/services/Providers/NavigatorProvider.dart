import 'package:flutter/cupertino.dart';

class NavigatorProvider with ChangeNotifier {
  Widget _widget;

  NavigatorProvider(_widget) {
    this._widget = _widget;
  }

  getWidget() => _widget;

  setWidget(Widget widget) {
    _widget = widget;
    notifyListeners();
  }

}
