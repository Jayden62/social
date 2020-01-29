import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class FeatureComponent extends StatefulWidget {
  final String text;
  final Function onTap;
  final Widget icon;

  FeatureComponent({@required this.text, this.onTap, this.icon});

  @override
  State<StatefulWidget> createState() => _FeatureComponentState();
}

class _FeatureComponentState extends State<FeatureComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => widget.onTap(),
        child: Container(
            color: whiteColor,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.all(padding15),
                            child: Text(widget.text,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )))),
                    Container(
                        margin: EdgeInsets.only(right: margin10),
                        child: widget.icon == null
                            ? Icon(Icons.navigate_next)
                            : widget.icon),
                  ],
                ),
                Divider(color: greyColor, height: 1.0)
              ],
            )));
  }
}
