import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class Option {
  final Icon icon;
  final String title;
  final String subTitle;

  Option({this.icon, this.title, this.subTitle});

  List<Option> addData() {
    List<Option> options = [
      Option(
        icon: Icon(
          Icons.notifications_off,
          color: grayColor,
        ),
        title: 'Turn off notification for this post.',
        subTitle: 'Long a week',
      ),
      Option(
          icon: Icon(Icons.archive, color: grayColor),
          title: 'Hide this post',
          subTitle: 'See fewer posts like this'),
      Option(
          icon: Icon(Icons.report_off, color: grayColor),
          title: 'Report to admin',
          subTitle: 'This post maybe remove.'),
    ];

    return options;
  }
}
