// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/audio_player.dart';
import 'package:quran_app/chapter_content.dart';
import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/foreword.dart';
import 'package:quran_app/home.dart';
import 'package:quran_app/key.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';
import 'package:quran_app/preface.dart';
import 'package:quran_app/publishers.dart';
import 'package:quran_app/reset.dart';
import 'package:quran_app/transliteration.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
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

  bookmark(chp_name, chp_number, verse_number) {
    c.getshared("bookmarks_saveds").then((value) {
      var bk = chp_number.toString() +
          "_" +
          chp_name +
          "_" +
          verse_number.toString();
      if (value != 'null') {
        bk = value + "," + bk;
        var arr = value.split(",");
        var found = 0;
        for (int b = 0; b < arr.length; b++) {
          if (arr[b].toString().split("_")[0] == chp_number &&
              arr[b].toString().split("_")[2] == verse_number) {
            found = found++;
          }
        }
        if (found == 0) {
          c.setshared("bookmarks_saveds", bk);
        }
      } else {
        c.setshared("bookmarks_saveds", bk);
      }
    });
    c.showInSnackBar(context, "Bookmark Saved");
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
                                  child: Text(
                                    "Content",
                                    style: TextStyle(
                                      fontFamily: c.fontFamily(),
                                      color: c.blackColor(opc: 0.6),
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
                                    "Audio",
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Audio 30 Parts",
                                  style: TextStyle(
                                    fontFamily: c.fontFamily(type: "regular"),
                                    fontSize:
                                        c.getFontSizeMedium(context) - 1 + 2,
                                    // // fontWeight: FontWeight.bold,
                                    color: c.primaryColor(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 30,
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
                                          leading: GestureDetector(
                                            onTap: () {
                                              bookmark("Part  - ", "Audio",
                                                  (i + 1).toString());
                                            },
                                            child: Icon(
                                              Icons.bookmark_border,
                                              size: 25,
                                              color: c.whiteColor(),
                                            ),
                                          ),
                                          title: Text(
                                            "Part  - " + (i + 1).toString(),
                                            style: TextStyle(
                                              fontFamily: c.fontFamily(),
                                              color: c.whiteColor(),
                                              fontSize:
                                                  c.getFontSizeMedium(context) -
                                                      1,
                                            ),
                                          ),
                                          trailing: Icon(
                                            Icons.volume_down_outlined,
                                            size: 27,
                                            color: c.whiteColor(),
                                          ),
                                        )),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => AudioPlayerPage(
                                                  url: c.getAudioList(i),
                                                  chapName: "Part  - " +
                                                      (i + 1).toString())));
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
