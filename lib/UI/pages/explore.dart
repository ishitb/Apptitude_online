import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Apptitude_online/services/Providers/ImagesProvider.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    final ImagesProvider imagesProvider = Provider.of<ImagesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Search for high quality images from the web!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blueGrey,
                  ),
                  border: InputBorder.none,
                  hintText: "Search a keyword",
                  hintStyle: TextStyle(
                    height: 1.5,
                  ),
                  suffixIcon: _searchText == ""
                      ? null
                      : IconButton(
                          onPressed: () {
                            imagesProvider.resetImages();
                            imagesProvider.wordSearchImage([_searchText], 1);
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: imagesProvider.images.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(
                        imagesProvider.images.length,
                        (index) {
                          return Center(
                            child: Container(
                              height: imagesProvider.images[index].height / 10,
                              width: imagesProvider.images[index].width / 10,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/utils/loading.gif',
                                image: imagesProvider.images[index].imageUrl,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          imagesProvider.resetImages();
          imagesProvider.getExploredImages(4);
        },
        child: Icon(Icons.get_app),
      ),
    );
  }
}
