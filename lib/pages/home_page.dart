import 'package:aapkavaidya/drawer/drawer.dart';
import 'package:aapkavaidya/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

enum SingingCharacter { light, dark, fault }

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  SingingCharacter _character = SingingCharacter.light;

  Future<bool> _onSettingsButtonsPressed(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              'Change the theme',
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 200,
              child: Column(children: [
                ListTile(
                  title: Text(
                    "Dark",
                  ),
                  leading: Icon(
                    Feather.moon,
                    //    color: Colors.black
                  ),
                  trailing: Radio(
                    value: SingingCharacter.dark,
                    groupValue: _character,
                    activeColor: Color(0xff5cb3bc),
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _themeChanger.setTheme(ThemeData.dark());
                      });
                    },
                  ),
                ),
                Divider(
                  thickness: 3.0,
                ),
                ListTile(
                  title: Text(
                    "Light",
                  ),
                  leading: Icon(
                    Feather.sun,
                    //    color: Colors.black
                  ),
                  trailing: Radio(
                    //hoverColor: Color(0xffCBE7EA),
                    value: SingingCharacter.light,
                    groupValue: _character,
                    activeColor: Color(0xff5cb3bc),
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _themeChanger.setTheme(
                            ThemeData(primaryColor: Color(0xffCBE7EA)));
                      });
                    },
                  ),
                ),
                Divider(
                  thickness: 3.0,
                ),
                ListTile(
                  title: Text(
                    "Custom",
                    style: TextStyle(
                        //    color: Color(0xff5cb3bc),
                        ),
                  ),
                  leading: Icon(
                    Feather.activity,
                    //color: Colors.black
                  ),
                  trailing: Radio(
                    value: SingingCharacter.fault,
                    groupValue: _character,
                    activeColor: Color(0xff5cb3bc),
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _themeChanger.setTheme(
                            ThemeData(primaryColor: Color(0xff5cb3bc)));
                      });
                    },
                  ),
                ),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Feather.settings),
            onPressed: () => _onSettingsButtonsPressed(context),
            tooltip: "Log Out",
          ),
        ],
      ),
      body: new Container(
      ),
      drawer: GuillotineMenu(),
    );
  }
}
