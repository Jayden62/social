import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class CommentComponent extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String text) onChanged;

  CommentComponent({this.textEditingController, this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return CommentComponentState();
  }
}

class CommentComponentState extends State<CommentComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: boxHeight,
        decoration: _commentDecoration,
        margin: EdgeInsets.all(margin10),
        child: Container(
            margin: EdgeInsets.only(left: margin15),
            child: TextField(
              onChanged: widget.onChanged,
              style: TextStyle(fontSize: font14, color: blackColor),
              controller: widget.textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Write a comment'),
            )));
  }
}

var _commentDecoration = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.all(Radius.circular(radius25)));
