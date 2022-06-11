import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/home/product/product_item.dart';
import 'package:shopping/home/product/product_model.dart';

enum ProductSpan { one, two }

class ProductList extends StatelessWidget {
  List<ProductModel> productData;
  ProductSpan productSpan;
  Function(int id) onTap;

  ProductList({
    required this.productData,
    required this.onTap,
    this.productSpan = ProductSpan.one,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productSpan == ProductSpan.two) {
      return _spanTwo();
    }
    return _spanOne();
  }

  Widget _spanOne() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productData.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ProductItem(
            productModel: productData[index],
            onTap: (id) => onTap(id),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }

  Widget _spanTwo() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (productData.length / 2).ceil(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: ProductItem(
                productModel: productData[index * 2],
                onTap: (id) => onTap(id),
              ),
            ),
            const SizedBox(width: 10),
            if (index * 2 + 1 < productData.length) ...[
              Expanded(
                child: ProductItem(
                  productModel: productData[index * 2 + 1],
                  onTap: (id) => onTap(id),
                ),
              ),
            ] else ...[
              const Expanded(child: SizedBox()),
            ],
            const SizedBox(width: 10),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}
