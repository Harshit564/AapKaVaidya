import 'package:aapkavaidya/drawer/drawer.dart';
import 'package:aapkavaidya/pages/discussions.dart';
import 'package:aapkavaidya/pages/relax_zone_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dashboard_page.dart';
import 'extras_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";

  final String currentUserId;
  HomePage({Key key, @required this.currentUserId}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(currentUserId: currentUserId);
}

class _HomePageState extends State<HomePage> {
  final String currentUserId;


  Future<bool> _onWillPop() {
    Alert(
      style: AlertStyle(
        backgroundColor: Colors.black,
        titleStyle: TextStyle(color: Colors.white,fontFamily: 'OpenSans',),
        descStyle: TextStyle(color: Colors.white,fontFamily: 'OpenSans',),
      ),
      context: context,
      type: AlertType.error,
      title: "Exit",
      desc: "Do you want to exit the app ?",
      buttons: [
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(
                fontFamily: 'OpenSans',
                 color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(false),
          gradient: LinearGradient(colors: [
            Color(0xFF20BF55),
            Color(0xFF01BAEF),
          ]),
        ),
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.white, fontSize: 20),
          ),
          onPressed: () => SystemNavigator.pop(),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  _launchgmail() async {
    const url =
        'mailto:harshitsingh15967@gmail.com?subject=Feedback&body=Feedback for Our Support';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _HomePageState({Key key, @required this.currentUserId});
  final List<Map<String, Object>> _pages = [
    {
      'page': DashboardPage(),
      'appBarTitle': 'Dashboard',
    },
    {
      'page': DiscussionsPage(),
      'appBarTitle': 'Discussions',
    },
    {
      'page': ExtrasPage(),
      'appBarTitle': 'Extras',
    },
    {
      'page': RelaxZonePage(),
      'appBarTitle': 'Relax Zone',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            _pages[_selectedPageIndex]['appBarTitle'],
            style: TextStyle(
              fontFamily: 'OpenSans',
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () => _launchgmail(),
              icon: Icon(
                FlutterIcons.gmail_mco,
                color: Colors.white,
              ),
            )
          ],
        ),
        drawer: GuillotineMenu(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: Container(
          height: 60,
          child: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            type: BottomNavigationBarType.shifting,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  //color: Colors.grey,
                ),
                title: Text(
                  "Dashboard",
                   style: TextStyle(fontFamily: 'OpenSans',),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.message,
                  // color: Colors.grey,
                ),
                title: Text(
                  "Consults",
                  style: TextStyle(fontFamily: 'OpenSans',),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.category,
                  //color: Colors.grey,
                ),
                title: Text(
                  "Extras",
                  style: TextStyle(fontFamily: 'OpenSans',),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.videogame_asset,
                  //  color: Colors.grey,
                ),
                title: Text(
                  "Relax Zone",
                  style: TextStyle(fontFamily: 'OpenSans',),
                ),
              ),
            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
