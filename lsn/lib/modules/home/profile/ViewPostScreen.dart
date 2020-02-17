import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/HeaderComponent.dart';

class ViewPostScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// HeaderComponent
        HeaderComponent(
          title: 'All posts',
          rightIcon: Icon(Icons.refresh, color: whiteColor),
          onRight: () {},
        ),

        /// Posts
        _posts(),
      ],
    );
  }

  Widget _posts() {
    return Expanded(
        child: ListView(
      children: <Widget>[
        Container(
          height: 100,
          margin: EdgeInsets.only(top: margin10),
          color: purpleColor,
        ),
        Container(
          height: 100,
          margin: EdgeInsets.only(top: margin10),
          color: purpleColor,
        ),
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
