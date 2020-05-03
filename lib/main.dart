import 'package:aapkavaidya/minigameminesweeper/minesweeper.dart';
import 'package:aapkavaidya/pages/about_page.dart';
import 'package:aapkavaidya/pages/dashboard_page.dart';
import 'package:aapkavaidya/pages/discussions.dart';
import 'package:aapkavaidya/pages/extras_page.dart';
import 'package:aapkavaidya/pages/home_page.dart';
import 'package:aapkavaidya/pages/hospitals_page.dart';
import 'package:aapkavaidya/pages/login_page.dart';
import 'package:aapkavaidya/pages/medicines_page.dart';
import 'package:aapkavaidya/pages/my_profile_page.dart';
import 'package:aapkavaidya/pages/relax_zone_page.dart';
import 'package:aapkavaidya/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:aapkavaidya/onboardingpages/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith());
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.black,
      )),
      home: AnimatedSplashScreen(),
      title: 'Aap ka Vaidya',
      debugShowCheckedModeBanner: false,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        MyProfilePage.routeName: (context) => MyProfilePage(),
        AboutPage.routeName: (context) => AboutPage(),
        DiscussionsPage.routeName: (context) => DiscussionsPage(),
        ExtrasPage.routeName: (context) => ExtrasPage(),
        RelaxZonePage.routeName: (context) => RelaxZonePage(),
        DashboardPage.routeName: (context) => DashboardPage(),
        MinesweeperGame.routeName: (context) => MinesweeperGame(),
        HospitalsPage.routeName: (context) => HospitalsPage(),
        MedicinesPage.routeName: (context) => MedicinesPage(),
      },
    );
  }
}
