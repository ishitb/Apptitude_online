import 'package:Apptitude_online/UI/pages/explore.dart';
import 'package:Apptitude_online/services/NavigationProviders/NavigatorProvider.dart';
import 'package:Apptitude_online/shared/colors.dart';
import 'package:Apptitude_online/shared/delayed_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    NavigatorProvider navigatorProvider =
        Provider.of<NavigatorProvider>(context);
    return Scaffold(
      body: Container(
        child: DelayedAnimation(
          delay: 50,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: popularList
                  .map((item) => GestureDetector(
                        onTap: () {
                          navigatorProvider.setWidget(Explore(
                            title: item.title.toString(),
                          ));
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: item.color),
                            child: Center(
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    color: White,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class PopularModel {
  String title;
  Color color;
  PopularModel({this.title, this.color});
}

final popularList = [
  PopularModel(color: Colors.green[800], title: 'Plants'),
  PopularModel(color: Colors.brown[300], title: 'Coffee'),
  PopularModel(color: Colors.blueGrey[500], title: 'Phtography'),
  PopularModel(color: Colors.blueAccent[100], title: 'Beach'),
  PopularModel(color: Colors.grey[700], title: 'Technology'),
  PopularModel(color: Colors.red[500], title: 'Songs'),
  PopularModel(color: Colors.black, title: 'Smartphones'),
  PopularModel(color: Colors.yellow[700], title: 'Cricket'),
  PopularModel(color: Colors.grey[900], title: 'Football'),
  PopularModel(color: Colors.blue[200], title: 'Nature'),
];
