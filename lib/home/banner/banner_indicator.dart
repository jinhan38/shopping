import 'package:flutter/material.dart';

class BannerIndicator extends StatelessWidget {
  int currentIndex;
  int length;

  BannerIndicator({
    required this.currentIndex,
    required this.length,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)),
      child: Text("$currentIndex / $length"),
    );
  }
}
