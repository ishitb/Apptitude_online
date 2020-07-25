import 'package:Apptitude_online/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum AppThemes {
  BluePop,
  RipeMango,
  MintGreen,
  HotPink,
  SeaGreen,
  Violet,
  SunRise,
  NewLeaf,
  MetalGreen,
  GreenApple
}

final appThemeData = {
  "AppThemes.BluePop": ThemeData(
    primaryColorLight: Colors.blueAccent[100],
    primaryColor: PopBlue,
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.MintGreen": ThemeData(
    primaryColorLight: Colors.lightGreen[500],
    primaryColor: Colors.green,
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.RipeMango": ThemeData(
    primaryColorLight: Colors.amber[200],
    primaryColor: Color(0xFFe68d60),
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.HotPink": ThemeData(
    primaryColorLight: Colors.blueAccent[100],
    primaryColor: Colors.pinkAccent[100],
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.SeaGreen": ThemeData(
    primaryColorLight: Colors.greenAccent,
    primaryColor: SeaGreen,
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.Violet": ThemeData(
    primaryColorLight: Color(0xFFeaafc8),
    primaryColor: Color(0xFF8a60bf),
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.SunRise": ThemeData(
    primaryColorLight: Color(0xFFffa77b),
    primaryColor: Color(0xFFf46266),
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.NewLeaf": ThemeData(
    primaryColorLight: Color(0xFFB5AC49),
    primaryColor: Color(0xFF3CA55C),
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.MetalGreen": ThemeData(
    primaryColorLight: Color(0xFF8ad4f8),
    primaryColor: Color(0xFF4ec6a2),
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
  "AppThemes.GreenApple": ThemeData(
    primaryColorLight: Color(0xFF53c8ba),
    primaryColor: Color(0xFF7f9cdd),
    primarySwatch: Colors.blueGrey,
    canvasColor: Colors.transparent,
  ),
};

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(_themeData) {
    this._themeData = _themeData;
  }

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    appThemeData.forEach((key, value) {
      if (value == theme) {
        saveTheme(key);
      }
    });
    _themeData = theme;
    notifyListeners();
  }

  Future<void> saveTheme(themeKey) async {
    SharedPreferences _sprefs = await SharedPreferences.getInstance();
    _sprefs.setString('themeKey', themeKey);
    notifyListeners();
  }
}
