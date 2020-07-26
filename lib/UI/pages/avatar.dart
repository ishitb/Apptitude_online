import 'package:Apptitude_online/services/avatarProvider/avatrProvider.dart';
import 'package:Apptitude_online/shared/delayed_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final List<String> _listItems = [
    'assets/images/boss.PNG',
    'assets/images/amie.PNG',
    'assets/images/astro.PNG',
    'assets/images/rj.PNG',
    'assets/images/boy.PNG',
    'assets/images/uncle2.PNG',
    'assets/images/jsutin.PNG',
    'assets/images/brenda.PNG',
    'assets/images/nadie.PNG',
    'assets/images/uncle.PNG',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AvatarChanger avatarChanger = Provider.of<AvatarChanger>(context);
    String _selected = avatarChanger.getAvatar();
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
              children: _listItems
                  .map((item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected = item;
                            avatarChanger.setAvatar(item);
                          });
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover)),
                            child: Opacity(
                              opacity: _selected == item ? 1 : 0,
                              child: Transform.translate(
                                offset: Offset(60, -60),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 72, vertical: 72),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300]),
                                  child: Icon(
                                    Icons.check,
                                    size: 15,
                                  ),
                                ),
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
