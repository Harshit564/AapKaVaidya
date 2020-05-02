import 'dart:io';
import 'dart:math';

import 'package:aapkavaidya/pages/about_page.dart';
import 'package:aapkavaidya/pages/discussions.dart';
import 'package:aapkavaidya/pages/my_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:share/share.dart';

class GuillotineMenu extends StatefulWidget {
  @override
  _GuillotineMenuState createState() => _GuillotineMenuState();
}

class _GuillotineMenuState extends State<GuillotineMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey _menuIconkey = GlobalKey();

  final Color _menuBg = Colors.black54;

  Animation<double> _menuAnimation;

  Animation<double> _toolbarTitleFadeAnimation;

  AnimationController _guillotineMenuAnimationController;

  @override
  void initState() {
    super.initState();

/*
This is to check the offset of the menu Icon in top left corner.
    // WidgetsBinding.instance.addPostFrameCallback(_getPosition);
*/

    _guillotineMenuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    )..addListener(() {
        setState(() {});
      });

    // Menu Animation

    _menuAnimation = Tween(begin: -pi / 2, end: 0.0).animate(CurvedAnimation(
        parent: _guillotineMenuAnimationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn));

    // Toolbar Title Transition

    _toolbarTitleFadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_guillotineMenuAnimationController);
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
    _guillotineMenuAnimationController.dispose();
  }

  void _onMenuIconClick() {
    if (_isMenuVisible()) {
      _guillotineMenuAnimationController.reverse();
    } else {
      _guillotineMenuAnimationController.forward();
    }
  }

  bool _isMenuVisible() {
    final AnimationStatus status = _guillotineMenuAnimationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  _onAlertButtonsPressed(context) {
    Alert(
        style: AlertStyle(
          backgroundColor: Colors.black,
          titleStyle:
          TextStyle(fontFamily: 'Montserrat', color: Colors.greenAccent),
          descStyle:
          TextStyle(fontFamily: 'Montserrat', color: Colors.lightGreen),
        ),
        context: context,
        type: AlertType.warning,
        title: "LOG OUT",
        desc: "Do you want to log out your ID ?",
        content: Row(
          children: <Widget>[
            Link(
              child: Text(
                'YES',
                style: TextStyle(color: Colors.lightGreen,fontSize: 20.0),
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
                      color: Colors.lightGreen,
                      fontSize: 20.0
                  )),
            )
          ],
        )).show();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _menuAnimation.value,
      origin: Offset(32.0, 50.0),
      alignment: Alignment.topLeft,
      child: Material(
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
                Expanded(
                  flex: 8,
                  child: _menuItems(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolbar() {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        // padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: <Widget>[_toolbarIcon(), _toolbarTitle()],
        ),
      ),
    );
  }

  Widget _toolbarIcon() {
    return IconButton(
      key: _menuIconkey,
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () => _onMenuIconClick(),
    );
  }

  Widget _toolbarTitle() {
    return FadeTransition(
      opacity: _toolbarTitleFadeAnimation,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Text(
          "Activity",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
        ),
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
            leading: Icon(Icons.account_box, color: Colors.white),
            title: Text(
              'About Us',
              style: TextStyle(
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
                  color: Colors.white,
                ),
              ),
              onTap: () => _onAlertButtonsPressed(context)
          ),
          Divider(
            thickness: 2.0,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.white),
            title: Text(
              'Share',
              style: TextStyle(
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
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'Settings',
              style: TextStyle(
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
        ],
      ),
    );
  }
}
