import 'dart:math';
import 'package:Apptitude_online/services/theme/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  double width, height;

  final PageController ctrl = PageController(viewportFraction: 0.35);

  int currentPage = 0;

  @override
  void initState() {
    ctrl.addListener(() {
      int next = ctrl.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    List<ThemeData> _gradients = [];

    appThemeData.forEach((key, value) {
      _gradients.add(value);
    });

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                tileMode: TileMode.repeated),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Select a Theme!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 40,
                      fontFamily: 'Mostserrat',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Choose from a wide variety of themes.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 80),
                    child: Transform.rotate(
                      angle: -pi / 7,
                      child: Container(
                        height: 400,
                        width: 400,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: ctrl,
                          itemCount: _gradients.length,
                          itemBuilder: (context, int index) {
                            bool active = index == currentPage;
                            return _buildCircle(active, width, context, ctrl,
                                index, _gradients, themeChanger);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
//              Positioned(
//                bottom: -90,
//                right: -90,
//                child: Icon(
//                  Icons.star_border,
//                  size: 300,
//                  color: Colors.white12,
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }
}

_buildCircle(bool active, double width, BuildContext context,
    PageController ctrl, index, _gradients, themeChanger) {
  return GestureDetector(
    onTap: () {
      themeChanger.setTheme(_gradients[index]);
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutExpo,
      margin:
          EdgeInsets.only(top: active ? 130 : 150, bottom: active ? 170 : 150),
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[300], width: 5),
        gradient: LinearGradient(
            colors: [
              _gradients[index].primaryColor,
              _gradients[index].primaryColorLight
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            tileMode: TileMode.repeated),
      ),
    ),
  );
}
