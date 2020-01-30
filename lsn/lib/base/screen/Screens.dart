import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/modules/login/AdditionalScreen.dart';
import 'package:lsn/modules/login/VerifyScreen.dart';
import 'package:lsn/modules/login/PasswordScreen.dart';
import 'package:lsn/modules/login/PhoneScreen.dart';
import 'package:lsn/modules/parent/HomeScreen.dart';
import 'package:lsn/modules/parent/feed/FeedScreen.dart';
import 'package:lsn/modules/parent/notification/NotificationScreen.dart';
import 'package:lsn/modules/parent/profile/EditProfileScreen.dart';
import 'package:lsn/modules/parent/profile/NewFeatureScreen.dart';
import 'package:lsn/modules/parent/profile/ProfileScreen.dart';
import 'package:lsn/modules/parent/profile/ViewPostScreen.dart';
import 'package:lsn/modules/parent/question/BaseQuestionScreen.dart';
import 'package:lsn/modules/parent/question/QuestionDetailScreen.dart';
import 'package:lsn/modules/parent/question/QuestionScreen.dart';

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

  /// Question screen
  static const String QUESTION = 'question';

  /// Base question screen
  static const String BASE_QUESTION = 'base question';

  /// Question detail screen
  static const String QUESTION_DETAIL = 'question detail';

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
      case QUESTION:
        state = QuestionScreen();
        break;
      case BASE_QUESTION:
        state = BaseQuestionScreen();
        break;
      case QUESTION_DETAIL:
        state = QuestionDetailScreen();
        break;
      case VIEW_POST:
        state = ViewPostScreen();
        break;
      case NOTIFICATION:
        state = NotificationScreen();
        break;
      case NEW_FEATURE:
        state = NewFeatureScreen();
        break;
      case EDIT_PROFILE:
        state = EditProfileScreen();
        break;
    }
    return state;
  }
}
