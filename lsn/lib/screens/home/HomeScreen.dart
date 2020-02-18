import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class HomeScreen extends BaseScreen with SingleTickerProviderStateMixin {
  var _pageController = PageController();
  TabController _tabController;

  static const int FEED_PAGE = 0;
  static const int NOTIFICATION_PAGE = 1;
  static const int PROFILE_PAGE = 2;

  Color _feedColor = Colors.teal;
  Color _notificationColor;
  Color _profileColor;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
        screen: Screens.NOTIFICATION,
      ),
      BaseWidget(
        screen: Screens.PROFILE,
      ),
    ];

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: pages,
    );
  }

  @override
  Widget onInitBottomNavigationBar(BuildContext context) {
    return Container(
        decoration: _tabDecoration,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.teal,
          indicator: _tabIndicator,
          onTap: (int index) {
            /// Feed page
            if (FEED_PAGE == index) {
              setState(() {
                _feedColor = Colors.teal;
                _notificationColor = Colors.grey;
                _profileColor = Colors.grey;
              });
              _pageController.jumpToPage(FEED_PAGE);
            }

            /// Notification page
            if (NOTIFICATION_PAGE == index) {
              setState(() {
                _feedColor = Colors.grey;
                _notificationColor = Colors.teal;
                _profileColor = Colors.grey;
              });
              _pageController.jumpToPage(NOTIFICATION_PAGE);
            }

            /// Profile page
            if (PROFILE_PAGE == index) {
              setState(() {
                _feedColor = Colors.grey;
                _notificationColor = Colors.grey;
                _profileColor = Colors.teal;
              });
              _pageController.jumpToPage(PROFILE_PAGE);
            }
          },
          tabs: [
            Tab(
              icon: Icon(
                Icons.public,
                color: _feedColor,
              ),
            ),
            Tab(
              icon: Badge(
                  badgeContent: Text('0',
                      style: TextStyle(fontSize: font10, color: whiteColor)),
                  padding: EdgeInsets.all(padding3),
                  child: Container(
                      child: Icon(
                    Icons.notifications,
                    color: _notificationColor,
                  ))),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: _profileColor,
              ),
            )
          ],
        ));
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

var _tabIndicator = UnderlineTabIndicator(
    borderSide: BorderSide(color: Colors.teal, width: 2.0),
    insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 46.0));
var _tabDecoration =
    BoxDecoration(color: Colors.white, boxShadow: [_tabBoxShadow]);
var _tabBoxShadow =
    BoxShadow(color: Colors.black, offset: Offset(0.0, 5.0), blurRadius: 5.0);
