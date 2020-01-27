import 'package:flutter/material.dart';
import 'package:lsn/base/dialog/loading/BaseLoadingStyle.dart';
import 'package:lsn/base/style/BaseStyle.dart';



class BaseLoadingDialog {
  bool isLoading = false;

  /// Show loading dialog
  /// Param (context)
  void showLoading(BuildContext context) async {
    if (isLoading) {
      return;
    }

    /// Create dialog.
    SimpleDialog loadingDialog = SimpleDialog(
      contentPadding: dialogContentPadding,
      backgroundColor: whiteColor,
      shape: roundCorner,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(blueColor)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: margin10),
                  child: Text(
                   'Loading data...',
                    style: loadingStyle,
                  ),
                ),
              ],
            ))
          ],
        )
      ],
    );

    isLoading = true;

    /// Show loading dialog
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          /// Prevent back press on Android, we use WillPopScope and override onWillPop.
          return WillPopScope(      onWillPop: () async => false, child: loadingDialog);
        });
  }

  /// Hide loading
  /// Param (context)
  void hideLoading(BuildContext context) {
    if (!isLoading) {
      return;
    }
    isLoading = false;

    /// Close dialog
    Navigator.pop(context);
  }
}
