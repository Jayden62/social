import 'package:cached_network_image/cached_network_image.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:intl/intl.dart';
import 'package:lsn/component/ReplyComponent.dart';

class PostItem extends BaseItem {
  @override
  Widget onInitItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin10, left: margin10, right: margin10),
      child: Column(
        children: <Widget>[
          /// Photo
          Container(
            height: height150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius8)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwlwvk3IDwOXiIQ4SVjpbz2rFmmNo2lbhzwp3JtttqJ_EIZWyo'))),
          ),

          Container(
            margin: EdgeInsets.only(top: margin10),
            child: Text(
                'Như vậy, sau hai tháng xảy ra mâu thuẫn, dẫn đến tan rã, cả Jack và K-ICM đều nhanh chóng bắt tay vào '),
          ),

          /// Hearty
          Container(
            margin: EdgeInsets.only(top: margin20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red[600],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: margin2),
                      child: Text(
                        '3',
                        style: TextStyle(
                            color: Colors.red[600], fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                /// Comments
                Container(
                  child: Text(' 15 comments'),
                ),
              ],
            ),
          ),


          /// Response
          ReplyComponent(
            onReply: (String text) {
              print(text);
            },
          ),
        ],
      ),
    );
  }

  String _parseDateToString(DateTime dateTime) {
    if (dateTime == null) {
      return '';
    }

    DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    return formatter.format(dateTime);
  }
}
