import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/middle/model/BaseCountryRequest.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyScreen extends BaseScreen {
  bool isEnable = false;
  String currentText = '';
  String _smsVerificationCode = '';
  BaseCountryRequest data;
  String _phoneValue;

  @override
  void initState() {
    super.initState();
    data = widget.arguments;

    /// Check phone number contain '0'
    if (data.phoneNumber.startsWith('0')) {
      _phoneValue = data.phoneNumber.substring(1, data.phoneNumber.length);
      return;
    }
    _phoneValue = data.phoneNumber;
  }

  _verifyPhoneNumber(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneValue,
        timeout: Duration(seconds: 5),
        verificationCompleted: (authCredential) =>
            _verificationComplete(authCredential, context),
        verificationFailed: (authException) =>
            _verificationFailed(authException, context),
        codeAutoRetrievalTimeout: (verificationId) =>
            _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) =>
            _smsCodeSent(verificationId, [code]));
  }

  _verificationComplete(AuthCredential authCredential, BuildContext context) {
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((authResult) {
      final snackBar =
          SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  _verificationFailed(AuthException authException, BuildContext context) {
    final snackBar = SnackBar(
        content:
            Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
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
              currentText = value;
            });
            print('current text $currentText');
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

                await _verifyPhoneNumber(context);
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
