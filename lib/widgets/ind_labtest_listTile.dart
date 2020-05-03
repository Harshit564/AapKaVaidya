import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class IndLabTestTile extends StatelessWidget {
  final String labTitle;
  final String labDescription;
  final String imageUrl;
  final String webUrl;

  IndLabTestTile({
    @required this.imageUrl,
    @required this.labTitle,
    @required this.labDescription,
    @required this.webUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.black,
          elevation: 8.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset(imageUrl)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 5.0,
                  right: 8.0,
                ),
                child: Center(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        labTitle,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                        //textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Divider(
                  thickness: 1.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    labDescription,
                    style: TextStyle(
                        fontFamily: 'OpenSans', color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Visit Website: ',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        //color: Color(0xff607D8B),
                      ),
                    ),
                    InkWell(
                        child: new Text(
                          'Tap to visit the Website',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () => launch(webUrl)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}