import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/res/physics.dart';

import 'banner_indicator.dart';

class EventBanner extends StatefulWidget {
  double height;
  int itemCount;
  Widget Function(int index) itemBuilder;

  EventBanner({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  _EventBannerState createState() => _EventBannerState();
}

class _EventBannerState extends State<EventBanner> {
  double get height => widget.height;

  int get itemCount => widget.itemCount;

  Widget Function(int index) get itemBuilder => widget.itemBuilder;

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: itemCount * 50);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return SizedBox(height: height);
    }
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          _imagePageView(),
          _bannerIndicator(),
        ],
      ),
    );
  }

  Widget _imagePageView() => PageView(
        controller: _pageController,
        onPageChanged: (index) => _currentIndex.value = index % itemCount,
        physics: physics.COMMON_PHYSICS,
        children: List.generate(
            itemCount * 100, (index) => itemBuilder(index % itemCount)),
      );

  Widget _bannerIndicator() => Positioned(
        right: 10,
        bottom: 10,
        child: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, value, child) {
            return BannerIndicator(currentIndex: value + 1, length: itemCount);
          },
        ),
      );
}
