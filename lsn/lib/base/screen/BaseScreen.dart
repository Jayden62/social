import 'package:flutter/material.dart';
import 'package:lsn/base/dialog/loading/BaseLoadingDialog.dart';
import 'package:lsn/base/dialog/message/BaseMessageDialog.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/slide/SlideRoute.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class BaseWidget<T extends Connector> extends StatefulWidget {
  final T connector;
  final String screen;
  final Screens screens = Screens();
  final dynamic arguments;

  BaseWidget({@required this.screen, this.connector, this.arguments});

  /// This function is re-called.
  @override
  State<StatefulWidget> createState() {
    return screens.initScreen(screen: screen);
  }
}

abstract class Connector {
  void dispose();

  void init();
}

/// Base Screen
abstract class BaseScreen extends State<BaseWidget>
    with AutomaticKeepAliveClientMixin {
  final BaseLoadingDialog loadingDialog = BaseLoadingDialog();
  final BaseMessageDialog messageDialog = BaseMessageDialog();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
        onTap: () {
          /// Call this method here to hide soft keyboard when touching outside keyboard.
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            decoration: onInitBackground(context),
            child: Scaffold(
              key: onInitKey(context),
              appBar: onInitAppBar(context),
              body: onInitBody(context),
              bottomNavigationBar: onInitBottomNavigationBar(context),
              floatingActionButton: onInitFloatingActionButton(context),
              drawer: onInitDrawer(context),
              endDrawer: onInitEndDrawer(context),
              bottomSheet: onInitBottomSheet(context),
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomPadding:
                  onInitResizeToAvoidBottomPadding(context),
              primary: onInitPrimary(context),
            )));
  }

  @override
  void dispose() {
    if (widget.connector != null) {
      widget.connector.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.connector != null) {
      widget.connector.init();
    }
    super.initState();
  }

  /// Default background is white
  BoxDecoration onInitBackground(BuildContext context) =>
      BoxDecoration(color: Colors.white);

  Key onInitKey(BuildContext context) => null;

  PreferredSize onInitAppBar(BuildContext context) {
    /// Default appbar is transparent.
    return PreferredSize(
        preferredSize: Size.fromHeight(height0),
        child: AppBar(
          backgroundColor: appBarColor,
          elevation: elevation0,
        ));
  }

  Widget onInitFloatingActionButton(BuildContext context) => null;

  Widget onInitBody(BuildContext context);

  Widget onInitDrawer(BuildContext context) => null;

  Widget onInitEndDrawer(BuildContext context) => null;

  Widget onInitBottomNavigationBar(BuildContext context) => null;

  Widget onInitBottomSheet(BuildContext context) => null;

  bool onInitResizeToAvoidBottomPadding(BuildContext context) => true;

  bool onInitPrimary(BuildContext context) => true;

  @override
  bool get wantKeepAlive => false;

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

  /// Start screen
  dynamic pushScreen(BuildContext context, Widget widget) async {
    return await Navigator.push(context, SlideRoute(widget: widget));
  }

  /// Start with replacement screen
  dynamic pushReplaceScreen(BuildContext context, Widget widget) async {
    return await Navigator.pushReplacement(context, SlideRoute(widget: widget));
  }

  /// Back screen.
  void popScreen(BuildContext context, {dynamic data}) {
    if (data == null) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context, data);
    }
  }
}
