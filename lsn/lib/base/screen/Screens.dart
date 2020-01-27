import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/modules/login/PasswordScreen.dart';
import 'package:lsn/modules/login/PhoneScreen.dart';

/// Factory pattern
class Screens {
  /// Phone screen
  static const String PHONE = 'phone';

  /// Password screen
  static const String PASSWORD = 'password';

  /// Init screen
  State<BaseWidget> initScreen({@required String screen}) {
    State<BaseWidget> state;
    switch (screen) {
      case PHONE:
        state = PhoneScreen();
        break;
      case PASSWORD:
        state = PasswordScreen();
        break;
    }
    return state;
  }
}
