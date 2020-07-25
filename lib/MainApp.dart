import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/theme/themeProvider.dart';
import 'UI/homepage.dart';
import 'UI/MainPage.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'PicBucket',
      home: MainPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 150,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            color: Colors.white,
            child: MainPage(),
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
              height: 100,
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.menu,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
