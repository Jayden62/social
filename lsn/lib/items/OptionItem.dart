import 'package:flutter/material.dart';
import 'package:lsn/api/result/Option.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class OptionItem extends BaseItem {
  final Function(Option item) callback;
  final Option item;

  OptionItem(this.item, {this.callback});

  @override
  Widget onInitItem(BuildContext context) {
    return InkWell(
        onTap: () {
          callback(item);
        },
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: margin10),
                  child: item.icon,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(padding10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: double.maxFinite, child: Text(item.title)),
                          Container(
                              margin: EdgeInsets.only(top: margin5),
                              width: double.maxFinite,
                              child: Text(item.subTitle,
                                  style: TextStyle(
                                      fontSize: font12, color: grayColor))),
                        ],
                      )),
                ),
              ],
            ),
            Divider(color: greyColor, height: 0.0)
          ],
        )));
  }
}
