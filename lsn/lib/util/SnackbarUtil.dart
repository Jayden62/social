import 'package:flutter/material.dart';

class SnackBarUtil {
  void showSnackBar({GlobalKey<ScaffoldState> scaffoldKey, String message}) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 800),
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal[300])),
    ));
  }
}
