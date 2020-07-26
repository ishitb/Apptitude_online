import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:Apptitude_online/services/ObjectDetection/Detection.dart';
import 'package:Apptitude_online/services/NavigationProviders/ImagesProvider.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String _searchText = "";
  final picker = ImagePicker();
  bool _imageFromCamera = true;
  Detection objectDetector = Detection();

  @override
  Widget build(BuildContext context) {
    final ImagesProvider imagesProvider = Provider.of<ImagesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
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
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    showBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[700].withOpacity(0.4),
                                  spreadRadius:
                                      MediaQuery.of(context).size.height,
                                  blurRadius: 50.0,
                                )
                              ],
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _getImageThroughCamera(imagesProvider);
                                    },
                                    color: Theme.of(context).primaryColorLight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: Row(children: [
                                        Icon(
                                          Icons.camera_enhance,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Take image from camera",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _getImageThroughGallery(imagesProvider);
                                    },
                                    color: Theme.of(context).primaryColorLight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: Row(children: [
                                        Icon(
                                          Icons.image,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Take image from gallery",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                    // await _getImageThroughGallery(imagesProvider);
                  },
                  child: Container(
                    // padding: EdgeInsets.all(10.0),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.file_upload,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
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
                                FocusScope.of(context).unfocus();
                                imagesProvider.wordSearchImage([_searchText]);
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
              ],
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
          imagesProvider.getExploredImages();
        },
        child: Icon(Icons.get_app),
      ),
    );
  }

  Future<void> _searchByImage(File image, ImagesProvider imagesProvider) async {
    List<String> labels;
    await objectDetector.getLabels(image).then((value) {
      labels = value;
    });
    imagesProvider.wordSearchImage(labels);
  }

  Future _getImageThroughCamera(ImagesProvider imagesProvider) async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image != null) {
      _searchByImage(File(image.path), imagesProvider);
    }
  }

  Future _getImageThroughGallery(ImagesProvider imagesProvider) async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      _searchByImage(File(image.path), imagesProvider);
    }
  }
}
