import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serialkiller/Utilities/routes.dart';
import 'package:serialkiller/View/detailinputview.dart';
import 'package:serialkiller/View/homeview.dart';
import 'package:serialkiller/View/jobstatusview.dart';
import 'package:serialkiller/View/passwdupdateview.dart';
import 'package:serialkiller/View/profileview.dart';
import 'package:serialkiller/View/splashview.dart';
import 'package:serialkiller/View/workview.dart';
import 'package:serialkiller/ViewModel/itemprovider.dart';
import 'package:serialkiller/ViewModel/loginuserprovider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> Loginuserprovider()),
      ChangeNotifierProvider(create: (context)=> Itemprovider())
    ],
    child: const Root()));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => const Splashview(),
        Routes.home: (context) => const Homeview(),
        Routes.jobstatus:(context)=> const Jobstatusview(),
        Routes.myprofile:(context)=> const Profileview(),
        Routes.changepasswd:(context)=> const Passwdupdateview(),
        Routes.detailinput:(context)=> const Detailinputview(),
        Routes.workview:(context)=> const Workview(),
      },
    );
  }
}
