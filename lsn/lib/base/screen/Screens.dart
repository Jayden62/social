import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/screens/feeddetail/FeedDetailScreen.dart';
import 'package:lsn/screens/phone/PhoneScreen.dart';
import 'package:lsn/screens/password/PasswordScreen.dart';
import 'package:lsn/screens/newphone/NewPhoneScreen.dart';
import 'package:lsn/screens/verify/VerifyScreen.dart';
import 'package:lsn/screens/implement/ImplementScreen.dart';
import 'package:lsn/screens/home/HomeScreen.dart';
import 'package:lsn/screens/profile/ProfileScreen.dart';
import 'package:lsn/screens/feed/FeedScreen.dart';
import 'package:lsn/screens/notification/NotificationScreen.dart';

/// Factory pattern
class Screens {
  /// Phone screen
  static const String PHONE = 'phone';

  /// Password screen
  static const String PASSWORD = 'password';

  /// New phone screen
  static const String NEW_PHONE = 'new phone';

  /// Verify screen
  static const String VERIFY = 'verify';

  /// Implement screen
  static const String IMPLEMENT = 'implement';

  /// Home screen
  static const String HOME = 'home';

  /// Feed screen
  static const String FEED = 'feed';

  /// Feed detail screen
  static const String FEED_DETAIL = 'feed detail';

  /// Profile screen
  static const String PROFILE = 'profile';

  /// View post screen
  static const String VIEW_POST = 'view post';

  /// Notification screen
  static const String NOTIFICATION = 'notification';

  /// New feature screen
  static const String NEW_FEATURE = 'new feature';

  /// Edit profile screen
  static const String EDIT_PROFILE = 'edit profile';

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
      case NEW_PHONE:
        state = NewPhoneScreen();
        break;
      case VERIFY:
        state = VerifyScreen();
        break;
      case IMPLEMENT:
        state = ImplementScreen();
        break;
      case HOME:
        state = HomeScreen();
        break;
      case PROFILE:
        state = ProfileScreen();
        break;
      case FEED:
        state = FeedScreen();
        break;
      case FEED_DETAIL:
        state = FeedDetailScreen();
        break;
      case NOTIFICATION:
        state = NotificationScreen();
        break;
    }
    return state;
  }
}
