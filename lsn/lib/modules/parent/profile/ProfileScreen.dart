import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/screen/Screens.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/FeatureComponent.dart';
import 'package:lsn/component/ProfileComponent.dart';
import 'package:lsn/util/DialogUtil.dart';

class ProfileScreen extends BaseScreen {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var dobController = TextEditingController();
  var posController = TextEditingController();
  var countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Jack Le';
    phoneController.text = '093 693 xxxx';
    dobController.text = '1997/02/06';
    posController.text = 'Mobile developer';
    countryController.text = 'Viet Nam Country';
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    posController.dispose();
    countryController.dispose();
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Avatar
        _avatar(),

        /// Base info
        _baseInfo(),

        /// Line
        Divider(color: greyColor, height: 1.0),

        /// Features
        _features(),
      ],
    );
  }

  Widget _features() {
    return Expanded(
      child: ListView(
        children: <Widget>[
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
            onTap: () {},
          ),
        ],
      ),
    );
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
                      'Show infomation',
                      style: TextStyle(color: whiteColor, fontSize: font16),
                    ))),
            header: Flexible(
                child: Container(
                    padding: EdgeInsets.all(padding10),
                    alignment: Alignment.center,
                    child: Text('Show infomation',
                        style:
                            TextStyle(color: whiteColor, fontSize: font16)))),
            headerBackgroundColorStart: Colors.teal[300],
            headerBackgroundColorEnd: Colors.teal[300],
            children: [
              /// Name
              ProfileComponent(
                title: 'Name',
                textEditingController: nameController,
              ),

              /// Phone number
              ProfileComponent(
                title: 'Phone',
                textEditingController: phoneController,
              ),

              /// Day of birth
              ProfileComponent(
                title: 'Day of birth',
                textEditingController: dobController,
              ),

              /// Position
              ProfileComponent(
                title: 'Position',
                textEditingController: posController,
              ),

              /// Country
              ProfileComponent(
                title: 'Country',
                textEditingController: countryController,
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
          Container(
              margin: EdgeInsets.only(left: margin10),
              child: Icon(Icons.edit, color: whiteColor)),
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
          InkWell(
            onTap: () {
              /// Call API update profile
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
