import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final picker = ImagePicker();
  File _image;

  Future _getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future _getImageThroughCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < -6) {
          print('swipe left');
          _getImageThroughCamera();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getImage,
          child: Icon(Icons.image),
        ),
      ),
    );
  }
}
