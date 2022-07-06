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

class Bookmarks extends StatefulWidget {
  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
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

  List bookmarks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    c.getshared("bookmarks_saveds").then((value) {
      if (value != 'null') {
        // var new_bookmark = value + "," + chp + "_" + verse;
        bookmarks = value.split(",");
        print(bookmarks[0]);
        print(bookmarks[0].toString().split("_"));

        bookmarks = bookmarks.toSet().toList();
        var save_bk = '';
        for (int b = 0; b < bookmarks.length; b++) {
          if (b == 0) {
            save_bk = bookmarks[b];
          } else {
            save_bk = save_bk + "," + bookmarks[b];
          }
        }
        c.setshared("bookmarks_saveds", save_bk);
      }

      // print("Bookmakrs in page are $bookmarks");
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  bool _isLoading = true;
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
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
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
                                'Bookmarks',
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
                        itemCount: bookmarks.length,
                        itemBuilder: (context, i) {
                          return Row(
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
                                      leading: Text(
                                        bookmarks[i].toString().split("_")[0],
                                        style: TextStyle(
                                          color: c.whiteColor(),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              c.getFontSizeMedium(context),
                                        ),
                                      ),
                                      title: Text(
                                        bookmarks[i].toString().split("_")[1] +
                                            "(" +
                                            bookmarks[i]
                                                .toString()
                                                .split("_")[2] +
                                            ")",
                                        style: TextStyle(
                                          color: c.whiteColor(),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              c.getFontSizeMedium(context),
                                        ),
                                      ),
                                    )),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  // Navigator.push(context,
                                  //     CupertinoPageRoute(builder: (_) => Foreword()));
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
    );
  }
}
