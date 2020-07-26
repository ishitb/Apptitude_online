import 'package:Apptitude_online/shared/delayed_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us:',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              DelayedAnimation(
                delay: 100,
                child: Text(
                  'PicBucket is an app where in you can discover hd images from all over the internet. Search for a keyword and see a tonne of results in a single tap.\n\nWhy stop at same old boring search feature? When we provide you with a feature capable of recognising captured images and fetching the most accurate results for it!',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DelayedAnimation(
                delay: 200,
                child: Text(
                  'How does it works?',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 26,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DelayedAnimation(
                delay: 300,
                child: Text(
                  'We have used the Unsplash Api for quick backend solution. For image detection integration we have used Firebase ML kit library.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DelayedAnimation(
                delay: 400,
                child: Text(
                  'Objectives:',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 26,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DelayedAnimation(
                delay: 500,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 170,
                        width: 160,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                  Theme.of(context)
                                      .primaryColorLight
                                      .withOpacity(0.8)
                                ],
                                stops: [
                                  0.1,
                                  0.99
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight,
                                tileMode: TileMode.repeated),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Fetch images from online',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 170,
                        width: 160,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                  Theme.of(context)
                                      .primaryColorLight
                                      .withOpacity(0.8)
                                ],
                                stops: [
                                  0.1,
                                  0.99
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight,
                                tileMode: TileMode.repeated),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Implement a Navigation Drawer wih 6 items.',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 170,
                        width: 160,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                  Theme.of(context)
                                      .primaryColorLight
                                      .withOpacity(0.8)
                                ],
                                stops: [
                                  0.1,
                                  0.99
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight,
                                tileMode: TileMode.repeated),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Push notifications using FCM',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DelayedAnimation(
                delay: 600,
                child: Text(
                  'All the objectives have been done without any support of 3rd party library. Other add on features have been integrated with some librarires.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DelayedAnimation(
                delay: 200,
                child: Text(
                  'Features:',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 26,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DelayedAnimation(
                delay: 300,
                child: Text(
                  'Add on features include:\n(a) Data persistance with Hive\n(b) Caching of Images\n(c) Scalable Architecture\n(d) User firendly UI',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Made with ❤️ from Picbucket',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
