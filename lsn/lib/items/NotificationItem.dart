import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lsn/base/item/BaseItem.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class NotificationItem extends BaseItem {
  final Function(bool value) callback;

  NotificationItem({this.callback});

  /// Detect swipe
//  final SlidableController slidableController =
//      SlidableController(onSlideIsOpenChanged: handleSlideIsOpenChanged);

//  Color _fabColor;
//
//  static void handleSlideIsOpenChanged(bool isOpen) {
//    setState(() {
//      _fabColor = isOpen ? whiteColor : greyColor
//    });
//
//  }

  @override
  Widget onInitItem(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
//      controller: slidableController,
      child: Container(
          padding: EdgeInsets.all(padding5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Photo
              _photo(),

              /// Description
              _description(),
            ],
          )),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.indigo,
          icon: Icons.delete,
          onTap: () => {},
        ),
      ],
    );
  }

  Widget _photo() {
    return Container(

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
