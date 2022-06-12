
import 'package:shopping/home/product/product_model.dart';

import '../model/base_model.dart';

class HomeRes{

  static final List<BaseModel> shortCutData = [
    BaseModel(id: 1, image: "assets/shortcut/shirt.png", name: "티셔츠"),
    BaseModel(id: 2, image: "assets/shortcut/pants.png", name: "바지"),
    BaseModel(id: 3, image: "assets/shortcut/skirt.png", name: "스커트"),
    BaseModel(id: 4, image: "assets/shortcut/bag.png", name: "가방"),
    BaseModel(id: 5, image: "assets/shortcut/cap.png", name: "잡화"),
    BaseModel(id: 6, image: "assets/shortcut/jewelry.png", name: "장신구"),
    BaseModel(id: 7, image: "assets/shortcut/present.png", name: "선물"),
    BaseModel(id: 8, image: "assets/shortcut/shoes.png", name: "신발"),
    BaseModel(id: 9, image: "assets/shortcut/smartphone.png", name: "핸드폰"),
    BaseModel(id: 10, image: "assets/shortcut/underwear.png", name: "속옷"),
    BaseModel(id: 11, image: "assets/shortcut/flower.png", name: "꽃"),
    BaseModel(id: 12, image: "assets/shortcut/pet.png", name: "반려동물"),
  ];

  static final List<ProductModel> productTempData = [
    ProductModel(
        id: 1,
        image: "",
        name: "제품 1",
        price: 10000,
        discount: 10,
        reviewCount: 10),
    ProductModel(
        id: 2,
        image: "",
        name: "제품 2",
        price: 20000,
        discount: 20,
        reviewCount: 20),
    ProductModel(
        id: 3,
        image: "",
        name: "제품 3",
        price: 30000,
        discount: 30,
        reviewCount: 30),
    ProductModel(
        id: 4,
        image: "",
        name: "제품 4",
        price: 40000,
        discount: 40,
        reviewCount: 40),
    ProductModel(
        id: 5,
        image: "",
        name: "제품 5",
        price: 50000,
        discount: 50,
        reviewCount: 50),
    ProductModel(
        id: 6,
        image: "",
        name: "제품 6",
        price: 60000,
        discount: 60,
        reviewCount: 60),
    ProductModel(
        id: 7,
        image: "",
        name: "제품 7",
        price: 70000,
        discount: 70,
        reviewCount: 70),
  ];
}