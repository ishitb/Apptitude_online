import 'package:Apptitude_online/UI/pages/ThemeSelector.dart';
import 'package:Apptitude_online/UI/pages/aboutUs.dart';
import 'package:Apptitude_online/UI/pages/avatar.dart';
import 'package:Apptitude_online/UI/pages/notifications.dart';
import 'package:Apptitude_online/UI/pages/popular.dart';
import 'package:Apptitude_online/services/NavigationProviders/NavigatorProvider.dart';
import 'package:Apptitude_online/services/avatarProvider/avatrProvider.dart';
import 'package:Apptitude_online/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/explore.dart';

SharedPreferences prefs;

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorProvider navigatorProvider =
        Provider.of<NavigatorProvider>(context);
    AvatarChanger avatarChanger = Provider.of<AvatarChanger>(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorLight.withOpacity(0.6)
                    ],
                    stops: [
                      0.1,
                      0.99
                    ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.topRight,
                    tileMode: TileMode.repeated),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(avatarChanger.getAvatar()),
                            fit: BoxFit.fitHeight)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Team Strivers",
                    style: TextStyle(
                        color: Black,
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Positioned(
                  left: 0,
                  child: Container(
                    width: mediaQuery.size.width * 0.60,
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColorLight
                          ],
                          stops: [
                            0.1,
                            0.99
                          ],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.topRight,
                          tileMode: TileMode.repeated),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    onTap: () {
                      navigatorProvider.setWidget(Explore());
                      closeDrawer();
                    },
                    leading: Icon(Icons.explore),
                    title: Text(
                      "Explore",
                    ),
                  ),
                ),
              ],
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
                navigatorProvider.setWidget(Notifications());
                closeDrawer();
              },
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
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
            SizedBox(
              height: 20,
            ),
            Text('Version 1.0.1'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
