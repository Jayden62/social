import 'package:flutter/cupertino.dart';

abstract class BaseItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return onInitItem(context);
  }

  Widget onInitItem(BuildContext context);
}
