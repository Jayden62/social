import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class InputSelectComponent extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  final Function onSelect;

  InputSelectComponent({this.label, this.textEditingController, this.onSelect});

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
        child: Container(
            margin:
                EdgeInsets.only(top: margin20, left: margin20, right: margin20),
            child: Row(
              children: <Widget>[
                /// Value
                Expanded(
                    child: Container(
                        height: boxHeight,
                        color: whiteColor,
                        child: TextField(
                          enabled: false,
                          controller: widget.textEditingController,
                          decoration: InputDecoration(
                            border: defaultBox,
                            enabledBorder: defaultBox,
                            focusedBorder: focusBox,
                            contentPadding: paddingBox,
                          ),
                        ))),

                /// Dropdown
                Container(child: Icon(Icons.arrow_drop_down)),
              ],
            )));
  }
}
