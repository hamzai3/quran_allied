// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quran_app/login.dart';
import 'package:quran_app/main.dart';
import 'package:quran_app/reset.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _SettingsState extends State<Settings> {
  Constants c = Constants();

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

  // Future<Settings> _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.push(context, CupertinoPageRoute(builder: (_) => Splash()));
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _exitApp(context),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Border.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(c.deviceWidth(context) * 0.1),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              size: 20,
                            )),
                        Row(
                          children: [
                            Text(
                              'Settings',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                                fontFamily: c.fontFamily(type: "bold"),
                                fontSize: c.getFontSizeMedium(context) + 2,
                                // // fontWeight: FontWeight.bold,
                                color: c.primaryColor(),
                              ),
                            )
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              c.menu(context);
                            },
                            child: Icon(
                              Icons.menu,
                              size: 25,
                            )),
                      ],
                    ),
                    c.getDivider(c.deviceHeight(context) * 0.1),
                    Row(
                      children: [
                        InkResponse(
                          child: Container(
                            width: c.deviceWidth(context) * 0.8,
                            // height: 50.0,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: c.primaryColor(),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Text(
                                "Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: c.whiteColor(),
                                  fontWeight: FontWeight.w600,
                                  fontSize: c.getFontSizeMedium(context),
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            await FirebaseAuth.instance.signOut().then((value) {
                              c.setshared("UserName", 'null');
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (_) => Splash()));
                            });
                            // Navigator.of(context).pop();
                            // Navigator.push(context,
                            //     CupertinoPageRoute(builder: (_) => Foreword()));
                          },
                        ),
                      ],
                    ),
                    c.getDivider(c.deviceHeight(context) * 0.05),
                    Row(
                      children: [
                        InkResponse(
                          child: Container(
                            width: c.deviceWidth(context) * 0.8,
                            // height: 50.0,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: c.primaryColor(),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                  color: c.whiteColor(),
                                  fontWeight: FontWeight.w600,
                                  fontSize: c.getFontSizeMedium(context),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigator.of(context).pop();
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (_) => Reset()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
