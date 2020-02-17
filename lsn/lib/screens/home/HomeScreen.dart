import 'package:badges/badges.dart';
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
        screen: Screens.ADD_TOPIC,
      ),
      BaseWidget(
        screen: Screens.NOTIFICATION,
      ),
      BaseWidget(
        screen: Screens.PROFILE,
      ),
    ];

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
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
        /// Feed
        BottomNavyBarItem(
            title: Text('Feed'),
            icon: Icon(Icons.dehaze),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal),


        /// Add topic
        BottomNavyBarItem(
            title: Text('Add topic'),
            icon: Icon(Icons.edit),
            activeColor: Colors.teal,
            inactiveColor: Colors.teal),

        /// Notification
        BottomNavyBarItem(
            title: Text('Notification'),
            icon: Badge(
                badgeContent: Text('0',
                    style: TextStyle(fontSize: font10, color: whiteColor)),
                padding: EdgeInsets.all(padding3),
                child: Container(child: Icon(Icons.notifications))),
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
