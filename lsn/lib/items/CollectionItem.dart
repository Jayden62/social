import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class CollectionItem extends BaseItem {
  @override
  Widget onInitItem(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: margin20, bottom: margin10),
        constraints: BoxConstraints.expand(height: height150, width: width150),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius8)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwlwvk3IDwOXiIQ4SVjpbz2rFmmNo2lbhzwp3JtttqJ_EIZWyo'))),
        child: Container(
          margin: EdgeInsets.only(top: margin5),
          child: Text(
            'My collection',
            style: TextStyle(fontSize: font16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
