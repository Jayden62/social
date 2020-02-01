import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_indicator/home_indicator.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/util/LocalizationsDelegateUtil.dart';

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
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    /// Config local
//    _configLocal();
  }

  void _configLocal() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
//    await Navigator.push(
//      context,
//      new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
//    );
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    print('onDidReceiveLocalNotification');

    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: body != null ? Text(body) : null,
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () {},
          )
        ],
      ),
    );
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
