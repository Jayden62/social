import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/modules/login/AdditionalScreen.dart';
import 'package:lsn/modules/login/VerifyScreen.dart';
import 'package:lsn/modules/login/PasswordScreen.dart';
import 'package:lsn/modules/login/PhoneScreen.dart';

/// Factory pattern
class Screens {
  /// Phone screen
  static const String PHONE = 'phone';

  /// Password screen
  static const String PASSWORD = 'password';

  /// Verify screen
  static const String VERIFY = 'verify';


  /// Additional screen
  static const String ADDITIONAL = 'additional';

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
      case VERIFY:
        state = VerifyScreen();
        break;
      case ADDITIONAL:
        state = AdditionalScreen();
        break;
    }
    return state;
  }
}
