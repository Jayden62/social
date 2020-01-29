import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class ContributorItem extends BaseItem {
  @override
  Widget onInitItem(BuildContext context) {
    return Container(
        height: height120,
        width: width100,
        margin:
            EdgeInsets.only(left: margin10, top: margin10, bottom: margin10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius8)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF-lDV_1qpLFVCmvx9McS9NgbNb8xqL8iBuPORKjLWMvw2Q-AU&s'))));
  }
}
