import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class DialogUtil {
  /// Dismiss dialog
  static void popDialog(BuildContext context) {
    Navigator.pop(context);
  }

  /// Show  photo dialog
  void showPhotoDialog(BuildContext context,
      {Function onView, Function onCamera, Function onGallery}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(padding0),
            elevation: elevation0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius5)),
            content: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /// Background top
                  Container(
                      constraints: BoxConstraints.expand(
                        height: height80,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(radius5),
                              topRight: Radius.circular(radius5))),
                      child: Container(
                          padding: EdgeInsets.all(padding10),
                          child: Image.asset('assets/images/logo.png'))),

                  /// View avatar
                  InkWell(
                    onTap: () {
                      popDialog(context);
                      onView();
                    },
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(padding15),
                      child: Text('View avatar'),
                    ),
                  ),

                  /// Camera
                  InkWell(
                    onTap: () {
                      popDialog(context);
                      onCamera();
                    },
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(padding15),
                      child: Text('New photo'),
                    ),
                  ),

                  /// Gallery
                  InkWell(
                    onTap: () {
                      popDialog(context);
                      onGallery();
                    },
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(padding15),
                      child: Text('Choose a photo'),
                    ),
                  ),

                  /// Close
                  InkWell(
                    onTap: () => popDialog(context),
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(padding15),
                      child: Text('Dismiss'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
