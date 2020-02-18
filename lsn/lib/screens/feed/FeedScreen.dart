import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/AddTopicComponent.dart';
import 'package:lsn/items/FilterItem.dart';
import 'package:lsn/items/FeedItem.dart';

class FeedScreen extends BaseScreen {
  String value = 'Flutter';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Add topic
        AddTopicComponent(),

        /// Filter
        _filter(),

        /// Questions
        _questions(),
      ],
    );
  }

  Widget _filter() {
    return Container(
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
          FeedItem(
            moreOption: () {
              /// Show bottom more options
            },
          ),
          FeedItem(),
          FeedItem(),
          FeedItem(),
        ],
      ),
    );
  }

  @override
  BoxDecoration onInitBackground(BuildContext context) =>
      BoxDecoration(color: Colors.grey[200]);
}
