import 'package:flutter/material.dart';
import '../../../model/base_model.dart';

class ShortCutScrollView extends StatefulWidget {
  List<BaseModel> shortCutData;

  Function(double offset, double maxScrollExtent) scrollOffset;

  ShortCutScrollView({
    required this.shortCutData,
    required this.scrollOffset,
    Key? key,
  }) : super(key: key);

  @override
  State<ShortCutScrollView> createState() => _ShortCutScrollViewState();
}

class _ShortCutScrollViewState extends State<ShortCutScrollView> {
  List<BaseModel> get shortCutData => widget.shortCutData;

  Function(double offset, double maxScrollExtent) get scrollOffset =>
      widget.scrollOffset;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.hasClients) {
          scrollOffset(_scrollController.offset,
              _scrollController.position.maxScrollExtent);
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                  children: List.generate(
                      10, (index) => _listItem("", "sodyasdfasdf"))),
              const SizedBox(height: 4),
              Row(
                  children: List.generate(
                      10, (index) => _listItem("", "sodyasdfasdf"))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem(String image, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 50, height: 50, color: Colors.grey),
        const SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}
