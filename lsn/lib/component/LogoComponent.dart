import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class LogoComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogoComponentState();
}

class _LogoComponentState extends State<LogoComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height200,
      alignment: Alignment.center,
      margin: EdgeInsets.all(margin10),
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
