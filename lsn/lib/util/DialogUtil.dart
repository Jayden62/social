import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/component/IssueTypeComponent.dart';

class DialogUtil {
  /// Single tong
  static final DialogUtil singleton = DialogUtil._internal();

  DialogUtil._internal();

  static DialogUtil get instance => singleton;

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
                      child: Text('Close'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Show feedback dialog
  void showFeedbackDialog(BuildContext context) {
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

                  /// Content
                  Container(
                      padding: EdgeInsets.all(padding20),
                      child: TextField(
//                    controller: _textEditingController,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        maxLength: 100,
                        decoration: InputDecoration(
                          hintText:
                              'We extremely need your ideal to improve our product :D',
                          hintStyle: TextStyle(fontSize: font14),
                          hintMaxLines: 2,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: widthAHalf)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, width: widthAHalf)),
                        ),
                      )),

                  /// Submit
                  CommonButtonComponent(
                    text: 'Submit',
                    width: width150,
                    margin: EdgeInsets.all(margin20),
                    enable: true,
                    onPress: () {popDialog(context);},
                  )
                ],
              ),
            ),
          );
        });
  }
}
