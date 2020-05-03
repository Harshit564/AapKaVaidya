import 'package:aapkavaidya/constants.dart';
import 'package:aapkavaidya/models/treatment_slides.dart';
import 'package:aapkavaidya/pages/discussions.dart';
import 'package:aapkavaidya/pages/hospitals_page.dart';
import 'package:aapkavaidya/pages/lab_test_page.dart';
import 'package:aapkavaidya/pages/medicines_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:link/link.dart';
import 'package:url_launcher/url_launcher.dart';

enum VisibilityFlag {
  visible,
  invisible,
}

class DashboardPage extends StatefulWidget {
  static const String routeName = "/dashboard-page";

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _width;
  double _height;

  VisibilityFlag visibility = VisibilityFlag.invisible;

  double offset = 0.0;

  ScrollController scrollController = ScrollController();

  List<TreatmentsSlides> treatmentsSlides;

  @override
  void initState() {
    treatmentsSlides = Constants.getTreatmentsSlides();

    scrollController.addListener(() {
      setState(() {
        offset = scrollController.offset;
        if (_chnageAppbar) {
          visibility = VisibilityFlag.visible;
        } else {
          visibility = VisibilityFlag.invisible;
        }
      });
    });
    super.initState();
  }

  bool get _chnageAppbar {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }

  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 120.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiscussionsPage())),
                              child: Container(
                                padding: EdgeInsets.only(top: 0.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.face,
                                      color: Colors.greenAccent,
                                      size: 95.0,
                                    ),
                                    Text(
                                      'Talk to Doctor',
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HospitalsPage())),
                              child: Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.local_hospital,
                                      color: Colors.greenAccent,
                                      size: 75.0,
                                    ),
                                    Text(
                                      'Hospitals',
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedicinesPage())),
                              child: Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.greenAccent,
                                      size: 75.0,
                                    ),
                                    Text(
                                      'Medicines',
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LabTestPage())),
                              child: Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.cancel,
                                      color: Colors.greenAccent,
                                      size: 75.0,
                                    ),
                                    Text(
                                      'Lab Tests',
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: _width,
                        height: _height / 5.5,
                        // color: Colors.orange,
                        child: ListView.builder(
                            itemCount: treatmentsSlides.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildTreatmentSlides(
                                  treatmentsSlides[index]);
                            }),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Full Body Health Checkup',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/male.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text(
                                                  'Below 40',
                                                  style: TextStyle(
                                                      fontFamily: 'OpenSans',
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text(
                                                  'year',
                                                  style: TextStyle(
                                                      color: Colors.grey[100],
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0, left: 10.0),
                                          alignment: Alignment.centerLeft,
                                          height: _height / 40.0,
                                          width: _width / 6.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color: Colors.indigo,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Male',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/male.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text(
                                                  'Above 40',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text(
                                                  'year',
                                                  style: TextStyle(
                                                      color: Colors.grey[100],
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0, left: 10.0),
                                          alignment: Alignment.centerLeft,
                                          height: _height / 40.0,
                                          width: _width / 6.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color: Colors.indigo,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Male',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/female.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text(
                                                  'Below 40',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text(
                                                  'year',
                                                  style: TextStyle(
                                                      color: Colors.grey[100],
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0, left: 10.0),
                                          alignment: Alignment.centerLeft,
                                          height: _height / 40.0,
                                          width: _width / 6.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color: Colors.redAccent,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Female',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(),
                          Container(
                            //color: Colors.red,
                            height: _height / 4.6,
                            width: _width / 2.4,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 4.5,
                                    width: _width / 2.4,
                                    child: ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'assets/images/female.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 60.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 10.0),
                                                child: Text(
                                                  'Above 40',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 0.0, left: 5.0),
                                                child: Text(
                                                  'year',
                                                  style: TextStyle(
                                                      color: Colors.grey[100],
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0, left: 10.0),
                                          alignment: Alignment.centerLeft,
                                          height: _height / 40.0,
                                          width: _width / 6.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color: Colors.redAccent,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Female',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: _width,
                        height: _height / 17.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 1.0, color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                        child: Center(
                          child: Link(
                            url: 'https://www.houseofdiagnostics.com/online-reports/',
                            onError: _showErrorSnackBar,
                            child: Text("See all Lab Test >",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Charts & Sessions',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: _width / 2.3,
                            height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                            child: Card(
                              elevation: 2.0,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 0.0, left: 10.0, right: 0.0),
                                          child: Text(
                                            'Manage Weight',
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(3),
                                              topRight: Radius.circular(5),
                                              bottomLeft:
                                                  Radius.circular(90.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              ClipPath(
// clipper: CustomShapeClipper2(),
                                                child: Container(
// margin: EdgeInsets.only(left: 80.0),
// padding: EdgeInsets.all(10.0),
                                                  height: _height / 10,
                                                  width: _width / 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.pink),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0),
                                                    child: Icon(
                                                      Icons.event,
                                                      size: 45.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.0,
                                          left: 15.0,
                                          right: 10.0,
                                          bottom: 10.0),
                                      child: Text(
                                        'Lose or gain weight Get Diet Chart from nutritionist',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.10),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20.0),
                                    height: 0.7,
                                    color: Colors.black26,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DiscussionsPage())),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: _height / 20.0,
                                      padding:
                                          EdgeInsets.only(top: 10.0, left: 15.0),
                                      child: Text(
                                        'Get Advice',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
// width:18.5,
                              ),
                          Container(
                            width: _width / 2.3,
                            height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                            child: Card(
                              elevation: 2.0,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 10.0,
                                              right: 0.0),
                                          child: Text(
                                            'Hair Issues',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(3),
                                              topRight: Radius.circular(5),
                                              bottomLeft:
                                                  Radius.circular(90.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              ClipPath(
// clipper: CustomShapeClipper2(),
                                                child: Container(
// margin: EdgeInsets.only(left: 80.0),
                                                  padding: EdgeInsets.only(
                                                      left: 20.0),
                                                  height: _height / 10,
                                                  width: _width / 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black),
                                                  child: Icon(
                                                    Icons.cake,
                                                    size: 45.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.0,
                                          left: 15.0,
                                          right: 10.0,
                                          bottom: 10.0),
                                      child: Text(
                                        'Find out the bset treatment plan for your Hair Issues ',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.10),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20.0),
                                    height: 0.7,
                                    color: Colors.black26,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DiscussionsPage())),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: _height / 20.0,
                                      padding:
                                          EdgeInsets.only(top: 10.0, left: 15.0),
                                      child: Text(
                                        'Get Advice',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Self Tests Free',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: _width / 2.3,
                              height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 0.0,
                                                left: 10.0,
                                                right: 0.0),
                                            child: Text(
                                              'Depression',
                                              style: TextStyle(
                                                  color: Colors.indigoAccent,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w700),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3),
                                                topRight: Radius.circular(5),
                                                bottomLeft:
                                                    Radius.circular(90.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                ClipPath(
// clipper: CustomShapeClipper2(),
                                                  child: Container(
// margin: EdgeInsets.only(left: 80.0),
// padding: EdgeInsets.all(10.0),
                                                    height: _height / 10,
                                                    width: _width / 5,
                                                    decoration: BoxDecoration(
                                                        color: Colors.indigo),
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20.0),
                                                      child: Icon(
                                                        Icons.tag_faces,
                                                        size: 45.0,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 15.0,
                                            right: 10.0,
                                            bottom: 10.0),
                                        child: Text(
                                          'this word renowned test checks your mental health.',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.10),
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 20.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LabTestPage())),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: _height / 20.0,
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0),
                                        child: Text(
                                          'Take Test',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
// width:18.5,
                                ),
                            Container(
                              width: _width / 2.3,
                              height: _height / 3.5,
// margin: EdgeInsets.only(right: 5.0),
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 0.0,
                                                left: 15.0,
                                                right: 10.0),
                                            child: Text(
                                              'Thyroid Check',
                                              style: TextStyle(
                                                  color: Colors.brown,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3),
                                                topRight: Radius.circular(5),
                                                bottomLeft:
                                                    Radius.circular(90.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                ClipPath(
// clipper: CustomShapeClipper2(),
                                                  child: Container(
// margin: EdgeInsets.only(left: 80.0),
                                                    padding: EdgeInsets.only(
                                                        left: 20.0),
                                                    height: _height / 10,
                                                    width: _width / 5,
                                                    decoration: BoxDecoration(
                                                        color: Colors.brown),
                                                    child: Icon(
                                                      Icons.bug_report,
                                                      size: 45.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0,
                                            left: 15.0,
                                            right: 10.0,
                                            bottom: 10.0),
                                        child: Text(
                                          'this word renowned test checks your mental health.',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.10),
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 20.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LabTestPage())),
                                      child: Container(
                                        height: _height / 20.0,
                                        alignment: Alignment.centerLeft,
                                        padding:
                                            EdgeInsets.only(top: 0.0, left: 15.0),
                                        child: Text(
                                          'Take Test',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'E-books & Guides',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: _width / 2.3,
                              height: _height / 2.3,
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: _height / 9,
                                          width: _width,
                                          color: Colors.pink[50],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0,
                                              left: 20.0,
                                              right: 0.0),
                                          //color: Colors.pink,
                                          height: _height / 7,
                                          width: _width / 5,
                                          child: Image.asset(
                                            'assets/images/booksImage.jpeg',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'Erectile Dysfunction',
                                          style: TextStyle(
                                              color: Colors.indigo,
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.8),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'This ebook will help you understand the symptoms,causes',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.8,
                                              fontSize: 12.0,
                                              height: 1.3),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),
                                    Expanded(
                                      child: Container(
                                        // alignment: Alignment.centerLeft,
// height: _height,
                                        padding: EdgeInsets.only(
                                            top: 5.0, left: 15.0, right: 20.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'PREVIEW',
                                                  style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0),
                                                  textAlign: TextAlign.center,
                                                ),
                                                InkWell(
                                                  onTap: () => launch('https://www.free-ebooks.net/health'),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    padding: EdgeInsets.only(
                                                        bottom: 5.0),
                                                    child: Icon(
                                                      Icons.open_in_new,
                                                      size: 18.0,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
// width:18.5,
                                ),
                            Container(
                              width: _width / 2.3,
                              height: _height / 2.3,
// margin: EdgeInsets.only(right: 5.0),
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: _height / 9,
                                          width: _width,
                                          color: Colors.cyan[50],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0,
                                              left: 20.0,
                                              right: 0.0),
                                          //color: Colors.pink,
                                          height: _height / 7,
                                          width: _width / 5,
                                          child: Image.asset(
                                            'assets/images/booksImage.jpeg',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'Erectile Dysfunction',
                                          style: TextStyle(
                                              color: Colors.indigo,
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.8),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        child: Text(
                                          'Over 33% Indian men suffer from PE but dont know',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.8,
                                              fontSize: 12,
                                              height: 1.3),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15.0),
                                      height: 0.7,
                                      color: Colors.black26,
                                    ),
                                    Expanded(
                                      child: Container(
                                        // alignment: Alignment.centerLeft,
// height: _height,
                                        padding: EdgeInsets.only(
                                            top: 5.0, left: 15.0, right: 20.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  'PREVIEW',
                                                  style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0),
                                                  textAlign: TextAlign.center,
                                                ),
                                                InkWell(
                                                  onTap: () => launch('https://www.free-ebooks.net/health'),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    padding: EdgeInsets.only(
                                                        bottom: 5.0),
                                                    child: Icon(
                                                      Icons.shopping_cart,
                                                      size: 18.0,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: _width,
                        height: _height / 17.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 1.0, color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                        child: Center(
                          child: Link(
                            url: 'https://www.elsevier.com/health',
                            onError: _showErrorSnackBar,
                            child: Text("E-Books & Guides >",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Doctors Blogs & Tips',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
// color: Colors.white,
                        height: _height / 2,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/mensday_int.jpg',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes'
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/HealthProductImage.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Daily Digest',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  'Cuarted Health Tips',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: InkWell(
                                  onTap: () => launch(('https://blog.feedspot.com/doctor_blogs/')),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/google_logo.png',
                                        fit: BoxFit.fill,
                                        height: _height / 17,
                                        width: _width / 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
// color: Colors.white,
                        height: _height / 2.0,
                        width: _width,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/hair_los.jpg',
                                      fit: BoxFit.cover,
                                      width: _width,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 5.0, left: 15.0, right: 10.0),
                                  child: Text(
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes'
                                    'This ebook will help you understand the symptoms,causes This ebook will help you understand the symptoms,causes',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.8,
                                        fontSize: 12.0,
                                        wordSpacing: 1.5),
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/HealthProductImage.png',
                                      fit: BoxFit.fill,
                                      height: _height / 17,
                                      width: _width / 8,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'Daily Digest',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                subtitle: Text(
                                  'Cuarted Health Tips',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10.0),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: InkWell(
                                  onTap: () => launch('https://blog.feedspot.com/doctor_blogs/'),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/google_logo.png',
                                        fit: BoxFit.fill,
                                        height: _height / 17,
                                        width: _width / 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: _width,
                        height: _height / 17.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 1.0, color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                        ),
                        child: Center(
                          child: Link(
                            url: 'https://www.healthline.com/health-news',
                            onError: _showErrorSnackBar,
                            child: Text("Other Health Articles >",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: visibility == VisibilityFlag.visible &&
                visibility != VisibilityFlag.invisible,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Container(
                height: _height / 5,
                width: _width,
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 45.0, left: 20.0, right: 20.0, bottom: 5.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DiscussionsPage())),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.face,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'Talk to Doctor',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalsPage())),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.local_hospital,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'Hospitals',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MedicinesPage())),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.monetization_on,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'Medicines',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LabTestPage())),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'Lab Tests',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreatmentSlides(TreatmentsSlides item) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 5.0),
      child: Card(
        color: Colors.black,
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 0.0, left: 10.0, right: 5.0),
                    child: Text(
                      item.title,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0),
                      maxLines: 3,
                    ),
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(90.0)),
                    child: Container(
                      height: _height / 10.0,
                      width: _width / 3.2,
                      child: Image.asset(
                        item.imgUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
                    child: Text(
                      item.subTitle,
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5),
                      maxLines: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 5.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 20,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(width: 1.0, color: Colors.white),
                      color: Colors.greenAccent,
                    ),
                    child: Link(
                      url: 'https://www.fitwise.com.au/',
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            item.buttonTitle,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
