import 'package:flutter/material.dart';
import 'package:shopping/home/short_cut/short_cut_indicator.dart';
import 'package:shopping/home/short_cut/short_cut_scrollview.dart';
import 'package:shopping/model/base_model.dart';

class ShortCut extends StatefulWidget {
  List<BaseModel> shortCutData;

  ShortCut({
    required this.shortCutData,
    Key? key,
  }) : super(key: key);

  @override
  _ShortCutState createState() => _ShortCutState();
}

class _ShortCutState extends State<ShortCut> {
  List<BaseModel> get shortCutData => widget.shortCutData;

  final ValueNotifier<double> _scaling = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _shortCutScrollView(),
        _shortCutIndicator(),
      ],
    );
  }

  Widget _shortCutScrollView() {
    return ShortCutScrollView(
      shortCutData: shortCutData,
      scrollOffset: (offset, maxExtent) {
        _scaling.value = offset / maxExtent;
      },
    );
  }

  Widget _shortCutIndicator() {
    return ValueListenableBuilder(
      valueListenable: _scaling,
      builder: (context, value, child) {
        return ShortCutIndicator(
          value: _scaling.value,
          width: 50,
          height: 6,
          indicatorWidth: 20,
        );
      },
    );
  }
}
