import 'package:flutter/material.dart';
import 'package:lsn/base/dialog/loading/BaseLoadingDialog.dart';
import 'package:lsn/base/dialog/message/BaseMessageDialog.dart';

abstract class BasePresenter {
  final BaseLoadingDialog loadingDialog = BaseLoadingDialog();
  final BaseMessageDialog messageDialog = BaseMessageDialog();

  /// Show loading dialog
  /// Param (context)
  void showLoadingDialog(BuildContext context) {
    loadingDialog.showLoading(context);
  }

  /// Hide loading dialog
  /// Param (context)
  void hideLoadingDialog(BuildContext context) {
    loadingDialog.hideLoading(context);
  }

  /// Check status loading dialog.
  bool isShowLoadingDialog() {
    return loadingDialog.isLoading;
  }

  /// Show message dialog
  /// Param (context, message, {title, okLabel, cancelLabel, okTap, cancelTap})
  void showMessageDialog(BuildContext context, String message,
      {String title,
      String okLabel,
      String cancelLabel,
      Function okTap,
      Function cancelTap}) {
    messageDialog.showMessageDialog(context, message,
        title: title, okLabel: okLabel, okTap: okTap);
  }
}
