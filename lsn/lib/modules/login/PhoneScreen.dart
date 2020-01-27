import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/component/InputSelectComponent.dart';
import 'package:lsn/component/LogoComponent.dart';
import 'package:lsn/items/LanguageItem.dart';
import 'package:lsn/middle/model/LanguageRequest.dart';

class PhoneScreen extends BaseScreen {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var languageController = TextEditingController();
  bool isShowed = false;

  @override
  void initState() {
    super.initState();
    languageController.text = 'English';
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
    languageController.dispose();
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// LogoComponent
        LogoComponent(),

        /// Views
        _views(),
      ],
    );
  }

  Widget _views() {
    return Expanded(
      child: Column(
        children: <Widget>[
          /// Phone number
          _phoneNumber(),

          /// CommonButtonComponent
          CommonButtonComponent(
              text: 'Next',
              width: width150,
              margin: EdgeInsets.only(
                  top: margin40, left: margin20, right: margin20)),

          /// Register
          _register(),

          /// InputSelectComponent
          InputSelectComponent(
            textEditingController: languageController,
            onSelect: () {
              if (!isShowed) {
                setState(() {
                  isShowed = true;
                });
              } else {
                setState(() {
                  isShowed = false;
                });
              }
            },
          ),

          /// Show language
          _showLanguage(),
        ],
      ),
    );
  }

  Widget _register() {
    return Container(
      margin: EdgeInsets.only(right: margin20, top: margin20),
      alignment: Alignment.centerRight,
      child: Text(
        'Register',
        style: TextStyle(
            color: Colors.red[600], decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _showLanguage() {
    Widget view;
    if (!isShowed) {
      view = Container();
    } else {
      view = Container(
          height: height200,
          child: ListView(
            children: <Widget>[
              LanguageItem(LanguageRequest(
                  countryName: 'English',
                  countryCode: 'en',
                  flag: 'assets/images/usa_flag.png',
                  postCode: '+1191')),
              LanguageItem(LanguageRequest(
                  countryName: 'Vietnamese',
                  countryCode: 'vi',
                  flag: 'assets/images/vietnam_flag.png',
                  postCode: '+841')),
            ],
          ));
    }
    return view;
  }

  Widget _phoneNumber() {
    return Container(
        margin: EdgeInsets.only(top: margin20, left: margin20, right: margin20),
        child: TextField(
            keyboardType: TextInputType.phone,
            controller: phoneController,
            decoration: InputDecoration(
                labelText: "Phone number",
                labelStyle: TextStyle(fontSize: font14, color: Colors.grey),
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
