// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';
import 'package:quran_app/reset.dart';

class Annotations extends StatefulWidget {
  @override
  _AnnotationsState createState() => _AnnotationsState();
}

class _AnnotationsState extends State<Annotations> {
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

  var annot = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.getshared("annot_saveds").then((value) {
      print("Value in annot $value");
      setState(() {
        if (value != 'null') {
          if (value.contains("@")) {
            annot = value.split("@");
          } else {
            annot.add(value);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          'Annotations',
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: annot.length,
                  itemBuilder: (context, i) {
                    return InkResponse(
                      child: Container(
                          padding: EdgeInsets.only(
                              bottom: c.deviceHeight(context) * 0.07),
                          width: c.deviceWidth(context) * 0.75,
                          child: Column(
                            children: [
                              Card(
                                color: c.getColor(annot[i]
                                    .toString()
                                    .split('__')[3]
                                    .toString()),
                                margin: EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        annot[i]
                                                .toString()
                                                .split('__')[1]
                                                .toString() +
                                            "( " +
                                            annot[i]
                                                .toString()
                                                .split('__')[0]
                                                .toString() +
                                            " )",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,

                                          fontFamily:
                                              c.fontFamily(type: "regular"),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 2,
                                          // // fontWeight: FontWeight.bold,
                                          color: c.whiteColor(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.all(0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          annot[i]
                                              .toString()
                                              .split('__')[4]
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily:
                                                c.fontFamily(type: "regular"),
                                            fontSize:
                                                c.getFontSizeSmall(context),
                                            // // fontWeight: FontWeight.bold,
                                            color: c.blackColor(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.push(context,
                        //     CupertinoPageRoute(builder: (_) => Foreword()));
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
