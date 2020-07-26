import 'package:Apptitude_online/services/NavigationProviders/ImagesProvider.dart';
import 'package:Apptitude_online/services/NavigationProviders/NavigatorProvider.dart';
import 'package:Apptitude_online/services/NotificationService/notifModel.dart';
import 'package:Apptitude_online/services/NotificationService/notificationProvider.dart';
import 'package:Apptitude_online/services/connectivity/connectivityService.dart';
import 'package:Apptitude_online/services/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'MainApp.dart';
import 'UI/pages/explore.dart';

SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NotificationModelAdapter());

  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('themeKey')) {
    await prefs.setString('themeKey', "AppThemes.BluePop");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(appThemeData[prefs.getString('themeKey')]),
      ),
      ChangeNotifierProvider<NotificationProvider>(
        create: (_) => NotificationProvider(),
      ),
      ChangeNotifierProvider<NavigatorProvider>(
        create: (_) => NavigatorProvider(Explore()),
      ),
    ChangeNotifierProvider<ImagesProvider>(
    create: (_) => ImagesProvider(),
    ),
      StreamProvider<ConnectivityStatus>(
        create: (_) => ConnectivityService().stream,
      )
    ], child: MainApp());
  }
}
