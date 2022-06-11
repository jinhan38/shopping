import 'package:flutter/material.dart';

import 'widgets/banner/event_banner.dart';

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
      children: [
        /// 이벤트 배너
        _eventBanner(images),
      ],
    );
  }

  /// 이벤트 배너
  Widget _eventBanner(List<Widget> images) => EventBanner(
      height: 200,
      itemCount: images.length,
      itemBuilder: (index) => images[index]);
}
