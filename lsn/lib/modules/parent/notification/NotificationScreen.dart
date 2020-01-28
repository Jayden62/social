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
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
        ],
      ),
    ));
  }

  Widget _contributors() {
    return Container(
        margin: EdgeInsets.only(top: margin10),
        child: Column(
          children: <Widget>[
            /// Carousel
            CarouselSlider(
              items: [
                ContributorItem(),
                ContributorItem(),
                ContributorItem(),
              ],
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              height: height150,
              onPageChanged: (pageIndex) {
                setState(() {
//                  selectedPromotion = promotions[pageIndex];
                });
              },
            ),

            /// Indicators
//            Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: promotions.map((item) {
//                  /// Out point
//                  return Container(
//                      width: pointSize,
//                      height: pointSize,
//                      margin: EdgeInsets.only(
//                          top: margin10, left: margin5, right: margin5),
//                      decoration: BoxDecoration(
//                          shape: BoxShape.circle, color: darkGrayColor),
//
//                      /// In point
//                      child: Container(
//                        width: pointSize,
//                        height: pointSize,
//                        decoration: BoxDecoration(
//                            shape: BoxShape.circle,
//                            color: selectedPromotion == item
//                                ? Colors.red[400]
//                                : darkGrayColor),
//                      ));
//                }).toList()),
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
