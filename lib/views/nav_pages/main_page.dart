import 'package:flutter/material.dart';
import 'package:travel_app/views/nav_pages/home_page/home_page.dart';
import 'package:travel_app/views/nav_pages/bar_item_page.dart';
import 'package:travel_app/views/nav_pages/my_page.dart';
import 'package:travel_app/views/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.pageIndex = 0}) : super(key: key);
  final int pageIndex;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.pageIndex;
  }

  final List _pages = [HomePage(), BarItemPage(), SearchPage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: (int index) {
            setState(() {
              _currentIndex = index++;
            });
          },
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.4),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedFontSize: 0.0,
          selectedFontSize: 0.0,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "My", icon: Icon(Icons.person))
          ]),
    );
  }
}
