import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lsn/base/screen/BaseScreen.dart';
import 'package:lsn/base/style/BaseStyle.dart';
import 'package:lsn/component/BackComponent.dart';
import 'package:lsn/component/CommonButtonComponent.dart';
import 'package:lsn/component/DescriptionComponent.dart';
import 'package:lsn/component/InputSelectComponent.dart';
import 'package:lsn/component/InputTextComponent.dart';
import 'package:lsn/middle/model/CountryRequest.dart';
import 'package:lsn/util/DialogUtil.dart';
import 'package:lsn/util/SnackbarUtil.dart';

class AdditionalScreen extends BaseScreen {
  var nameController = TextEditingController();
  var dobController = TextEditingController();
  var posController = TextEditingController();
  var countryController = TextEditingController();
  var desController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<CountryRequest> countries = List();

  DateTime selectedDate = DateTime.now();

  List<String> posArray = [
    'Web Developer',
    'Mobile Developer',
    'AL Developer',
    'System Admin'
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(), () async {
      /// Get countries
      await _getCountries();
    });
  }

  _getCountries() async {
    String jsonProvince =
        await rootBundle.loadString('assets/files/country.json');
    final provinceList = json.decode(jsonProvince);
    for (var item in provinceList) {
      CountryRequest value = CountryRequest.fromJson(item);
      countries.add(value);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dobController.dispose();
    posController.dispose();
    countryController.dispose();
    desController.dispose();
  }

  @override
  Widget onInitBody(BuildContext context) {
    return Column(
      children: <Widget>[
        /// Avatar
        _avatar(),

        /// Views
        _views(),

        /// BackComponent
        BackComponent(onBack: () => popScreen(context)),
      ],
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dobController.text = selectedDate.toString();
      });
  }

  Widget _posItem(String text, {Function(String text) callback}) {
    return InkWell(
        onTap: () {
          popScreen(context);
          callback(text);
        },
        child: Container(
          padding: EdgeInsets.all(padding20),
          child: Text(text),
        ));
  }

  void _selectPosition(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              height: height300,
              child: ListView.builder(
                  itemCount: posArray.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _posItem(posArray[index], callback: (String pos) {
                        setState(() {
                          posController.text = pos;
                        });
                      })));
        });
  }

  Widget _views() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// Name
            InputTextComponent(
                label: 'Name', textEditingController: nameController),

            /// Day of birth
            InputSelectComponent(
              label: 'Day of birth',
              textEditingController: dobController,
              hint: 'Optional.',
              onSelect: () {
                /// Show select date
                _selectDate(context);
              },
            ),

            /// Position
            InputSelectComponent(
              label: 'Position',
              textEditingController: posController,
              hint: 'Select',
              onSelect: () {
                /// Show select position
                _selectPosition(context);
              },
            ),

            /// Country
            InputSelectComponent(
              label: 'Country',
              textEditingController: countryController,
              hint: 'Select',
              onSelect: () {},
            ),

            /// Description
            DescriptionComponent(textEditingController: desController),

            /// Submit
            CommonButtonComponent(
              text: 'Submit',
              width: width150,
              enable: true,
              margin: EdgeInsets.only(
                  top: margin40, left: margin20, right: margin20),
              onPress: () {
                if (_validate()) {
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _validate() {
    if (nameController.text.isEmpty ||
        posController.text.isEmpty ||
        countryController.text.isEmpty) {
      /// Show snack bar
      SnackBarUtil()
          .showSnackBar(scaffoldKey: _scaffoldKey, message: 'Input empty !');
      return true;
    }
    return false;
  }

  Widget _avatar() {
    return InkWell(
      onTap: () {
        DialogUtil().showPhotoDialog(context);
      },
      child: Container(
        height: height100,
        width: width100,
        margin: EdgeInsets.only(top: margin20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: widthAHalf, color: greyColor)),
        child: ClipOval(
          child: Image.asset('assets/images/verify.png'),
        ),
      ),
    );
  }

  @override
  Key onInitKey(BuildContext context) {
    return _scaffoldKey;
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    /// Default appbar is transparent.
    return PreferredSize(
        preferredSize: Size.fromHeight(height0),
        child: AppBar(
          backgroundColor: appBarColor,
          elevation: elevation0,
        ));
  }
}
