import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/ButtonComponent.dart';

class CommonButtonComponent extends StatefulWidget {
  final String text;
  final bool enable;
  final double width;
  final EdgeInsetsGeometry margin;
  final Function onPress;

  CommonButtonComponent(
      {@required this.text,
      this.enable,
      this.width,
      this.margin,
      this.onPress});

  @override
  State<StatefulWidget> createState() => _CommonButtonComponentState();
}

class _CommonButtonComponentState extends State<CommonButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return ButtonComponent(
      widget.text,
      enable: widget.enable ? true : false,
      height: height45,
      width: widget.width,
      margin: widget.margin,
      defaultStyle: _defaultStyle,
      highlightStyle: _highlightStyle,
      defaultDecoration: _defaultDecoration,
      disableStyle: _disableStyle,
      disableDecoration: _disableDecoration,
      onPress: () => widget.onPress(),
    );
  }
}

var _defaultStyle = TextStyle(fontSize: font16, color: whiteColor);
var _highlightStyle = TextStyle(fontSize: font16, color: greyColor);
var _disableStyle = TextStyle(fontSize: font16, color: whiteColor);

var _defaultDecoration = BoxDecoration(
    color: primaryColor,
    borderRadius: BorderRadius.all(Radius.circular(radius25)));
var _disableDecoration = BoxDecoration(
    color: greyColor,
    borderRadius: BorderRadius.all(Radius.circular(radius25)));
