import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:Apptitude_online/services/Models/ImageModel.dart';
import 'package:path_provider/path_provider.dart';

class ImagesProvider with ChangeNotifier {
  List images;
  int page;
  List images2;

  ImagesProvider() {
    images = List();
    page = Random().nextInt(50);
    getExploredImages();
  }

  Future<void> getImages(String url, {bool explore = false}) async {
    var dir = await getTemporaryDirectory();
    String fileName = "userdata.json";

    File file = new File(dir.path + "/" + fileName);

    try {
      var response = await http.get(url, headers: {
        'Authorization': 'Client-ID sK0Oe8akONbjf0aqn3DxUQYeTClkBZPkgi4MiCt0snE'
      });

      var data = explore
          ? json.decode(response.body)
          : json.decode(response.body)['results'];

      for (var d in data) {
        images.add(
          new ImageModel(
            width: d['width'].toDouble(),
            height: d['height'].toDouble(),
            imageUrl: d['urls']['thumb'],
            fullImageURL: d['urls']['full'],
          ),
        );
        file.writeAsStringSync(response.body,
            flush: true, mode: FileMode.write);
      }
    } catch (e) {
      print('e');
    }
  }

  Future<ImageModel> getImageOffline() async {
    var dir = await getTemporaryDirectory();
    String fileName = "userdata.json";
    File file = new File(dir.path + "/" + fileName);
    var jsonData = file.readAsStringSync();
    ImageModel response = ImageModel.fromJson(json.decode(jsonData));
    return response;
  }

  void resetImages() {
    images = [];
    notifyListeners();
  }

  Future<void> getExploredImages() async {
    resetImages();
    String url = 'https://api.unsplash.com/photos?page=$page';

    await getImages(url, explore: true);
    notifyListeners();
  }

  Future<void> wordSearchImage(List words) async {
    page = 1;
    resetImages();

    String searchTerms = "";
    for (var word in words ?? [""]) {
      searchTerms += word + ',';
    }
    String url =
        'https://api.unsplash.com/search/photos?page=$page&query=$searchTerms';

    await getImages(url);
    notifyListeners();
  }

// Future<>
}
