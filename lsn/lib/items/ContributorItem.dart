import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class ContributorItem extends BaseItem {
  @override
  Widget onInitItem(BuildContext context) {
    return Card(
        elevation: elevation4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius10))),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF-lDV_1qpLFVCmvx9McS9NgbNb8xqL8iBuPORKjLWMvw2Q-AU&s')))));
  }
}
