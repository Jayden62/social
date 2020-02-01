import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/middle/model/BaseCountryRequest.dart';

class NewPhoneScreen extends BaseScreen {
  bool isEnable = false;
  var phoneNumController = TextEditingController();
  String phoneCode = '';
  String phoneIso = '';
  String phoneCountry = '';
  Country _country;
  BaseCountryRequest baseCountryRequest;

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
              margin: EdgeInsets.only(
                  top: margin40, left: margin20, right: margin20),
              enable: isEnable,
              onPress: () {
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
                pushScreen(
                    context,
                    BaseWidget(
                      screen: Screens.VERIFY,
                      arguments: baseCountryRequest,
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
