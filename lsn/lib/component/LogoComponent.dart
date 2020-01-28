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
        constraints: BoxConstraints.expand(height: height200),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.teal[200],
            borderRadius: BorderRadius.all(Radius.circular(radius5))),
        child: Container(
            padding: EdgeInsets.all(padding10),
            child: Image.asset(
              'assets/images/logo.png',
              height: height120,
              width: width120,
            )));
  }
}
