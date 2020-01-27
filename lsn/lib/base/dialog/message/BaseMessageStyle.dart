import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

/// Margin or  padding

EdgeInsets messageMargin = EdgeInsets.only(
    top: margin20, left: margin20, bottom: margin20, right: margin20);
EdgeInsets messagePadding = EdgeInsets.only(top: padding10);
EdgeInsets titleMargin =
    EdgeInsets.only(top: margin30, left: margin20, right: margin20);
EdgeInsets contentPadding = EdgeInsets.all(0.0);

/// Style

TextStyle msgStyle = TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: largestFont);
TextStyle messageStyle = TextStyle(color: Colors.black);
TextStyle defaultStyleDialog =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

/// Default background of button
BoxDecoration defaultDecorationDialog = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius10),
        bottomRight: Radius.circular(radius10)),
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: <Color>[Colors.white, Colors.white],
    ),
    boxShadow: [buttonBoxShadow]);

/// Highlight background of button
BoxDecoration highlightDecorationDialog = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius10),
        bottomRight: Radius.circular(radius10)),
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: <Color>[grayColor, grayColor],
    ),
    boxShadow: [buttonBoxShadow]);
