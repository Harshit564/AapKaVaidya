import 'package:aapkavaidya/drawer/drawer.dart';
import 'package:aapkavaidya/pages/discussions.dart';
import 'package:aapkavaidya/pages/relax_zone_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _pages[_selectedPageIndex]['appBarTitle'],
          style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.settings,
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
                // style: TextStyle(color: Colors.grey),
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
                //style: TextStyle(color: Colors.grey),
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
                //style: TextStyle(color: Colors.grey),
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
                //style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.greenAccent,
        ),
      ),
    );
  }
}
