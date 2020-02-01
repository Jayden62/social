import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';

class NewPhoneScreen extends BaseScreen {
  bool isEnable = false;
  var phoneNumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneNumController.clear();
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Photo verify
        _photoVerify(),

        /// Views
        _views(),

        /// BackComponent
        BackComponent(onBack: () => popScreen(context)),
      ],
    );
  }

  Widget _photoVerify() {
    return Image.asset('assets/images/verify.png',
        height: height150, fit: BoxFit.fitHeight);
  }

  Widget _views() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// Phone number
            _phoneNumber(),

            /// CommonButtonComponent
            CommonButtonComponent(
              text: 'Next',
              width: width150,
              margin: EdgeInsets.only(
                  top: margin40, left: margin20, right: margin20),
              enable: isEnable,
              onPress: () async {
                pushScreen(
                    context,
                    BaseWidget(
                      screen: Screens.VERIFY,
                      arguments: phoneNumController.text,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _phoneNumber() {
    return Container(
        margin: EdgeInsets.only(top: margin20, left: margin20, right: margin20),
        child: TextField(
            keyboardType: TextInputType.phone,
            controller: phoneNumController,
            onChanged: (String text) {
              if (text.isEmpty) {
                setState(() {
                  isEnable = false;
                });
              } else {
                setState(() {
                  isEnable = true;
                });
              }
            },
            decoration: InputDecoration(
                labelText: "New phone number",
                labelStyle: TextStyle(fontSize: font14, color: greyColor),
                border: phoneBorder,
                focusedBorder: phoneBorder)));
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
