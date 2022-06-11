import 'package:shopping/model/base_model.dart';

class ProductModel extends BaseModel {
  int price;
  int discount;
  int reviewCount;

  ProductModel({
    required super.id,
    required super.image,
    required super.name,
    required this.price,
    required this.discount,
    required this.reviewCount,
  });

  @override
  String toString() {
    return "ProductModel(${super.toString()}, "
        "price : $price, discount : $discount, reviewCount : $reviewCount)";
  }
}
