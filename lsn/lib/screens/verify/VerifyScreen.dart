import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/api/result/BaseCountry.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends BaseScreen {
  bool isEnable = false;
  String _smsCode = '';
  BaseCountry data;
  String _phoneValue;

  @override
  void initState() {
    super.initState();
    data = widget.arguments[0];
    _phoneValue = widget.arguments[1];
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
        height: height150, fit: BoxFit.fitHeight);
  }

  Widget _pinCode() {
    return Padding(
        padding:
            EdgeInsets.symmetric(vertical: padding8, horizontal: padding20),
        child: PinCodeTextField(
          length: 6,
          obsecureText: false,
          textInputType: TextInputType.number,
          animationType: AnimationType.fade,
          shape: PinCodeFieldShape.underline,
          animationDuration: Duration(milliseconds: 300),
          borderRadius: BorderRadius.circular(radius5),
          fieldHeight: height50,
          fieldWidth: width40,
          onCompleted: (String text) {
            /// Check paste code from fire base
          },
          onChanged: (value) {
            setState(() {
              _smsCode = value;
            });
            print('current text $_smsCode');
          },
        ));
  }

  Widget _views() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// CommonButtonComponent
            CommonButtonComponent(
              text: 'Verify',
              width: width150,
              margin: EdgeInsets.only(
                  top: margin40, left: margin20, right: margin20),
              enable: isEnable,
              onPress: () async {
//                pushScreen(
//                    context,
//                    BaseWidget(
//                      screen: Screens.PASSWORD,
//                      arguments: 'additional',
//                    ));
              },
            ),
          ],
        ),
      ),
    );
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
