import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class InputSelectComponent extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function onSelect;

  InputSelectComponent({this.textEditingController, this.onSelect});

  @override
  State<StatefulWidget> createState() {
    return _InputSelectComponentState();
  }
}

class _InputSelectComponentState extends State<InputSelectComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onSelect();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
            margin:
                EdgeInsets.only(top: margin20, left: margin20, right: margin20),
            decoration: BoxDecoration(
                border: Border.all(width: widthAHalf, color: greyColor)),
            child: Row(
              children: <Widget>[
                /// Value
                Expanded(
                    child: Container(
                        height: boxHeight,
                        color: whiteColor,
                        margin: EdgeInsets.only(
                          left: margin10,
                        ),
                        child: TextField(
                          style:
                              TextStyle(fontSize: font14, color: greyColor),
                          enabled: false,
                          controller: widget.textEditingController,
                          decoration: InputDecoration(border: InputBorder.none),
                        ))),

                /// Drop down
                Container(
                    margin: EdgeInsets.only(
                      right: margin5,
                    ),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: greyColor,
                    )),
              ],
            )));
  }
}
