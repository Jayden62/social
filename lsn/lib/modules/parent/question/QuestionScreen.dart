import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/InputSearchComponent.dart';
import 'package:lsn/component/ProfileComponent.dart';
import 'package:lsn/items/FilterItem.dart';
import 'package:lsn/items/QuestionItem.dart';

class QuestionScreen extends BaseScreen {
  String value = 'Flutter';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// InputSearchComponent
        InputSearchComponent(),

        /// Filter
        _filter(),

        /// Questions
        _questions(),
      ],
    );
  }

  Widget _filter() {
    return Container(
        margin: EdgeInsets.only(top: margin20),
        child: ConfigurableExpansionTile(
            initiallyExpanded: false,
            animatedWidgetFollowingHeader:
                Icon(Icons.expand_more, color: whiteColor),
            headerExpanded: Flexible(
                child: Container(
                    padding: EdgeInsets.all(padding10),
                    alignment: Alignment.center,
                    child: Text(
                      value,
                      style: TextStyle(color: whiteColor, fontSize: font16),
                    ))),
            header: Flexible(
                child: Container(
                    padding: EdgeInsets.all(padding10),
                    alignment: Alignment.center,
                    child: Text(value,
                        style:
                            TextStyle(color: whiteColor, fontSize: font16)))),
            headerBackgroundColorStart: Colors.brown[300],
            headerBackgroundColorEnd: Colors.brown[300],
            children: [
              FilterItem(
                text: 'Flutter',
                onFilter: (String text) {
                  setState(() {
                    value = text;
                  });
                },
              ),
              FilterItem(
                text: 'Android',
                onFilter: (String text) {
                  setState(() {
                    value = text;
                  });
                },
              ),
              FilterItem(
                text: 'iOS',
                onFilter: (String text) {
                  setState(() {
                    value = text;
                  });
                },
              ),
            ]));
  }

  Widget _questions() {
    return Expanded(
      child: ListView(
        children: <Widget>[

          QuestionItem(),

        ],
      ),
    );
  }

  @override
  Widget onInitFloatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding10),
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  @override
  BoxDecoration onInitBackground(BuildContext context) =>
      BoxDecoration(color: Colors.grey[200]);
}
