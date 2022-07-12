// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'dart:core';

import 'package:quran_app/constants.dart';
// For diacritics, and multiple text formats
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

class Surah extends StatefulWidget {
  final chap_number, chap_name;
  Surah({this.chap_number, this.chap_name});
  @override
  _SurahState createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  Constants c = Constants();
  TextEditingController annot = new TextEditingController();
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

  List data = [], footnotes = [];
  List<bool>? showAnnotiation;
  List<GlobalObjectKey<FormState>>? formKeyList;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.surahs(context, widget.chap_number).then((value) {
      // print("Arrsy is $value");
      try {
        setState(() {
          data = value['verses'];
          footnotes = value['footnotes'];
          formKeyList = List.generate(
              data.length, (index) => GlobalObjectKey<FormState>(index));
          showAnnotiation = List.generate(data.length, (index) => (false));
          Future.delayed(Duration(milliseconds: 300), () {
            setState(() {
              _isLoading = false;
            });
          });
        });
      } catch (e) {
        c.showInSnackBar(
            context, "App is not able to load this chapter, try again later");
      }
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

  final scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  var selected_color = 'green';
  setColor(clr) {
    setState(() {
      selected_color = clr;
    });
  }

  getAnnotations(chap_number, chap_name, verse_number) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Save Annotation",
                style: TextStyle(
                    fontFamily: c.fontFamily(),
                    fontSize: c.getFontSizeMedium(context),
                    // fontWeight: FontWeight.bold,
                    color: c.primaryColor()),
              ),
              c.getDivider(10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    // color: c.blackColor(),
                    elevation: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setColor("orange");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            margin: const EdgeInsets.all(4.0),
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(" "),
                            ),
                          ),
                        ),
                        c.getDivider(15.0),
                        InkWell(
                          onTap: () {
                            setColor("yellow");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(" "),
                            ),
                          ),
                        ),
                        c.getDivider(5.0),
                        InkWell(
                          onTap: () {
                            setColor("green");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(" "),
                            ),
                          ),
                        ),
                        c.getDivider(5.0),
                        InkWell(
                          onTap: () {
                            setColor("blue");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(" "),
                            ),
                          ),
                        ),
                        c.getDivider(5.0),
                        InkWell(
                          onTap: () {
                            setColor("pink");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(" "),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setColor("red");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(" "),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              c.getDivider(10.0),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.multiline,
                      maxLength: 500,
                      maxLines: 5,
                      decoration: InputDecoration(
                        // border: InputBorder.none,

                        filled: true,
                        hintStyle: TextStyle(
                            fontFamily: c.fontFamily(),
                            fontSize: c.getFontSizeSmall(context),
                            // fontWeight: FontWeight.bold,
                            color: c.primaryColor()),
                        labelStyle: TextStyle(
                            fontFamily: c.fontFamily(),
                            fontSize: c.getFontSizeSmall(context),
                            // fontWeight: FontWeight.bold,
                            color: c.primaryColor()),
                        hintText: 'Paste Copied Text',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      controller: annot,
                      style: TextStyle(
                          fontFamily: c.fontFamily(),
                          // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                      fontFamily: c.fontFamily(),
                      fontSize: c.getFontSizeSmall(context),
                      // fontWeight: FontWeight.bold,
                      color: c.backgroundColor()),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print(selected_color);
                var str = chap_number.toString() +
                    "__" +
                    chap_name.toString() +
                    "__" +
                    verse_number.toString() +
                    "__" +
                    selected_color.toString() +
                    "__" +
                    annot.text.toString();
                c.getshared("annot_saveds").then((value) {
                  if (value != 'null') {
                    c.setshared("annot_saveds", value + "@" + str);
                  } else {
                    c.setshared("annot_saveds", str);
                  }
                });
                c.showInSnackBar(context, "Annotation saved");
                annot.text = '';
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "SAVE",
                  style: TextStyle(
                      fontFamily: c.fontFamily(),
                      fontSize: c.getFontSizeMedium(context),
                      // fontWeight: FontWeight.bold,
                      color: c.primaryColor()),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              controller: controller,
                              itemCount: footnotes.length,
                              itemBuilder: (_, index) {
                                return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: EasyRichText(
                                            footnotes[index]['note'].toString(),
                                            selectable: true,
                                            textAlign: TextAlign.justify,
                                            defaultStyle: TextStyle(
                                              color: c.blackColor(),
                                              fontSize:
                                                  c.getFontSizeMedium(context) -
                                                      2,
                                            ),
                                            patternList: [
                                              // EasyRichTextPattern(
                                              //   targetString: '\n\nb.',
                                              //   style: TextStyle(
                                              //     color: Colors.blue,
                                              //     fontSize: c.getFontSizeMedium(
                                              //         context),
                                              //   ),
                                              // ),
                                              // EasyRichTextPattern(
                                              //   targetString: 'a.',
                                              //   stringAfterTarget: " ",
                                              //   stringBeforeTarget: "",
                                              //   matchWordBoundaries: false,
                                              //   style: TextStyle(
                                              //     color: Colors.blue,
                                              //     fontSize: c.getFontSizeMedium(
                                              //         context),
                                              //   ),
                                              // ),
                                              // EasyRichTextPattern(
                                              //   targetString: 'b.',
                                              //   matchRightWordBoundary: true,
                                              //   matchLeftWordBoundary: true,
                                              //   matchWordBoundaries: true,
                                              //   style: TextStyle(
                                              //     fontFamily: c.fontFamily(),
                                              //     color: Colors.blue,
                                              //     fontSize: c
                                              //         .getFontSizeMedium(context),
                                              //   ),
                                              // ),
                                              // EasyRichTextPattern(
                                              //   targetString: '\n\nc.',
                                              //   style: TextStyle(
                                              //     fontFamily: c.fontFamily(),
                                              //     color: Colors.blue,
                                              //     fontSize: c.getFontSizeMedium(
                                              //         context),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
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
          child: _isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                )
              : Padding(
                  padding: EdgeInsets.all(c.deviceWidth(context) * 0.1),
                  child: ListView(
                    controller: scrollController,
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
                                widget.chap_name,
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
                      c.getDivider(c.deviceHeight(context) * 0.1),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return i == 0
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkResponse(
                                      child: Container(
                                          width: c.deviceWidth(context) * 0.77,
                                          // height: 50.0,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: c.whiteColor(),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              Visibility(
                                                visible: false,
                                                child: Row(
                                                  children: [
                                                    Card(
                                                      color: c.blackColor(),
                                                      elevation: 8,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.orange,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(" "),
                                                            ),
                                                          ),
                                                          c.getDivider(15.0),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.yellow,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(" "),
                                                            ),
                                                          ),
                                                          c.getDivider(5.0),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(" "),
                                                            ),
                                                          ),
                                                          c.getDivider(5.0),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(" "),
                                                            ),
                                                          ),
                                                          c.getDivider(5.0),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.pink,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(" "),
                                                            ),
                                                          ),
                                                          c.getDivider(5.0),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(" "),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ListTile(
                                                key: formKeyList?[i],
                                                leading: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        bookmark(
                                                            widget.chap_name,
                                                            widget.chap_number,
                                                            data[i][
                                                                'verseNumber']);
                                                      },
                                                      child: Icon(
                                                        Icons.bookmark_border,
                                                        size: 25,
                                                        color: c.primaryColor(),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        getAnnotations(
                                                            widget.chap_number,
                                                            widget.chap_name,
                                                            data[i][
                                                                'verseNumber']);
                                                      },
                                                      child: Icon(
                                                        Icons.edit_outlined,
                                                        size: 25,
                                                        color: c.primaryColor(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                title: SelectableText.rich(
                                                  TextSpan(children: [
                                                    TextSpan(
                                                      text:
                                                          "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            c.fontFamily(),
                                                        color: c.blackColor(),
                                                        fontSize:
                                                            c.getFontSizeMedium(
                                                                context),
                                                      ),
                                                    ),
                                                  ]),
                                                  onTap: () {
                                                    _showBottomSheet(context);
                                                  },
                                                  textAlign: TextAlign.end,
                                                ),
                                                subtitle: EasyRichText(
                                                  "In\u1d43 the name of Alla\u0304h,\u1d47 the Beneficent, the Merciful.\u1d9c",
                                                  // .replaceAll("\u0304", "'")
                                                  // .replaceAll("\u1d43", "a"),
                                                  textAlign: TextAlign.end,
                                                  defaultStyle: TextStyle(
                                                    // fontFamily: c.fontFamily(),
                                                    color: c.blackColor(),
                                                    fontSize:
                                                        c.getFontSizeMedium(
                                                            context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                      onTap: () {
                                        _showBottomSheet(context);
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkResponse(
                                      child: Container(
                                          width: c.deviceWidth(context) * 0.77,
                                          // height: 50.0,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: c.whiteColor(),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              ListTile(
                                                key: formKeyList?[i],
                                                leading: Column(
                                                  children: [
                                                    GestureDetector(
                                                      child: Text(
                                                        i.toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              c.fontFamily(
                                                                  type: "bold"),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: c.redColor(),
                                                          fontSize:
                                                              c.getFontSizeMedium(
                                                                      context) -
                                                                  3,
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        bookmark(
                                                            widget.chap_name,
                                                            widget.chap_number,
                                                            data[i][
                                                                'verseNumber']);
                                                      },
                                                      child: Icon(
                                                        Icons.bookmark_border,
                                                        size: 25,
                                                        color: c.primaryColor(),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        getAnnotations(
                                                            widget.chap_number,
                                                            widget.chap_name,
                                                            data[i][
                                                                'verseNumber']);
                                                      },
                                                      child: Icon(
                                                        Icons.edit_outlined,
                                                        size: 25,
                                                        color: c.primaryColor(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                title: SelectableText.rich(
                                                  TextSpan(children: [
                                                    TextSpan(
                                                      text: data[i]
                                                          ['verseString'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                            c.fontFamily(),
                                                        color: c.blackColor(),
                                                        fontSize:
                                                            c.getFontSizeMedium(
                                                                context),
                                                      ),
                                                    ),
                                                  ]),
                                                  onTap: () {
                                                    _showBottomSheet(context);
                                                  },
                                                  textAlign: TextAlign.end,
                                                ),
                                                subtitle: EasyRichText(
                                                  data[i]['verseStringB']
                                                      .toString(),
                                                  // .replaceAll("\u0304", "'")
                                                  // .replaceAll("\u1d43", "a"),
                                                  textAlign: TextAlign.end,
                                                  defaultStyle: TextStyle(
                                                    // fontFamily: c.fontFamily(),
                                                    color: c.blackColor(),
                                                    fontSize:
                                                        c.getFontSizeMedium(
                                                            context),
                                                  ),
                                                  patternList: [
                                                    // EasyRichTextPattern(
                                                    //   targetString: "ᵃ",
                                                    //   superScript: true,
                                                    //   matchWordBoundaries: false,
                                                    //   style: const TextStyle(
                                                    //       fontSize: 20,
                                                    //       color: Colors.blue),
                                                    // ),
                                                    // EasyRichTextPattern(
                                                    //   targetString: "a",
                                                    //   superScript: true,
                                                    //   stringBeforeTarget: '.',
                                                    //   matchWordBoundaries: false,
                                                    //   style: const TextStyle(
                                                    //       color: Colors.blue),
                                                    // ),
                                                  ],
                                                ),
                                                // EasyRichTextPattern(
                                                //   targetString: [
                                                //     'a',
                                                //     'å',
                                                //     '\u1d47',
                                                //     ' a '
                                                //   ],
                                                //   superScript: true,
                                                //   style: const TextStyle(
                                                //       color: Colors.red),
                                                // ),
                                                // EasyRichTextPattern(
                                                //   targetString: 'blue',
                                                //   style: const TextStyle(
                                                //       color: Colors.blue),
                                                // ),
                                                // EasyRichTextPattern(
                                                //   targetString: 'bold',
                                                //   style: const TextStyle(
                                                //       fontWeight:
                                                //           FontWeight.bold),
                                                // ),
                                                // ],
                                                // SelectableText.rich(
                                                //   TextSpan(children: [
                                                //     TextSpan(
                                                //       text: data[i]['verseStringB'],
                                                //       style: TextStyle(
                                                //         fontFamily: c.fontFamily(),
                                                //         color: c.blackColor(),
                                                //         fontSize: c.getFontSizeMedium(
                                                //             context),
                                                //       ),
                                                //     ),
                                                //     WidgetSpan(
                                                //       child: Transform.translate(
                                                //         offset: const Offset(2, -4),
                                                //         child: Text(
                                                //           data[i]['verseNumber']
                                                //               .toString(),
                                                //           //superscript is usually smaller in size
                                                //           textScaleFactor: 1,
                                                //           style: TextStyle(
                                                //               color: Colors.blue),
                                                //         ),
                                                //       ),
                                                //     )
                                                //   ]),
                                                //   onTap: () {
                                                //     _showBottomSheet(context);
                                                //   },
                                                //   textAlign: TextAlign.end,
                                                // ),
                                              ),
                                            ],
                                          )),
                                      onTap: () {
                                        _showBottomSheet(context);
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
