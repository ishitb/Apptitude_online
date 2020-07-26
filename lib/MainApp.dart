import 'package:Apptitude_online/services/NotificationService/notificationProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/theme/themeProvider.dart';
import 'UI/MainPage.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final notif = Provider.of<NotificationProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'PicBucket',
      home: MainPage(notif: notif,),
    );
  }
}

