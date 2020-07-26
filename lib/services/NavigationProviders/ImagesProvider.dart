import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:Apptitude_online/services/Models/ImageModel.dart';

class ImagesProvider with ChangeNotifier {
  List images;
  int page;

  ImagesProvider() {
    images = List();
    page = Random().nextInt(50);
    getExploredImages();
  }

  Future<void> getImages(String url, {bool explore = false}) async {
    var response = await http.get(url, headers: {
      'Authorization': 'Client-ID sK0Oe8akONbjf0aqn3DxUQYeTClkBZPkgi4MiCt0snE'
    });

    var data = explore
        ? json.decode(response.body)
        : json.decode(response.body)['results'];

    // print(data);

    for (var d in data) {
      images.add(
        new ImageModel(
          width: d['width'].toDouble(),
          height: d['height'].toDouble(),
          imageUrl: d['urls']['raw'],
        ),
      );
    }
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
