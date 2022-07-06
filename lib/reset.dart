// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:quran_app/login.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  Constants c = Constants();
  TextEditingController email = TextEditingController();

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

  OTP(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(10.0),
            content: Container(
                // Specify some width
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .28,
                decoration: BoxDecoration(
                    color: c.whiteColor(),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: <Widget>[
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                value = value.toString().trim();
                                if (value.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                              },

                              controller: email,

                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: c.primaryColor(),
                                  ),
                                ),
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                    fontFamily: c.fontFamily(),
                                    fontSize: c.getFontSizeMedium(context) - 2,
                                    color: c.blackColor()),
                                hintText: 'Enter your email address',
                              ),
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: c.fontFamily(),
                                  fontSize: c.getFontSizeMedium(context),
                                  color: c.blackColor()),
                            ),
                          ),
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
                                      "Confirm",
                                      style: TextStyle(
                                        color: c.whiteColor(),
                                        fontWeight: FontWeight.w600,
                                        fontSize: c.getFontSizeMedium(context),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  OTP(context);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
                child: Form(
                  key: _formKey,
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
                                'Reset Password',
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
                      c.getDivider(c.deviceHeight(context) * 0.3),
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
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            value = value.toString().trim();
                            if (value.isEmpty) {
                              return 'Email cannot be empty';
                            }
                          },

                          controller: email,

                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: c.primaryColor(),
                              ),
                            ),
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                                fontFamily: c.fontFamily(),
                                fontSize: c.getFontSizeMedium(context) - 2,
                                color: c.blackColor()),
                            hintText: 'Enter your email address',
                          ),
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: c.fontFamily(),
                              fontSize: c.getFontSizeMedium(context),
                              color: c.blackColor()),
                        ),
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
                                  "Reset",
                                  style: TextStyle(
                                    color: c.whiteColor(),
                                    fontWeight: FontWeight.w600,
                                    fontSize: c.getFontSizeMedium(context),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              c.showInSnackBar(context, "Please Wait...");
                              // resetPassword(email: email.text);
                              if (_formKey.currentState!.validate()) {
                                Future.delayed(Duration(seconds: 1), () {
                                  c.showInSnackBar(context,
                                      "Reset password link sent, check email");
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (_) => Language()));
                                  });
                                });
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Future resetPassword({required String email}) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => c.showInSnackBar(context, "Email sent. please check"));
  }
}
