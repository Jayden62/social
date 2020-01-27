import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends BaseScreen {
  var phoneController = TextEditingController();
  bool isEnable = false;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Photo verify
        _photoVerify(),

        /// Pin code
        _pinCode(),

        /// Views
        _views(),

        /// BackComponent
        BackComponent(onBack: () => popScreen(context)),
      ],
    );
  }

  Widget _photoVerify() {
    return Image.asset('assets/images/verify.png',
        height: height200, fit: BoxFit.fitHeight);
  }

  Widget _pinCode() {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: padding8, horizontal: padding20),
        child: PinCodeTextField(
          length: 4,
          obsecureText: false,
          animationType: AnimationType.fade,
          shape: PinCodeFieldShape.underline,
          animationDuration: Duration(milliseconds: 300),
          borderRadius: BorderRadius.circular(radius5),
          fieldHeight: height50,
          fieldWidth: width40,
          onChanged: (value) {
//                setState(() {
//                  currentText = value;
//                });
          },
        ));
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
              text: 'Verify',
              width: width150,
              margin: EdgeInsets.only(
                  top: margin40, left: margin20, right: margin20),
              enable: isEnable,
              onPress: () {
                pushScreen(
                    context,
                    BaseWidget(
                      screen: Screens.PASSWORD,
                      arguments: 'additional',
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
            controller: phoneController,
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
                labelText: "Phone number",
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