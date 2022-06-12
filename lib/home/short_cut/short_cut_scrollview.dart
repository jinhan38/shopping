import 'package:flutter/material.dart';
import 'package:shopping/res/style.dart';
import '../../../model/base_model.dart';

class ShortCutScrollView extends StatefulWidget {
  List<BaseModel> shortCutData;

  Function(double offset, double maxScrollExtent) scrollOffset;
  Function(int id) onTap;

  ShortCutScrollView({
    required this.shortCutData,
    required this.scrollOffset,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<ShortCutScrollView> createState() => _ShortCutScrollViewState();
}

class _ShortCutScrollViewState extends State<ShortCutScrollView> {
  List<BaseModel> get shortCutData => widget.shortCutData;

  Function(double offset, double maxScrollExtent) get scrollOffset =>
      widget.scrollOffset;

  Function(int id) get onTap => widget.onTap;

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
                  (shortCutData.length / 2).floor(),
                  (index) {
                    return _listItem(shortCutData[index]);
                  },
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: List.generate(
                  (shortCutData.length / 2).floor(),
                  (index) {
                    int i = index + (shortCutData.length / 2).floor();
                    return _listItem(shortCutData[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem(BaseModel baseModel) {
    return OutlinedButton(
      style: style.outline,
      onPressed: () => onTap(baseModel.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 50,
              height: 50,
              child: Image.asset(baseModel.image),
            ),
            Text(
              baseModel.name,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
