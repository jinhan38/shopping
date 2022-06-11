import 'package:flutter/material.dart';
import 'package:shopping/home/product/product_model.dart';

class ProductItem extends StatelessWidget {
  ProductModel productModel;
  Function(int id) onTap;

  ProductItem({
    required this.productModel,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(productModel.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 이미지
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
          ),
          const SizedBox(height: 2),

          /// 제품 이름
          Text(productModel.name, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 2),

          /// 가격, 할인률
          Row(
            children: [
              Text("${productModel.discount}%",
                  style: const TextStyle(color: Colors.red)),
              const SizedBox(width: 4),
              Text(productModel.price.toString()),
            ],
          ),
          const SizedBox(height: 2),

          /// 리뷰 개수
          Text("리뷰 ${productModel.reviewCount}개"),
        ],
      ),
    );
  }
}
