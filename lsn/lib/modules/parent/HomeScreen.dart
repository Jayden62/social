import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class HomeScreen extends BaseScreen {
  var _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget onInitBody(BuildContext context) {
    List<Widget> pages = [
      BaseWidget(
        screen: Screens.FEED,
      ),
      BaseWidget(
        screen: Screens.TECH_NEWS,
      ),
      BaseWidget(
        screen: Screens.PROFILE,
      ),
    ];

    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() => _currentIndex = index);
      },
      children: pages,
    );
  }

  @override
  Widget onInitBottomNavigationBar(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      onItemSelected: (index) {
        setState(() => _currentIndex = index);
        _pageController.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        /// Home
        BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal),

        /// Tech news
        BottomNavyBarItem(
            title: Text('Tech news'),
            icon: Icon(Icons.zoom_out_map),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal),

        /// Profile
        BottomNavyBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.account_circle),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal),
      ],
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    /// Default appbar is transparent.
    return PreferredSize(
        preferredSize: Size.fromHeight(height0),
        child: AppBar(
          backgroundColor: appBarColor,
          elevation: elevation0,
        ));
  }
}
