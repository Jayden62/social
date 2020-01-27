import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_indicator/home_indicator.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/util/LocalizationsDelegateUtil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Disable bottom bar line on Iphone X
  if (Platform.isIOS) {
    await HomeIndicator.hide();
  }

  /// Only set portrait orientation for device.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MainScreen());
  });
}

class MainScreen extends StatefulWidget {
  MainScreen();

  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainScreen> {
  Widget screen;
  final GlobalKey _scaffoldKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        /// Localization, support english and vietnamese languages
        localizationsDelegates: [
          LocalizationsDelegateUtil(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('vi', ''),
        ],
//        locale: locale,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
            body: BaseWidget(screen: Screens.PHONE),
        ));
  }
}
