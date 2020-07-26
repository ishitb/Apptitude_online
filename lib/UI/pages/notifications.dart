import 'package:Apptitude_online/services/NotificationService/notificationProvider.dart';
import 'package:Apptitude_online/shared/delayed_animation.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<NotificationProvider>(context).getNotifList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length != 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  DelayedAnimation(
                    delay: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 100,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Notification\nCount:',style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,),
                            SizedBox(height: 10,),
                            Text(Provider.of<NotificationProvider>(context).notifCount.toString(),style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  DelayedAnimation(
                    delay: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: Container(
                            height: 80,
                            color: Colors.white,
                            width: double.infinity,
                            child: Center(
                              child: ListTile(
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    var notif =
                                        Provider.of<NotificationProvider>(
                                                context,
                                                listen: false)
                                            .getNote(index)
                                            .key;
                                    Provider.of<NotificationProvider>(context,
                                            listen: false)
                                        .deleteNotif(notif);
                                  },
                                ),
                                title: Text(
                                  '${index+1}. ${Provider.of<NotificationProvider>(context)
                                      .getNote(index)
                                      .title}',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                    Provider.of<NotificationProvider>(context)
                                        .getNote(index)
                                        .message
                                        .toString()),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount:
                          Provider.of<NotificationProvider>(context).notifCount,
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 400,
                      child: FlareActor('assets/emptyFlare.flr',
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "empty"),
                    ),
                    DelayedAnimation(
                      delay: 100,
                      child: Text(
                        'No Notifications yet!\nCome back soon.',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 25,
                            fontWeight: FontWeight.w200),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 4,
              backgroundColor: Colors.green,
            ));
          }
        },
      ),
    );
  }
}
