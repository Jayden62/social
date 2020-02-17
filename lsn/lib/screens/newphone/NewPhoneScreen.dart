import 'dart:async';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/middle/model/BaseCountryRequest.dart';
import 'package:lsn/util/DialogUtil.dart';
import 'package:lsn/util/SnackbarUtil.dart';

class NewPhoneScreen extends BaseScreen {
  bool isEnable = false;
  var phoneNumController = TextEditingController();
  Country _country;
  BaseCountryRequest baseCountryRequest;
  String _phoneValue;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _verificationId = '';
  int _timeResendOTP = 60;
  bool showResend = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isResend = false;

  @override
  void dispose() {
    super.dispose();
    phoneNumController.dispose();
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
        height: height150, fit: BoxFit.cover);
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            Text(
              " +${country.phoneCode} (${country.isoCode})",
              style: TextStyle(fontSize: font14),
            ),
          ],
        ),
      );

  Widget _countryPhoneCode() {
    return Container(
        margin: EdgeInsets.only(top: margin20, left: margin20, right: margin20),
        padding: EdgeInsets.all(padding10),
        decoration: countryPhoneDecoration,
        child: CountryPickerDropdown(
          initialValue: 'VN',
          itemBuilder: _buildDropdownItem,
          onValuePicked: (Country country) {
            _country = country;
          },
        ));
  }

  Widget _views() {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          /// Country phone code
          _countryPhoneCode(),

          /// Phone number
          _phoneNumber(),

          /// CommonButtonComponent
          CommonButtonComponent(
            text: 'Next',
            width: width150,
            margin:
                EdgeInsets.only(top: margin40, left: margin20, right: margin20),
            enable: isEnable,
            onPress: () async {
              if (_country == null) {
                baseCountryRequest = BaseCountryRequest(
                    phoneCode: 'VN',
                    phoneNumber: phoneNumController.text,
                    phoneIso: '+84',
                    phoneCountryName: 'VietNam');
              } else {
                baseCountryRequest = BaseCountryRequest(
                    phoneCode: _country.phoneCode,
                    phoneIso: _country.isoCode,
                    phoneNumber: phoneNumController.text,
                    phoneCountryName: _country.name);
              }

              /// Check sms code
              if (baseCountryRequest.phoneNumber.startsWith('0')) {
                _phoneValue = baseCountryRequest.phoneNumber
                    .substring(1, baseCountryRequest.phoneNumber.length);
              } else {
                _phoneValue = baseCountryRequest.phoneNumber;
              }
              _phoneValue = '${baseCountryRequest.phoneIso}$_phoneValue';
              await _verifyPhoneNumber(context);
            },
          ),

          Container(
            margin: EdgeInsets.only(top: margin20, right: margin20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                isResend
                    ? Container(
                        child: Text(
                          _timeResendOTP.toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
                showResend
                    ? InkWell(
                        onTap: () {
                          startTimer();
                        },
                        child: Container(
                          child: Text(
                            'Resend OTP',
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline),
                          ),
                        ))
                    : Container()
              ],
            ),
          )
        ],
      )),
    );
  }

  _verificationComplete(AuthCredential authCredential, BuildContext context) {
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((authResult) async {
//      final snackBar =
//          SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
//      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _verificationId = verificationId;

    pushScreen(
        context,
        BaseWidget(
          screen: Screens.VERIFY,
          arguments: [baseCountryRequest, _phoneValue],
        ));
  }

  _verificationFailed(AuthException authException, BuildContext context) {
    /// Show snack bar
    SnackBarUtil().showSnackBar(
        scaffoldKey: _scaffoldKey,
        message: 'System OTP is not working, come back later !');
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
    setState(() {
      showResend = true;
      isEnable = false;
    });
  }

  _verifyPhoneNumber(BuildContext context) async {
    await _firebaseAuth.verifyPhoneNumber(
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

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () async {
          if (_timeResendOTP < 1) {
            timer.cancel();

            await _verifyPhoneNumber(context);
          } else {
            _timeResendOTP = _timeResendOTP - 1;
            setState(() {
              isResend = true;
            });
          }
        },
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
  Key onInitKey(BuildContext context) {
    return _scaffoldKey;
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
