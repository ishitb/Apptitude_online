class ImageModel {
  String imageUrl;
  double width, height;

  ImageModel({this.width, this.height, this.imageUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
