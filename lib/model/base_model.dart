class BaseModel {
  int id;
  String image;
  String name;

  BaseModel({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  String toString() {
    return "id : $id, image : $image, name : $name";
  }
}