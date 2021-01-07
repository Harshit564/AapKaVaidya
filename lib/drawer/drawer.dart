import 'dart:io';
import 'dart:math';

import 'package:aapkavaidya/pages/about_page.dart';
import 'package:aapkavaidya/pages/discussions.dart';
import 'package:aapkavaidya/pages/my_profile_page.dart';
import 'package:aapkavaidya/pages/near_hospital_page.dart';
import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class GuillotineMenu extends StatefulWidget {
  @override
  _GuillotineMenuState createState() => _GuillotineMenuState();
}

class _GuillotineMenuState extends State<GuillotineMenu> {
  final Color _menuBg = Colors.black54;

  @override
  void initState() {
    super.initState();
  }

  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onSettingsButtonsPressed(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              'Covid Tracker',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    'Do you want to know about the current status of Pandemic?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  Link(
                    child: FlatButton(
                      child: Text('YES',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.greenAccent,
                              fontSize: 20.0)),
                    ),
                    url: 'https://www.orfonline.org/covid19-tracker/',
                    onError: _showErrorSnackBar,
                  ),
                  SizedBox(
                    width: 116,
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('NO',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.greenAccent,
                            fontSize: 20.0)),
                  )
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _menuBg,
      child: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: _toolbar(),
              ),
            ],
          ),
        ),
      ),
//      ),
    );
  }

  Widget _toolbar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _toolbarTitle(),
        _menuItems(),
      ],
    );
  }

  Widget _toolbarTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 36),
      child: Text(
        "Activity",
        style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _menuItems() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.white),
            title: Text(
              'Nearby Hospitals',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NearHospital(),
                ),
              );

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box, color: Colors.white),
            title: Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.chat, color: Colors.white),
            title: Text(
              'Discussions',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiscussionsPage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text(
              'Profile Page',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfilePage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
              leading: Icon(Icons.track_changes, color: Colors.white),
              title: Text(
                'Covid19 Tracker',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                ),
              ),
              onTap: () => _onSettingsButtonsPressed(context)),
          Divider(
            thickness: 2.0,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.white),
            title: Text(
              'Share',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            onTap: () {
              RenderBox box = context.findRenderObject();
              Share.share('Hello this is a test',
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: Colors.white),
            title: Text(
              'Feedback',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            onTap: () => _launchgmail(),

            // Update the state of the app.
          ),
        ],
      ),
    );
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
}
