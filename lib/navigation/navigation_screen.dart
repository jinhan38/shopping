import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  static const List<Icon> baseIcons = [
    Icon(Icons.home_rounded),
    Icon(Icons.list_rounded),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: _pages[value]),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => _currentIndex.value = index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: value,
            items: List.generate(baseIcons.length,
                (index) => _navigationBarItem(baseIcons[index])),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _navigationBarItem(Icon icon) {
    return BottomNavigationBarItem(icon: icon, label: "");
  }

  final List<Widget> _pages = [
     Home(),
    Container(color: Colors.red),
    Container(color: Colors.purple),
  ];
}
