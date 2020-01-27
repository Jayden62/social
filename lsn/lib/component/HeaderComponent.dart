import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class HeaderComponent extends StatelessWidget {
  final Function onRight;
  final Widget rightIcon;
  final String title;

  HeaderComponent({
    @required this.title,
    this.onRight,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: Colors.teal[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              splashColor: whiteColor,
              highlightColor: whiteColor,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: EdgeInsets.only(left: margin10),
                  child: Icon(
                    Icons.navigate_before,
                    color: whiteColor,
                  ))),
          Text(
            title,
            style: TextStyle(color: whiteColor, fontSize: font16),
          ),
          InkWell(
              splashColor: whiteColor,
              highlightColor: whiteColor,
              onTap: () {
                onRight();
              },
              child: Container(
                  margin: EdgeInsets.only(right: margin10), child: rightIcon)),
        ],
      ),
    );
  }
}
