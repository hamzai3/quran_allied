// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quran_app/foreword.dart';

import 'dart:convert';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/home.dart';
import 'package:quran_app/register.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  Constants c = Constants();
  TextEditingController passsword = TextEditingController();
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hide_password = true;

  var checkedValue = 0;
  // ignore: non_constant_identifier_names
  List data = [];
  bool _loading = false;

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Container(
                      padding: EdgeInsets.all(c.deviceWidth(context) * 0.01),
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.fill,
                      )),
                ),
                c.getDivider(10.0),
                Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    color: c.primaryColor(),
                  ),
                  child: SizedBox(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Welcome to".toUpperCase(),
                                        style: TextStyle(
                                          fontFamily:
                                              c.fontFamily(type: "bold"),
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              c.getFontSizeMedium(context) + 5,
                                          // // fontWeight: FontWeight.bold,
                                          color: c.whiteColor(),
                                        )),
                                    TextSpan(
                                      text: '\nTHE HOLY QURAN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        fontFamily: c.fontFamily(type: "bold"),
                                        fontSize:
                                            c.getFontSizeLarge(context) + 8,
                                        // // fontWeight: FontWeight.bold,
                                        color: c.secondaryColor(),
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          c.getDivider(15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'SELECT LANGUAGE ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1,
                                    fontFamily: c.fontFamily(type: "bold"),
                                    fontSize: c.getFontSizeMedium(context) + 1,
                                    // // fontWeight: FontWeight.bold,
                                    color: c.whiteColor(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          c.getDivider(15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkResponse(
                                child: Container(
                                  //width: 100.0,
                                  // height: 50.0,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: c.secondaryColor(),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "ENGLISH",
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
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Index()));
                                },
                              ),
                              c.getDivider(15.0),
                              InkWell(
                                onTap: () {
                                  Future.delayed(const Duration(seconds: 0),
                                      () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (_) => Register()));
                                    // CupertinoPageRoute(builder: (context) => AA02Disclaimer())
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.angleDown,
                                      size: 20,
                                      color: c.whiteColor(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
