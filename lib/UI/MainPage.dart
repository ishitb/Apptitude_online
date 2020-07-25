import 'package:Apptitude_online/services/Providers/NavigatorProvider.dart';
import 'package:Apptitude_online/shared/foldable_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customDrawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FSBStatus status;

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
            Icons.menu,
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
        drawer: CustomDrawer(closeDrawer: (){
          setState(() {
            status = FSBStatus.FSB_CLOSE;
          });
        },),
        screenContents: navigatorProvider.getWidget(),
      ),
    );
  }
}


