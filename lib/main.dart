import 'package:aapkavaidya/pages/home_page.dart';
import 'package:aapkavaidya/pages/login_page.dart';
import 'package:aapkavaidya/pages/my_profile_page.dart';
import 'package:aapkavaidya/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:aapkavaidya/onboardingpages/onboarding_screen.dart';
import 'package:aapkavaidya/widgets/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData(primaryColor: Colors.black)),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      theme: theme.getTheme(),
      home: AnimatedSplashScreen(),
      title: 'Aap ka Vedya',
      debugShowCheckedModeBanner: false,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        MyProfilePage.routeName: (context) => MyProfilePage(),
      },
    );
  }
}
