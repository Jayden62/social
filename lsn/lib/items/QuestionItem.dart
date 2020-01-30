import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/CommentComponent.dart';

class QuestionItem extends BaseItem {
  final Function callback;

  QuestionItem({this.callback});

  @override
  Widget onInitItem(BuildContext context) {
    return InkWell(
        onTap: () {},
        highlightColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: margin20),
          padding: EdgeInsets.all(padding10),
          color: whiteColor,
          child: Column(
            children: <Widget>[
              /// User
              _user(),

              /// Question
              _question(),

              /// Comment
              CommentComponent(),
            ],
          ),
        ));
  }

  Widget _question() {
    return Container(
      margin: EdgeInsets.only(top: margin10, left: margin10, right: margin10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /// Question
          Container(
            child: Text(
                'Flutter is cross platform build both Android and iOS, in 2010 it will be the best frame work fot mobile development ? '),
          ),

          /// Category
          Container(
            margin: EdgeInsets.only(top: margin10),
            child: Text(
              'Flutter',
              style: TextStyle(fontSize: font16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _user() {
    return Container(
        margin: EdgeInsets.only(top: margin10, left: margin10, right: margin10),
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
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF-lDV_1qpLFVCmvx9McS9NgbNb8xqL8iBuPORKjLWMvw2Q-AU&s'),
                      )),
                ),

                /// Name
                Container(
                  margin: EdgeInsets.only(left: margin10),
                  child: Text('Name'),
                ),
              ],
            ),

            ///Date submitted
            Container(
              child: Text('2020-2-06 16:44:22'),
            ),
          ],
        ));
  }
}
