import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/modules/login/AdditionalScreen.dart';
import 'package:lsn/modules/login/VerifyScreen.dart';
import 'package:lsn/modules/login/PasswordScreen.dart';
import 'package:lsn/modules/login/PhoneScreen.dart';
import 'package:lsn/modules/parent/HomeScreen.dart';
import 'package:lsn/modules/parent/feed/FeedScreen.dart';
import 'package:lsn/modules/parent/notification/NotificationScreen.dart';
import 'package:lsn/modules/parent/profile/ProfileScreen.dart';
import 'package:lsn/modules/parent/profile/ViewPostScreen.dart';
import 'package:lsn/modules/parent/technews/TechNewsScreen.dart';

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

  /// Home screen
  static const String HOME = 'home';

  /// Feed screen
  static const String FEED = 'feed';

  /// Tech news screen
  static const String TECH_NEWS = 'tech news';

  /// Profile screen
  static const String PROFILE = 'profile';

  /// View post screen
  static const String VIEW_POST = 'view post';

  /// Notification screen
  static const String NOTIFICATION = 'notificationn';

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
      case HOME:
        state = HomeScreen();
        break;
      case FEED:
        state = FeedScreen();
        break;
      case PROFILE:
        state = ProfileScreen();
        break;
      case TECH_NEWS:
        state = TechNewsScreen();
        break;
      case VIEW_POST:
        state = ViewPostScreen();
        break;
      case NOTIFICATION:
        state = NotificationScreen();
        break;
    }
    return state;
  }
}
