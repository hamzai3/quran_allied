// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/audio.dart';
import 'package:quran_app/chapter_content.dart';
import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/foreword.dart';
import 'package:quran_app/key.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';
import 'package:quran_app/preface.dart';
import 'package:quran_app/publishers.dart';
import 'package:quran_app/reset.dart';
import 'package:quran_app/transliteration.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
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

  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.chapter_list(context).then((value) {
      print("Arrsy is $value");
      setState(() {
        data = value['chapters'];
        _isLoading = false;
      });
    });
  }

  bool _isLoading = true;
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
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
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
                                    "The Holy Qur'an",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,

                                      fontFamily: c.fontFamily(type: "bold"),
                                      fontSize:
                                          c.getFontSizeMedium(context) - 1 + 2,
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
                          c.getDivider(10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isLoading = true;
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    });
                                  });
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Index()));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        //                    <--- top side
                                        color: Colors.black54,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Content",
                                    style: TextStyle(
                                      height: 0.8,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: c.fontFamily(),
                                      color: c.blackColor(),
                                      fontSize:
                                          c.getFontSizeMedium(context) - 1,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isLoading = true;
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    });
                                  });
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Audio()));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Audio",
                                    style: TextStyle(
                                      fontFamily: c.fontFamily(),
                                      color: c.blackColor(opc: 0.6),
                                      fontSize:
                                          c.getFontSizeMedium(context) - 1,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          c.getDivider(c.deviceHeight(context) * 0.05),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Title Page",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 1,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Foreword()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Copyright Page",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 1,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  // Navigator.push(context,
                                  //     CupertinoPageRoute(builder: (_) => Foreword()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Foreword",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 1,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  // //Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Foreword_Page2()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Publisher’s Note",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 1,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => PublishersNote()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Preface by Maulana Muhammad Ali",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 2,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Preface()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Transliteration of Arabic Words",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 1,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Transliteration()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Key to References and Authoritiy",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 1,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => KeyRef()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkResponse(
                                child: Container(
                                    width: c.deviceWidth(context) * 0.75,
                                    // height: 50.0,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: c.primaryColor(),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: new ListTile(
                                      title: Text(
                                        "Introduction to Holy Qur’an",
                                        style: TextStyle(
                                          fontFamily: c.fontFamily(),
                                          color: c.whiteColor(),
                                          fontSize:
                                              c.getFontSizeMedium(context) - 1,
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => Foreword()));
                                },
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                        width: c.deviceWidth(context) * 0.75,
                                        // height: 50.0,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: c.primaryColor(),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: new ListTile(
                                          title: Text(
                                            data[i]['chapter'] +
                                                ". " +
                                                data[i]['eng_title'] +
                                                " - " +
                                                data[i]['arabic_tlte'],
                                            style: TextStyle(
                                              fontFamily: c.fontFamily(),
                                              color: c.whiteColor(),
                                              fontSize:
                                                  c.getFontSizeMedium(context) -
                                                      1,
                                            ),
                                          ),
                                        )),
                                    onTap: () {
                                      //Navigator.of(context).pop();
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => Surah(
                                                    chap_number: data[i]
                                                        ['chapter'],
                                                    chap_name: data[i]
                                                            ['eng_title'] +
                                                        "  " +
                                                        data[i]["arabic_tlte"],
                                                  )));
                                    },
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
              ),
            ),
          ),
        ));
  }
}
