import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';

class NewFeatureScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /// Ideal
        _idealPhoto(),

        /// Note
        _note(),

        /// BackComponent
        BackComponent(onBack: () => popScreen(context)),
      ],
    );
  }

  Widget _note() {
    return Container(
      margin: EdgeInsets.only(top: margin20, left: margin20, right: margin20),
      child: Text(
        'We have still beening thought new feature. Do not worry, we will expand more features to deserve you guys. Happy coding :)',
        style: TextStyle(fontSize: font16, fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget _idealPhoto() {
    return Container(
        height: height100,
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/images/comming_soon.png',
          fit: BoxFit.cover,
        ));
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    /// Default appbar is transparent.
    return PreferredSize(
        preferredSize: Size.fromHeight(height0),
        child: AppBar(
          backgroundColor: appBarColor,
          elevation: elevation0,
        ));
  }
}
