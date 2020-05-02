import 'package:aapkavaidya/minigamefiar/match_page.dart';
import 'package:aapkavaidya/minigamequizzler/quiz_game.dart';
import 'package:aapkavaidya/minigameminesweeper/minesweeper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music_player/music_player.dart';

class RelaxZonePage extends StatefulWidget {
  static const String routeName = '/relax-page';


  @override
  _RelaxZonePageState createState() => _RelaxZonePageState();
}

class _RelaxZonePageState extends State<RelaxZonePage> {

  MusicPlayer musicPlayer;
  String _duration = "";
  final _durationInputController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Initializing the Music Player and adding a single [PlaylistItem]
  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }

  Future<bool> _onDurationButtonPressed(BuildContext context)
  {
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
        {
          return new AlertDialog(
            title: Center(
              child: Text("Set Duration for song",
              style: TextStyle(color: Colors.black),),
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 96,
                child: Column(
                  children: <Widget>[TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.edit_attributes,
                        color: Colors.greenAccent,
                      ),
                      hintText: 'Set the duration',
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onTap: () => setState(() {
                      _duration = _durationInputController.text.toString();
                    })
                  ),
                    FlatButton(
                      color: Colors.black,
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        'SET',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ],
                ),
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: Material(
                color: Colors.black,
                elevation: 14,
                borderRadius: BorderRadius.circular(30.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text("Games",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: Icon(SimpleLineIcons.game_controller,color: Colors.greenAccent,),
                          title: Text('Minesweeper Game',
                          style: TextStyle(
                            color: Colors.white
                          ),),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(FlutterIcons.fantasy_flight_games_faw5d,color: Colors.black,),
                              onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => MinesweeperGame())),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(SimpleLineIcons.game_controller,color: Colors.greenAccent,),
                          title: Text('Fiar Game',
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(FlutterIcons.games_mdi,color: Colors.black,),
                              onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => MatchPage())),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: Icon(SimpleLineIcons.game_controller,color: Colors.greenAccent,),
                          title: Text('Quizzler Game',
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Image.asset('assets/images/google_logo.png'),
                              onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage())),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: Material(
                color: Colors.black,
                elevation: 14,
                borderRadius: BorderRadius.circular(30.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text("Music",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent
                          ),),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.black),
                              onPressed: () => _onDurationButtonPressed(context),
                            ),
                          ),
                          title: Text('Music One',
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(FlutterIcons.play_video_fou,color: Colors.black,),
                              onPressed: () => musicPlayer.play(MusicItem(
                                trackName: 'Sample',
                                albumName: 'Sample Album',
                                artistName: 'Sample Artist',
                                url: 'https://goo.gl/5RQjTQ',
                                coverUrl: 'https://goo.gl/Wd1yPP',
                                duration: Duration(seconds: 30),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.black),
                              onPressed: () => _onDurationButtonPressed(context),
                            ),
                          ),
                          title: Text('Music Two',
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(FlutterIcons.play_video_fou,color: Colors.black,),
                              onPressed: () =>  musicPlayer.play(MusicItem(
                                trackName: 'Sample',
                                albumName: 'Sample Album',
                                artistName: 'Sample Artist',
                                url: 'https://goo.gl/5RQjTQ',
                                coverUrl: 'https://goo.gl/Wd1yPP',
                                duration: Duration(seconds: 20),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.black),
                              onPressed: () => _onDurationButtonPressed(context),
                            ),
                          ),
                          title: Text('Music Three',
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(FlutterIcons.play_video_fou,color: Colors.black,),
                              onPressed: () =>  musicPlayer.play(MusicItem(
                                trackName: 'Sample',
                                albumName: 'Sample Album',
                                artistName: 'Sample Artist',
                                url: 'https://goo.gl/5RQjTQ',
                                coverUrl: 'https://goo.gl/Wd1yPP',
                                duration: Duration(seconds: 30),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
