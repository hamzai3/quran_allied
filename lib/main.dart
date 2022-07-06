import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/foreword.dart';
import 'package:quran_app/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran by Maulana Muhammad Ali ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Poppins-Regular',
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Constants c = Constants();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      c.getshared("UserName").then((value) {
        if (value != 'null') {
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => Foreword()));
        } else {
          Navigator.push(context, CupertinoPageRoute(builder: (_) => Login()));
        }
      });
      // CupertinoPageRoute(builder: (context) => Login());
    });
  }

  var close = 0;
  Future<bool> _exitApp(BuildContext context) async {
    if (close == 0) {
      c.showInSnackBar(context, "Press back again to EXIT");
      close++;
    } else {
      exit(0);
    }
    // Scaffold.of(context).showSnackBar(
    //   const SnackBar(content: Text("No back history item")),
    // );
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _exitApp(context),
        child: Scaffold(
          body: SafeArea(
              child: Image.asset(
            "assets/splash.png",
            width: c.deviceWidth(context),
            fit: BoxFit.fill,
          )),
        ));
  }
}
