import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Apptitude_online/services/Providers/NavigatorProvider.dart';
import 'package:Apptitude_online/services/theme/themeProvider.dart';
import 'services/Providers/ImagesProvider.dart';
import 'MainApp.dart';
import 'UI/pages/explore.dart';

SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('themeKey')) {
    await prefs.setString('themeKey', "AppThemes.BluePop");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) =>
              ThemeChanger(appThemeData[prefs.getString('themeKey')]),
        ),
        ChangeNotifierProvider<NavigatorProvider>(
          create: (_) => NavigatorProvider(Explore()),
        ),
        ChangeNotifierProvider<ImagesProvider>(
          create: (_) => ImagesProvider(),
        ),
      ],
      child: MainApp(),
    );
  }
}
