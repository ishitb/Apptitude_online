import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

class AvatarChanger with ChangeNotifier {
  String _avatar;

  AvatarChanger(this._avatar);

  getAvatar() {
    return _avatar;
  }

  setAvatar(String avatar) async {
    _avatar = avatar;
    prefs = await SharedPreferences.getInstance();
    prefs.setString('avatar', avatar);
    notifyListeners();
  }
}
