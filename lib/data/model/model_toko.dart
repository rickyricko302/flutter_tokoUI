class ModelToko {
  String? name, image;
  int? id;
  ModelToko(this.name, this.image);

  ModelToko.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    id = json['id'];
  }
}
