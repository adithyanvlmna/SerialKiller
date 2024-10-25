import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:serialkiller/View/homeview.dart';
import 'package:serialkiller/View/loginview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  String? keyy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKey().then((key) {
      setState(() {
        keyy = key;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.network(
            "https://seeklogo.com/images/D/detective-logo-E3D520D0A0-seeklogo.com.png"),
        duration: 3000,
        nextScreen: keyy== null? const Loginview(): const Homeview(),
        pageTransitionType: PageTransitionType.fade,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.red.shade700,
      ),
    );
  }
}

Future<String?> getKey() async {
  final pref = await SharedPreferences.getInstance();
  String? key = pref.getString("token");
  return key;
}
