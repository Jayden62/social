import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/AddTopicComponent.dart';
import 'package:lsn/items/FeedItem.dart';
import 'package:lsn/util/BottomUtil.dart';
import 'package:lsn/util/DialogUtil.dart';

class FeedScreen extends BaseScreen {
  String value = 'Flutter';
  bool _show = true;
  ScrollController _scrollController = ScrollController();
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();

    /// Show or hide topic when start scrolling list.
    _scrollTopic();
  }

  void _scrollTopic() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showTopic();
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _hideTopic();
        }
      }
    });
  }

  _showTopic() {
    setState(() {
      _show = true;
    });
  }

  _hideTopic() {
    setState(() {
      _show = false;
    });
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Add topic
        _addTopic(),

        /// Questions
        _questions(),
      ],
    );
  }

  Widget _addTopic() {
    Widget view;
    if (_show) {
      view = AddTopicComponent(
        feedBack: () {
          /// Show feed back
          DialogUtil.instance.showFeedbackDialog(context);
        },
        addTopic: () {
          /// Navigate add topic screen
          pushScreen(
              context,
              BaseWidget(
                screen: Screens.ADD_TOPIC,
              ));
        },
      );
    } else {
      view = Container(height: height0);
    }
    return view;
  }

  Widget _questions() {
    return Expanded(
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          FeedItem(
            moreOption: () {
              /// Show bottom more options
              BottomUtil.instance.showMoreOptions(context);
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
