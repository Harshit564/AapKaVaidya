import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = '/about-page';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  String launchUrl = "";

  Future<dynamic> _launchUrl(String url) async {
    setState(() {
      launchUrl = url;
    });
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $launchUrl';
    }
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

  Future<void> sharer() async {
    await FlutterShare.share(
        title: 'AapKaVaidya Apps share',
        text: 'Download AapKaVaidya Android application',
        linkUrl:
        'https://play.google.com/',
        chooserTitle: 'AapKaVaidya Chooser Title');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _onSettingsButtonsPressed(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              'Follow Us On',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
            content: Container(
              height: 220,
              child: Column(children: [
                ListTile(
                  title: Text(
                    "Facebook",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      //color: Color(0xff5cb3bc)
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: Icon(Feather.facebook,
                        color: Colors.greenAccent,),
                      onPressed: () => _launchUrl(''),
                    ),
                  ),
                ),
                Divider(
                  thickness: 3.0,
                ),
                ListTile(
                  title: Text(
                    "LinkedIn",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      //color: Color(0xff5cb3bc)
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: Icon(Feather.linkedin,
                        color: Colors.greenAccent,),
                      onPressed: () => _launchUrl(''),
                    ),
                  ),
                ),
                Divider(
                  thickness: 3.0,
                ),
                ListTile(
                  title: Text(
                    "Instagram",
                    style: TextStyle(
                      //    color: Color(0xff5cb3bc),
                        fontFamily: 'Montserrat'),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: Icon(Feather.instagram,
                        color: Colors.greenAccent,),
                      onPressed: () => _launchUrl(''),
                    ),
                  ),
                ),
                Divider(
                  thickness: 3.0,
                )
              ]),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                        icon: Icon(Icons.share,
                          color: Colors.greenAccent,),
                        onPressed: sharer,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                        icon: Icon(Icons.feedback,
                          color: Colors.greenAccent,),
                        onPressed: () => _launchgmail(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "About Us",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Feather.send, color: Colors.white),
            onPressed: () => _onSettingsButtonsPressed(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("Aap ka Vaidya",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0)),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Swaasth Ek Zaroorat",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                "Available when you are and without the hassle of the waiting room. Connect in minutes with board-certified physicians and doctoral-level therapists online over live video from your smartphone or tablet \n"
                "Faster and less expensive than a walk in clinic or ER, you can chat with a doctor virtually 24/7, nights and weekends included. Just like an in-person visit, your doctor will take your history and symptoms, perform an exam, and may recommend treatment - including prescriptions and lab work. They can also provide a doctor’s note, if needed.",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}
