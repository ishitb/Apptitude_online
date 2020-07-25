import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:Apptitude_online/services/ObjectDetection/Detection.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final picker = ImagePicker();
  File _image;
  Detection objectDetector = Detection();

  Future _getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      objectDetector.getLabels(File(image.path));
    }
  }

  Future _getImageThroughCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      objectDetector.getLabels(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: _getImageThroughCamera,
              child: Icon(Icons.camera),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: _getImage,
          child: Icon(Icons.image),
        ),
      ),
    );
  }
}
