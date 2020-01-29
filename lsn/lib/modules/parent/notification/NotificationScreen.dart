import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/items/ContributorItem.dart';
import 'package:lsn/items/NotificationItem.dart';

class NotificationScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Contributors
        _contributors(),

        /// Notifications
        _notifications(),
      ],
    );
  }

  Widget _notifications() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: margin10),
      child: ListView(
        children: <Widget>[
          NotificationItem(
            callback: (bool value) {},
          ),
          NotificationItem(),
          NotificationItem(),
        ],
      ),
    ));
  }

  Widget _contributors() {
    return Container(
        height: height150,
        color: Colors.grey[200],
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ContributorItem(),
            ContributorItem(),
            ContributorItem(),
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
