import 'package:flutter/material.dart';

const String _name = "Harshit";

class ChatMessage extends StatelessWidget {
  final String text;
  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: new Text(_name[0],style: TextStyle(fontFamily: 'OpenSans',color: Colors.black),),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: TextStyle(fontFamily: 'OpenSans',color: Colors.white)),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text, style: TextStyle(fontFamily: 'OpenSans',color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }
}