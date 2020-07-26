import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// import 'package:image_picker/image_picker.dart';

class Detection {
  Future<List> getLabels(File imageFile) async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    final ImageLabeler labeler = FirebaseVision.instance.imageLabeler();

    final List<ImageLabel> labels = await labeler.processImage(visionImage);

    final List<String> finalLabels = List();

    for (ImageLabel label in labels) {
      // print({
      //   'text': label.text,
      //   'entityId': label.entityId,
      //   'confidence': label.confidence
      // });
      finalLabels.add(label.text);
    }
    return finalLabels;
  }
}
