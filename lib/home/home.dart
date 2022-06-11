import 'package:flutter/material.dart';
import 'package:shopping/home/banner/event_banner.dart';
import 'package:shopping/home/product/product_list.dart';
import 'package:shopping/home/product/product_model.dart';
import 'package:shopping/home/short_cut/short_cut.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> images = [
    Container(color: Colors.greenAccent),
    Container(color: Colors.orange),
    Container(color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      children: [
        /// 이벤트 배너
        _eventBanner(images),

        /// shortCut
        _shortCut(),

        const SizedBox(height: 20),

        _productListVertical(),
        const SizedBox(height: 20),
        _productListTwo(),
      ],
    );
  }

  /// 이벤트 배너
  Widget _eventBanner(List<Widget> images) => EventBanner(
      height: 200,
      itemCount: images.length,
      itemBuilder: (index) => images[index]);

  /// shortCut
  Widget _shortCut() => ShortCut(shortCutData: []);

  Widget _productListVertical() => ProductList(
        productData: _productTempData,
        productSpan: ProductSpan.one,
        onTap: (id) {
          print('id : $id');
        },
      );

  Widget _productListTwo() => ProductList(
        productData: _productTempData,
        productSpan: ProductSpan.two,
        onTap: (id) {
          print('id : $id');
        },
      );

  final List<ProductModel> _productTempData = [
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
