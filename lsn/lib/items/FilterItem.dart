import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class FilterItem extends BaseItem {
  final Function onFilter;
  final String text;

  FilterItem({this.onFilter, @required this.text});

  @override
  Widget onInitItem(BuildContext context) {
    return InkWell(
        onTap: () {
          onFilter(text);
        },
        child: Container(
          color: Colors.white54,
            child: Column(
          children: <Widget>[
            Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: EdgeInsets.all(padding15),
                child: Text(text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))),
            Divider(color: greyColor, height: 0.0)
          ],
        )));
  }
}
