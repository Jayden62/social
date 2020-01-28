import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class NotificationItem extends BaseItem {
  @override
  Widget onInitItem(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(padding5),
          child: Row(
            children: <Widget>[
              /// Photo
              _photo(),

              /// Description
              _description(),
            ],
          ),
        ));
  }

  Widget _photo() {
    return Container(
      height: height60,
      width: width60,
      margin: EdgeInsets.only(left: margin10, top: margin5, bottom: margin5),
      constraints: BoxConstraints.expand(height: height60, width: width60),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: widthAHalf, color: greyColor),
          image: DecorationImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF-lDV_1qpLFVCmvx9McS9NgbNb8xqL8iBuPORKjLWMvw2Q-AU&s'),
          )),
      child: Image.asset('assets/images/response.png',
          height: height18, width: width18),
    );
  }

  Widget _description() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: margin10),
        child: Row(
          children: <Widget>[
            /// Name
            Text(
              'Jack Le',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            /// User action
            Text(' user action')
          ],
        ),
      ),
    );
  }
}
