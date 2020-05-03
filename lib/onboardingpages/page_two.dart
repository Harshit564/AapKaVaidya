import 'dart:async';

import 'package:aapkavaidya/pages/home_page.dart';
import 'package:aapkavaidya/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:aapkavaidya/utils/info.dart';
import 'package:aapkavaidya/utils/mypainter.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final _userRef = Firestore.instance.collection("users");

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    if (user == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } else {
      _userRef.document(user.uid).get().then((DocumentSnapshot snapshot) {
        if (snapshot.data != null)
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(color: Color(0xffffffff)),
            Container(
              child: MyPainter(Color(0xffB2EBF2)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 6,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 6.4,
                      right: SizeConfig.blockSizeHorizontal * 6.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'AapKaVaidya',
                        style: TextStyle(
                            fontFamily: 'Header',
                            fontSize: SizeConfig.blockSizeHorizontal * 5.2,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_userRef == null)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          else
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Header',
                            fontSize: SizeConfig.blockSizeHorizontal * 3.4,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.4,
                            color: Color(0xff546E7A),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 6,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/onboard2.png',
                    fit: BoxFit.contain,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.blockSizeVertical * 38,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 7,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    "Welcome To",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        letterSpacing: 2,
                        fontSize: SizeConfig.blockSizeHorizontal * 7.6,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    "BIRTHPAD",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        letterSpacing: 4,
                        fontSize: SizeConfig.blockSizeHorizontal * 7,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14,
                      right: SizeConfig.blockSizeHorizontal * 14),
                  child: Text(
                    "App that manages birth record and immunization history in real-time!",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      letterSpacing: 0.4,
                      fontSize: SizeConfig.blockSizeHorizontal * 4.2,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 7,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 14,
                      right: SizeConfig.blockSizeHorizontal * 14),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.4,
                        backgroundColor: Color(0xffE0E0E0),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 4,
                      ),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.8,
                        backgroundColor: Color(0xffB0BEC5),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 4,
                      ),
                      CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 1.4,
                        backgroundColor: Color(0xffE0E0E0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
