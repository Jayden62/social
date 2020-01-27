import 'package:flutter/material.dart';
import 'package:lsn/base/dialog/message/BaseMessageStyle.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/ButtonComponent.dart';
import 'package:lsn/util/StringUtil.dart';

class BaseMessageDialog {
  /// Show message dialog
  /// params (context, message, {title, okLabel, callback})
  void showMessageDialog(BuildContext context, String message,
      {String title, String okLabel, Function okTap}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          /// Prevent back press on Android, we use WillPopScope and override onWillPop.
          return WillPopScope(
              onWillPop: () async => false,
              child: initMessageDialog(context, message,
                  title: title, okLabel: okLabel, okTap: okTap));
        });
  }

  /// Create message dialog
  /// Params (context, message, {title, okLabel, okTap})
  Widget initMessageDialog(BuildContext context, String message,
      {String title, String okLabel, Function okTap}) {
    if (StringUtil.isEmpty(okLabel)) {
      okLabel = 'Oke';
    }

    if (StringUtil.isEmpty(title)) {
      /// Create dialog.
      return SimpleDialog(
        contentPadding: dialogContentPadding,
        shape: roundCorner,
        children: <Widget>[
          /// Message
          Container(
            margin: messageMargin,
            padding: messagePadding,
            child: Text(message, style: msgStyleDialog),
          ),
          ButtonComponent(
            okLabel,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: margin30),
            height: commonButtonHeight,
            defaultStyle: okStyleDialog,
            highlightStyle: highlightBlackStyle,
            onPress: () {
              Navigator.pop(context);
              if (okTap != null) {
                okTap();
              }
            },
          )
        ],
      );
    }

    /// Create dialog.
    return SimpleDialog(
      contentPadding: dialogContentPadding,
      shape: roundCorner,
      children: <Widget>[
        Container(
          margin: titleMargin,
          child: Text(title, style: msgStyle),
        ),

        /// Message
        Container(
          margin: messageMargin,
          child: Text(message, style: messageStyle),
        ),
        ButtonComponent(
          okLabel,
          alignment: Alignment.center,
          height: commonButtonHeight,
          defaultStyle: defaultStyleDialog,
          defaultDecoration: defaultDecorationDialog,
          highlightDecoration: highlightDecorationDialog,
          onPress: () {
            Navigator.pop(context);
            if (okTap != null) {
              okTap();
            }
          },
        )
      ],
    );
  }
}
