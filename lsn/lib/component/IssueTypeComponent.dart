import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class IssueTypeComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IssueTypeComponentState();
}

class _IssueTypeComponentState extends State<IssueTypeComponent> {
  @override
  Widget build(BuildContext context) {
    return ConfigurableExpansionTile(
        initiallyExpanded: false,
        animatedWidgetFollowingHeader:
            Icon(Icons.expand_more, color: whiteColor),
        headerExpanded: Flexible(
            child: Container(
                padding: EdgeInsets.all(padding10),
                alignment: Alignment.center,
                child: Text(
                  'test',
                  style: TextStyle(color: whiteColor, fontSize: font16),
                ))),
        header: Flexible(
            child: Container(
                padding: EdgeInsets.all(padding10),
                alignment: Alignment.center,
                child: Text('test',
                    style: TextStyle(color: whiteColor, fontSize: font16)))),
        headerBackgroundColorStart: Colors.brown[300],
        headerBackgroundColorEnd: Colors.brown[300],
        children: [
          Container(
            height: 50,
            color: redColor,
          )
        ]);
  }
}
