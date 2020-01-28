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
      child: ListView(
        children: <Widget>[
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
        ],
      ),
    );
  }

  Widget _contributors() {
    return Container(
        constraints: BoxConstraints.expand(height: height120),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.teal[200],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius50),
                bottomRight: Radius.circular(radius50))),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: margin10),
              child: Text('Top contributors',
                  style: TextStyle(
                      fontSize: font18,
                      color: whiteColor,
                      fontStyle: FontStyle.italic)),
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ContributorComponent(),
                ContributorComponent(),
                ContributorComponent(),
              ],
            )),
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
