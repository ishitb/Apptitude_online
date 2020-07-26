import 'dart:io';
import 'package:Apptitude_online/UI/pages/imageView.dart';
import 'package:Apptitude_online/services/connectivity/connectivityService.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:Apptitude_online/services/ObjectDetection/Detection.dart';
import 'package:Apptitude_online/services/NavigationProviders/ImagesProvider.dart';

class Explore extends StatefulWidget {
  final String title;
  Explore({this.title});
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<String> searchterms;
  String _searchText = "";
  @override
  void initState() {
    if (widget.title != null) {
      setState(() {
        _searchText = widget.title;
        print(_searchText);
      });
    }
    super.initState();
  }

  @override
  void didUpdateWidget(Explore oldWidget) {
    if (widget.title != null) {
      setState(() {
        _searchText = widget.title;
        print(_searchText);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  final picker = ImagePicker();
  bool _imageFromCamera = true;
  Detection objectDetector = Detection();

  @override
  Widget build(BuildContext context) {
    print(_searchText);
    final ImagesProvider imagesProvider = Provider.of<ImagesProvider>(context);
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
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
                  child: TextFormField(
                    initialValue: _searchText,
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
            searchterms == null
                ? Container()
                : Row(
                    children: searchterms
                        .map((pill) => Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Text(
                                pill,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
            connectionStatus == ConnectivityStatus.Online
                ? Expanded(
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
                                    height:
                                        imagesProvider.images[index].height /
                                            10,
                                    width:
                                        imagesProvider.images[index].width / 10,
                                    child: GestureDetector(
                                      onLongPress: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return imageView(
                                                imgURL: imagesProvider
                                                    .images[index]
                                                    .fullImageURL);
                                          },
                                        );
                                      },
                                      child: FadeInImage.assetNetwork(
                                        placeholderScale: 0.2,
                                        placeholder: 'assets/utils/Eclipse.gif',
                                        image: imagesProvider
                                            .images[index].imageUrl,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  )
                : Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            child: FlareActor('assets/emptyFlare.flr',
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: "empty"),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    setState(() {
      searchterms = labels;
    });
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
