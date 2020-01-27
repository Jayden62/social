import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class InputTextComponent extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;

  InputTextComponent({@required this.label, this.textEditingController});

  @override
  State<StatefulWidget> createState() {
    return InputTextComponentState();
  }
}

class InputTextComponentState extends State<InputTextComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin20, left: margin20, right: margin20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.label),
          Container(
              height: boxHeight,
              color: whiteColor,
              margin: EdgeInsets.only(top: margin10),
              child: TextField(
                controller: widget.textEditingController,
                decoration: InputDecoration(
                  border: defaultBox,
                  enabledBorder: defaultBox,
                  focusedBorder: focusBox,
                  contentPadding: paddingBox,
                ),
              )),
        ],
      ),
    );
  }
}
