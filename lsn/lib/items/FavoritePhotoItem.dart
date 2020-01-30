import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class FavoritePhotoItem extends BaseItem {
  @override
  Widget onInitItem(BuildContext context) {
    return Container(
      width: width150,
      margin: EdgeInsets.only(left: margin20,bottom: margin10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius10)),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvxzwGTYl4NmHWLfPRZvVbUOrkQutr6gmGVVn4385e_FyXUBRE&s')),
      ),
    );
  }
}
