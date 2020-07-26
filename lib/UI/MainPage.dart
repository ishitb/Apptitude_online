import 'package:Apptitude_online/services/NavigationProviders/NavigatorProvider.dart';
import 'package:Apptitude_online/services/NotificationService/notifModel.dart';
import 'package:Apptitude_online/services/NotificationService/notificationProvider.dart';
import 'package:Apptitude_online/shared/foldable_sidebar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customDrawer.dart';

class MainPage extends StatefulWidget {
  final NotificationProvider notif;

  const MainPage({Key key, this.notif}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FSBStatus status;

  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        widget.notif.addNotif(NotificationModel(
            title: message['notification']['title'], message: message['notification']['body']));
        print('added');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NavigatorProvider navigatorProvider =
        Provider.of<NavigatorProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            status == FSBStatus.FSB_OPEN ? Icons.clear : Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              status = status == FSBStatus.FSB_OPEN
                  ? FSBStatus.FSB_CLOSE
                  : FSBStatus.FSB_OPEN;
            });
          },
        ),
        title: Text(
          "PicBucket",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.camera),
      ),
      backgroundColor: Colors.white,
      body: FoldableSidebarBuilder(
        status: status,
        drawer: CustomDrawer(
          closeDrawer: () {
            setState(() {
              status = FSBStatus.FSB_CLOSE;
            });
          },
        ),
        screenContents: navigatorProvider.getWidget(),
      ),
    );
  }
}
