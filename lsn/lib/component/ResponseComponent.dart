import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class ResponseComponent extends StatefulWidget {
  final Function(String text) onReply;

  ResponseComponent({this.onReply});

  @override
  State<StatefulWidget> createState() {
    return ResponseComponentState();
  }
}

class ResponseComponentState extends State<ResponseComponent> {
  var resController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    resController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: boxHeight,
        decoration: _commentDecoration,
        margin: EdgeInsets.all(margin10),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: margin10),
                    child: TextField(
                      style: TextStyle(fontSize: font14, color: blackColor),
                      controller: resController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Your answer.'),
                    ))),
            InkWell(
              onTap: () {
                widget.onReply(resController.text);
              },
              child: Container(
                margin: EdgeInsets.only(right: margin10),
                child: Icon(
                  Icons.send,
                  size: size18,
                ),
              ),
            ),
          ],
        ));
  }
}

var _commentDecoration = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.all(Radius.circular(radius25)));
