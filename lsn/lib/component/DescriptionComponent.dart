import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class DescriptionComponent extends StatefulWidget {
  final TextEditingController textEditingController;

  DescriptionComponent({this.textEditingController});

  @override
  State<StatefulWidget> createState() => _DescriptionComponentState();
}

class _DescriptionComponentState extends State<DescriptionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: margin40, left: margin20, right: margin20),
        child: TextField(
          controller: widget.textEditingController,
          maxLines: maxLines5,
          autofocus: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: desColor,
            border: InputBorder.none,
            hintText: 'Optional.',
            hintStyle: TextStyle(color: grayColor, fontSize: font14),
          ),
        ));
  }
}
