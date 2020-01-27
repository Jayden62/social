import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class ProfileComponent extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;

  ProfileComponent({@required this.title,this.textEditingController});

  @override
  State<StatefulWidget> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin10, right: margin10),
      child: Row(
        children: <Widget>[
          Text(widget.title),
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: font14),
              controller: widget.textEditingController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
