import 'package:flutter/material.dart';
import 'package:lsn/base/style/BaseStyle.dart';

class AddTopicComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTopicComponentState();
}

class _AddTopicComponentState extends State<AddTopicComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin10, left: margin10, right: margin10),
      child: Column(
        children: <Widget>[
          /// Feed back
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Hoard dumple',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: font22),
              ),
              InkWell(
                onTap: () {},
                child: Icon(Icons.feedback, size: size20, color: Colors.grey),
              ),
            ],
          ),

          /// Add topic

          Container(
              margin: EdgeInsets.only(top: margin5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /// Photo
                  Row(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints.expand(
                            height: height40, width: width40),
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: widthAHalf, color: greyColor),
                            image: DecorationImage(
                              image: AssetImage('assets/images/admin.jpg'),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: margin10),
                        child: Text('Add topic.'),
                      ),
                    ],
                  ),

                  /// Create
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Icon(Icons.create),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
