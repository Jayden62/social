import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class ContributorComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContributorComponentState();
}

class _ContributorComponentState extends State<ContributorComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height60,
      width: width60,
      margin: EdgeInsets.only( left: margin10),
      decoration: BoxDecoration(
          border: Border.all(width: width1, color: whiteColor),
          shape: BoxShape.circle),
    );
  }
}
