import 'package:flutter/material.dart';
import 'package:lsn/api/result/Option.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/component/InputTextComponent.dart';
import 'package:lsn/items/OptionItem.dart';

class BottomUtil {
  /// Single tong
  static final BottomUtil singleton = BottomUtil._internal();

  BottomUtil._internal();

  static BottomUtil get instance => singleton;

  /// Dismiss bottom
  static void popBottom(BuildContext context) {
    Navigator.pop(context);
  }

  /// Show more options
  void showMoreOptions(BuildContext context) {
    List<Option> options = Option().addData();
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius5),
                topRight: Radius.circular(radius5))),
        builder: (BuildContext bc) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) => OptionItem(
                  options[index],
                  callback: (Option item) {
                    popBottom(context);
                  },
                ),
              ),
            ],
          );
        });
  }
}
