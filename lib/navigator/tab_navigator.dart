import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/home_page.dart';
import '../pages/category_page.dart';
import '../pages/cart_page.dart';
import '../pages/my_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  PageController _pageController;
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MyPage()
  ];

  final List<BottomNavigationBarItem> _bottomBars = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的"))
  ];

  int _currentIndex = 0;

  var _currentPage;

  @override
  void initState() {
    _currentPage = _pages[_currentIndex];
    _pageController = new PageController()
      ..addListener(() {
        if (_currentPage != _pageController.page.round()) {
          setState(() {
            _currentPage = _pageController.page.round();
          });
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomBars,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _currentPage = _pages[_currentIndex];
          });
        },
      ),
      body: IndexedStack(
        children: _pages,
        index: _currentIndex,
      ),
    );
  }
}
