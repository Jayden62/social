import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class BackComponent extends StatefulWidget {
  final Function onBack;

  BackComponent({@required this.onBack});

  @override
  State<StatefulWidget> createState() => _BackComponentState();
}

class _BackComponentState extends State<BackComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onBack(),
      child: Container(
        padding: EdgeInsets.all(padding20),
        child: Text('Back', style: _backStyle),
      ),
    );
  }
}

var _backStyle = TextStyle(fontSize: font16, color: primaryColor);
