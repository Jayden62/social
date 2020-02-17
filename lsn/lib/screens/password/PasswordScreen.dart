import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/component/LogoComponent.dart';

class PasswordScreen extends BaseScreen {
  var passwordController = TextEditingController();
  bool isEnable = false;
  String text;
  Map<String, bool> mapPassword = Map();

  @override
  void initState() {
    super.initState();
    text = widget.arguments;
    mapPassword['isShowed'] = false;
  }

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

        /// BackComponent
        BackComponent(onBack: () => popScreen(context)),
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
                if (text == 'login') {
                  pushScreen(
                      context,
                      BaseWidget(
                        screen: Screens.HOME,
                      ));
                } else {
                  pushScreen(
                      context,
                      BaseWidget(
                        screen: Screens.IMPLEMENT,
                      ));
                }
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
            obscureText: _showObscureText(),
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
                suffixIcon: InkWell(
                    onTap: () {
                      if (!mapPassword['isShowed']) {
                        setState(() {
                          mapPassword['isShowed'] = true;
                        });
                      } else {
                        setState(() {
                          mapPassword['isShowed'] = false;
                        });
                      }
                    },
                    child: _showVisibility()),
                labelStyle: TextStyle(fontSize: font14, color: greyColor),
                border: phoneBorder,
                focusedBorder: phoneBorder)));
  }

  bool _showObscureText() {
    if (!mapPassword['isShowed']) return true;

    return false;
  }

  Widget _showVisibility() {
    Widget view;
    if (!mapPassword['isShowed']) {
      view = Icon(Icons.visibility_off, size: size18, color: primaryColor);
    } else {
      view = Icon(Icons.visibility, size: size18, color: primaryColor);
    }
    return view;
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
