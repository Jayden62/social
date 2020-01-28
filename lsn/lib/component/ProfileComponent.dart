import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class ProfileComponent extends StatefulWidget {
  final String title;
  final String value;

  ProfileComponent({@required this.title, @required this.value});

  @override
  State<StatefulWidget> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding10),
      child: Row(
        children: <Widget>[
          Text(widget.title),
          Expanded(
              child: Text(widget.value,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: font14))),
        ],
      ),
    );
  }
}
