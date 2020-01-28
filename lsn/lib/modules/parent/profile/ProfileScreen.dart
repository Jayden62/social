import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/FeatureComponent.dart';
import 'package:lsn/component/ProfileComponent.dart';
import 'package:lsn/util/DialogUtil.dart';

class ProfileScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Avatar
        _avatar(),

        /// Name
        Container(
            margin: EdgeInsets.only(top: margin20),
            child: Text('Jack Le',
                style:
                    TextStyle(fontSize: font16, fontWeight: FontWeight.bold))),

        /// Description

        Container(
            decoration: BoxDecoration(color: desColor),
            padding: EdgeInsets.all(padding10),
            margin:
                EdgeInsets.only(top: margin5, left: margin10, right: margin10),
            child: Text(
              'I love coding, i like to create new products to deserve living demand people.',
            )),

        /// Base info
        _baseInfo(),

        /// Features
        _features(),
      ],
    );
  }

  Widget _features() {
    return Expanded(
        child: ListView(
      children: <Widget>[
        /// Line
        Divider(color: greyColor, height: 1.0),

        /// View all posts
        FeatureComponent(
          text: 'View posts',
          onTap: () {
            pushScreen(
                context,
                BaseWidget(
                  screen: Screens.VIEW_POST,
                ));
          },
        ),

        /// New features
        FeatureComponent(
          text: 'News features',
          onTap: () {
            pushScreen(
                context,
                BaseWidget(
                  screen: Screens.NEW_FEATURE,
                ));
          },
        ),
      ],
    ));
  }

  Widget _baseInfo() {
    return Container(
        margin: EdgeInsets.only(top: margin20),
        child: ConfigurableExpansionTile(
            initiallyExpanded: true,
            animatedWidgetFollowingHeader:
                Icon(Icons.expand_more, color: whiteColor),
            headerExpanded: Flexible(
                child: Container(
                    padding: EdgeInsets.all(padding10),
                    alignment: Alignment.center,
                    child: Text(
                      'Hide detail',
                      style: TextStyle(color: whiteColor, fontSize: font16),
                    ))),
            header: Flexible(
                child: Container(
                    padding: EdgeInsets.all(padding10),
                    alignment: Alignment.center,
                    child: Text('Show detail',
                        style:
                            TextStyle(color: whiteColor, fontSize: font16)))),
            headerBackgroundColorStart: Colors.teal[300],
            headerBackgroundColorEnd: Colors.teal[300],
            children: [
              /// Phone number
              ProfileComponent(
                title: 'Phone',
                value: '093 693 xxxx',
              ),

              /// Day of birth
              ProfileComponent(
                title: 'Day of birth',
                value: '1997/02/06',
              ),

              /// Position
              ProfileComponent(
                title: 'Position',
                value: 'Mobile developer',
              ),

              /// Country
              ProfileComponent(
                title: 'Country',
                value: 'Viet Nam Country',
              ),
            ]));
  }

  Widget _avatar() {
    return Container(
      margin: EdgeInsets.only(top: margin10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// Bonus
          Container(
              margin: EdgeInsets.only(left: margin10),
              child: Text('20',
                  style: TextStyle(
                      color: Colors.teal[300], fontWeight: FontWeight.bold))),

          /// Avatar
          InkWell(
              onTap: () {
                DialogUtil().showPhotoDialog(context);
              },
              child: Container(
                height: height100,
                width: width100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: widthAHalf, color: greyColor)),
                child: ClipOval(
                  child: Image.asset('assets/images/verify.png'),
                ),
              )),

          /// Edit profile
          InkWell(
            onTap: () {
              pushScreen(
                  context,
                  BaseWidget(
                    screen: Screens.EDIT_PROFILE,
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(right: margin10),
              child: Icon(Icons.edit, color: Colors.teal[300]),
            ),
          )
        ],
      ),
    );
  }
}
