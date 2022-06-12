import 'package:flutter/material.dart';
import 'package:shopping/home/short_cut/short_cut_indicator.dart';
import 'package:shopping/home/short_cut/short_cut_scrollview.dart';
import 'package:shopping/model/base_model.dart';

class ShortCut extends StatefulWidget {
  List<BaseModel> shortCutData;
  Function(int id) onTap;

  ShortCut({
    required this.shortCutData,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _ShortCutState createState() => _ShortCutState();
}

class _ShortCutState extends State<ShortCut> {
  List<BaseModel> get shortCutData => widget.shortCutData;

  Function(int id) get onTap => widget.onTap;

  final ValueNotifier<double> _scaling = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _shortCutScrollView(),
        const SizedBox(height: 4),
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
      onTap: onTap,
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
