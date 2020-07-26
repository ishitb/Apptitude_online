import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:Apptitude_online/services/Models/ImageModel.dart';

class ImagesProvider with ChangeNotifier {
  List images;

  ImagesProvider() {
    images = List();
  }

  List getImages() {
    return images;
  }

  void resetImages() {
    images = [];
    notifyListeners();
  }

  Future<void> getExploredImages(int page) async {
    String url = 'https://api.unsplash.com/photos?page=$page';

    var response = await http.get(url, headers: {
      'Authorization': 'Client-ID sK0Oe8akONbjf0aqn3DxUQYeTClkBZPkgi4MiCt0snE'
    });

    var data = json.decode(response.body);

    for (var d in data) {
      images.add(
        new ImageModel(
          width: d['width'].toDouble(),
          height: d['height'].toDouble(),
          imageUrl: d['urls']['raw'],
        ),
      );
    }
    notifyListeners();
  }

  Future<void> wordSearchImage(List words, int page) async {
    String searchTerms = "";
    for (var word in words) {
      searchTerms += word + ',';
    }

    String url =
        'https://api.unsplash.com/search/photos?page=$page&query=$searchTerms';

    var response = await http.get(url, headers: {
      'Authorization': 'Client-ID sK0Oe8akONbjf0aqn3DxUQYeTClkBZPkgi4MiCt0snE'
    });

    var data = json.decode(response.body)['results'];

    for (var d in data) {
      images.add(
        new ImageModel(
          width: d['width'].toDouble(),
          height: d['height'].toDouble(),
          imageUrl: d['urls']['raw'],
        ),
      );
    }
    notifyListeners();
  }
}
