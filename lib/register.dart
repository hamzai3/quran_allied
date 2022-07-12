// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quran_app/foreword.dart';

import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:quran_app/login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Constants c = Constants();
  TextEditingController name = TextEditingController();
  TextEditingController passsword = TextEditingController();
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hide_password = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  Future<void> signUpWithEmailAndPassword(
    emailId,
    pwd,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailId,
        password: pwd,
      );
      print(userCredential.user);
      // print(userCredential.user?.displayName);
      // addUser();
      // c.setshared("name", value)

      c.showInSnackBar(context, "Account registered, Login to continue");
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pop();
        Navigator.push(context, CupertinoPageRoute(builder: (_) => Login()));
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        print('${e.code}');
        if (e.code.toString().trim() == 'email-already-in-use') {
          c.showInSnackBar(context, "Account already exists,try another email");
        } else {
          c.showInSnackBar(context, "Something went wrong, Try again");
        }
      });
    }
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.36,
                    width: MediaQuery.of(context).size.width * 0.36,
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
                                                c.getFontSizeMedium(context) +
                                                    5,
                                            // // fontWeight: FontWeight.bold,
                                            color: c.whiteColor(),
                                          )),
                                      TextSpan(
                                        text: '\nTHE HOLY QURAN',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,

                                          fontFamily:
                                              c.fontFamily(type: "bold"),
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
                            c.getDivider(5.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                color: c.whiteColor(),
                              ),
                              child: TextFormField(
                                // enabled: disable,
                                // obscureText: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  value = value.toString().trim();
                                  if (value.isEmpty) {
                                    return 'Name cannot be empty';
                                  }
                                },

                                controller: name,

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      fontFamily: c.fontFamily(),
                                      fontSize:
                                          c.getFontSizeMedium(context) - 2,
                                      color: c.blackColor()),
                                  hintText: 'Name',
                                ),
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: c.fontFamily(),
                                    fontSize: c.getFontSizeMedium(context),
                                    color: c.blackColor()),
                              ),
                            ),
                            c.getDivider(10.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                color: c.whiteColor(),
                              ),
                              child: TextFormField(
                                // enabled: disable,
                                // obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  value = value.toString().trim();
                                  if (value.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if (!value.contains("@")) {
                                    return 'Invalid email';
                                  }
                                },

                                controller: email,

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      fontFamily: c.fontFamily(),
                                      fontSize:
                                          c.getFontSizeMedium(context) - 2,
                                      color: c.blackColor()),
                                  hintText: 'Email',
                                ),
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: c.fontFamily(),
                                    fontSize: c.getFontSizeMedium(context),
                                    color: c.blackColor()),
                              ),
                            ),
                            c.getDivider(10.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                color: c.whiteColor(),
                              ),
                              child: TextFormField(
                                // enabled: disable,
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  value = value.toString().trim();
                                  if (value.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be 6 character long ';
                                  }
                                },

                                controller: passsword,

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      fontFamily: c.fontFamily(),
                                      fontSize:
                                          c.getFontSizeMedium(context) - 2,
                                      color: c.blackColor()),
                                  hintText: 'Password',
                                ),
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: c.fontFamily(),
                                    fontSize: c.getFontSizeMedium(context),
                                    color: c.blackColor()),
                              ),
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
                                        "Sign Up",
                                        style: TextStyle(
                                          color: c.whiteColor(),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              c.getFontSizeMedium(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      signUpWithEmailAndPassword(
                                          email.text.toString(),
                                          passsword.text.toString());
                                    }
                                    // Navigator.of(context).pop();
                                    // Navigator.push(
                                    //     context,
                                    //     CupertinoPageRoute(
                                    //         builder: (_) => Foreword()));
                                  },
                                ),
                                c.getDivider(10.0),
                                InkWell(
                                  onTap: () {
                                    Future.delayed(const Duration(seconds: 0),
                                        () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => Login()));
                                      // CupertinoPageRoute(builder: (context) => AA02Disclaimer())
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    "Already have an account? ",
                                                style: TextStyle(
                                                  fontFamily: c.fontFamily(
                                                      type: "regular"),
                                                  fontSize: c.getFontSizeMedium(
                                                      context),
                                                  // // fontWeight: FontWeight.bold,
                                                  color: c.whiteColor(),
                                                )),
                                            TextSpan(
                                              text: 'Sign In',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,

                                                fontFamily:
                                                    c.fontFamily(type: "bold"),
                                                fontSize: c
                                                    .getFontSizeMedium(context),
                                                // // fontWeight: FontWeight.bold,
                                                color: c.whiteColor(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      )
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
        ),
      ),
    );
  }
}
