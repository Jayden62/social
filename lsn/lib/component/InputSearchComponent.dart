import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class InputSearchComponent extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String text) onChanged;

  InputSearchComponent({this.textEditingController, this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return InputSearchComponentState();
  }
}

class InputSearchComponentState extends State<InputSearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxHeight,
      decoration: _searchDecoration,
      margin: EdgeInsets.only(top: margin10, left: margin10, right: margin10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: margin10),
            child: Icon(
              Icons.search,
              size: size18,
              color: greyColor,
            ),
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: margin10),
                  child: TextField(
                    onChanged: widget.onChanged,
                    style: TextStyle(fontSize: font14, color: greyColor),
                    controller: widget.textEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                  ))),
        ],
      ),
    );
  }
}

var _searchDecoration = BoxDecoration(
    color: whiteColor,
    borderRadius: BorderRadius.all(Radius.circular(radius25)));
