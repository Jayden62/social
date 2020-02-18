import 'package:flutter/material.dart';
import 'package:lsn/api/result/Option.dart';
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

  /// Show bottom sheet
  void showMoreOptions(BuildContext context) {
    List<Option> options = Option().addData();
    showModalBottomSheet(
        context: context,
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
