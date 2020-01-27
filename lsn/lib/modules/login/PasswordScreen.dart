import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/component/LogoComponent.dart';

class PasswordScreen extends BaseScreen {
  var passwordController = TextEditingController();
  bool isEnable = false;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// Pass word
            _password(),

            /// CommonButtonComponent
            CommonButtonComponent(
              text: 'Next',
              width: width150,
              margin: EdgeInsets.only(
                  top: margin40, left: margin20, right: margin20),
              enable: isEnable,
              onPress: () {
//            pushScreen(
//                context,
//                BaseWidget(
//                  screen: Screens.PASSWORD,
//                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
        margin: EdgeInsets.only(top: margin20, left: margin20, right: margin20),
        child: TextField(
            controller: passwordController,
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
                labelText: "Pass word",
                suffixIcon: Container(
                    child: Icon(Icons.visibility_off,
                        size: size18, color: primaryColor)),
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
