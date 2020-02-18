import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/ReplyComponent.dart';
import 'package:intl/intl.dart';

class FeedItem extends BaseItem {
  final Function callback;
  final Function moreOption;
  final Function viewComment;

  FeedItem({this.callback, this.moreOption, this.viewComment});

  @override
  Widget onInitItem(BuildContext context) {
    return InkWell(
        onTap: () {},
        highlightColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: margin10),
          padding: EdgeInsets.all(padding10),
          color: whiteColor,
          child: Column(
            children: <Widget>[
              /// User
              _user(),

              /// Question
              _question(),

              /// Reply
              ReplyComponent(
                onReply: (String text) {
                  print(text);
                },
              ),
            ],
          ),
        ));
  }

  Widget _question() {
    return Container(
      margin: EdgeInsets.only(top: margin10, right: margin10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /// Post
          Container(
            child: Text(
                'Flutter is cross platform build both Android and iOS, in 2010 it will be the best frame work fot mobile development ? '),
          ),

          /// Photo
          Container(
              height: height150,
              margin: EdgeInsets.only(top: margin10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwlwvk3IDwOXiIQ4SVjpbz2rFmmNo2lbhzwp3JtttqJ_EIZWyo')))),

          /// Category
          Container(
            margin: EdgeInsets.only(top: margin10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text('Category : '),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: margin10),
                      child: Text(
                        'Flutter',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () => viewComment(),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: margin3),
                            child:
                                Text('4', style: TextStyle(color: grayColor))),
                        Icon(Icons.chat_bubble, color: grayColor, size: size16),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _user() {
    return Container(
        margin: EdgeInsets.only(top: margin10, right: margin10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Photo
                Container(
                  constraints:
                      BoxConstraints.expand(height: height40, width: width40),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: widthAHalf, color: greyColor),
                      image: DecorationImage(
                        image: AssetImage('assets/images/admin.jpg'),
                      )),
                ),

                Container(
                    margin: EdgeInsets.only(left: margin10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// Name
                        Text('Name'),

                        /// Date submitted
                        Container(
                          child:
                              Text(_parseDateToString(DateTime.now().toUtc())),
                        ),
                      ],
                    )),
              ],
            ),

            /// More options
            InkWell(
              onTap: () => moreOption(),
              child: Container(
                child: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ));
  }

  String _parseDateToString(DateTime dateTime) {
    if (dateTime == null) {
      return '';
    }

    DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    return formatter.format(dateTime);
  }
}
