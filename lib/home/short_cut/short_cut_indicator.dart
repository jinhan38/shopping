import 'package:flutter/material.dart';

class ShortCutIndicator extends StatelessWidget {
  double width;
  double height;
  double indicatorWidth;
  double value;

  ShortCutIndicator({
    required this.width,
    required this.height,
    required this.value,
    required this.indicatorWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(height / 2)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: _calcLeft(),
            bottom: 0,
            child: Container(
              width: indicatorWidth,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(height / 2)),
            ),
          )
        ],
      ),
    );
  }

  double _calcLeft() => (width - indicatorWidth) * value;
}
