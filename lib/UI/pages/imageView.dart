import 'package:flutter/material.dart';

class imageView extends StatelessWidget {
  final String imgURL;

  const imageView({Key key, this.imgURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/utils/loading.gif',
          image: imgURL,
        ));
  }
}
