import 'file:///C:/Users/ysyas/Apptitude_online/lib/UI/pages/ThemeSelector.dart';
import 'file:///C:/Users/ysyas/Apptitude_online/lib/UI/pages/aboutUs.dart';
import 'file:///C:/Users/ysyas/Apptitude_online/lib/UI/pages/avatar.dart';
import 'file:///C:/Users/ysyas/Apptitude_online/lib/UI/pages/popular.dart';
import 'package:Apptitude_online/services/Providers/NavigatorProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/explore.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorProvider navigatorProvider =
        Provider.of<NavigatorProvider>(context);

    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/astro.PNG'),
                            fit: BoxFit.fitHeight)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Asset Name")
                ],
              )),
          ListTile(
            onTap: () {
              navigatorProvider.setWidget(Explore());
              closeDrawer();
              },
            leading: Icon(Icons.explore),
            title: Text(
              "Explore",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              navigatorProvider.setWidget(Popular());
              closeDrawer();
              },
            leading: Icon(Icons.new_releases),
            title: Text("Popular"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              navigatorProvider.setWidget(Avatar());
              closeDrawer();
              },
            leading: Icon(Icons.person_outline),
            title: Text("Change Avatar"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              navigatorProvider.setWidget(ThemePage());
              closeDrawer();
              },
            leading: Icon(Icons.format_color_fill),
            title: Text("Change Theme"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              navigatorProvider.setWidget(AboutUs());
              closeDrawer();
            },
            leading: Icon(Icons.description),
            title: Text("About Us"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.find_in_page),
            title: Text("Readme"),
          ),
        ],
      ),
    );
  }
}
