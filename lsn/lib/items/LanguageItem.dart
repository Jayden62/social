import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/middle/model/LanguageRequest.dart';

class LanguageItem extends BaseItem {
  final LanguageRequest item;

  LanguageItem(this.item);

  @override
  Widget onInitItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// Country name
          Text(item.countryName),

          /// Flag
          Container(
              child: Image.asset(item.flag, height: height18, width: width18)),
        ],
      ),
    );
  }
}
