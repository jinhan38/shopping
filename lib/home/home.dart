import 'package:flutter/material.dart';
import 'package:shopping/home/banner/event_banner.dart';
import 'package:shopping/home/home_res.dart';
import 'package:shopping/home/product/product_list.dart';
import 'package:shopping/home/product/product_model.dart';
import 'package:shopping/home/short_cut/short_cut.dart';
import 'package:shopping/model/base_model.dart';

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
        _eventBanner(images),
        _shortCut(),
        const SizedBox(height: 20),
        _productListVertical(),
        const SizedBox(height: 20),
        _productListTwo(),
      ],
    );
  }

  Widget _eventBanner(List<Widget> images) => EventBanner(
      height: 200,
      itemCount: images.length,
      itemBuilder: (index) => images[index]);

  Widget _shortCut() => ShortCut(
        shortCutData: HomeRes.shortCutData,
        onTap: (id) {
          print('short cut id : $id');
        },
      );

  Widget _productListVertical() => ProductList(
        productData: HomeRes.productTempData,
        productSpan: ProductSpan.one,
        onTap: (id) {
          print('product id : $id');
        },
      );

  Widget _productListTwo() => ProductList(
        productData: HomeRes.productTempData,
        productSpan: ProductSpan.two,
        onTap: (id) {
          print('product id : $id');
        },
      );
}
