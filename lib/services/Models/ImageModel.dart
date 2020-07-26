class ImageModel {
  String imageUrl, fullImageURL;
  double width, height;

  ImageModel({this.width, this.height, this.imageUrl, this.fullImageURL});

  ImageModel.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    imageUrl = json['imageUrl'];
    fullImageURL = json['fullImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
