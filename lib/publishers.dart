// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';

class PublishersNote extends StatefulWidget {
  @override
  _PublishersNoteState createState() => _PublishersNoteState();
}

class _PublishersNoteState extends State<PublishersNote> {
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
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => Language()));
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.tertiaryColor(),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Publisher's Note",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,

                              fontFamily: c.fontFamily(type: "bold"),
                              fontSize: c.getFontSizeLarge(context) + 8,
                              // // fontWeight: FontWeight.bold,
                              color: c.blackColor(),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                c.getDivider(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "This edition of Maulana Muhammad Ali’s English Translation and" +
                            "Commentary of the Holy Qur’ån is the first to be produced from new typesetting since the publication of his revised edition in 1951. It was essential" +
                            "to renew the typesetting in order to maintain and improve print quality." +
                            "\n    We have taken advantage of this opportunity to correct previous misprints, improve layout and design, use a better footnote numbering scheme," +
                            "check cross-references, and substantially expand the Index of subjects." +
                            "\n    The proposals for this redesign and misprint correction were made some" +
                            "years ago by Dr. Zahid Aziz and submitted to the Ahmadiyya Anjuman" +
                            "Lahore, Pakistan. These were studied in detail by the then Head and" +
                            "President, Dr. Saeed Ahmad Khan, the Vice-President, Mr. Naseer Ahmad" +
                            "Faruqui, and other senior members of the Anjuman, and approval was given" +
                            "after due consultations and discussions. At the same time, a Foreword was" +
                            "approved for the new edition which is reproduced preceding this Note." +
                            "\n    In the previous edition, there were many cases in which quotations from" +
                            "the Holy Qur’ån as given within the footnotes and the Introduction were" +
                            "somewhat differently worded from the same passages as given in the translation itself. To prevent confusion, these have now been made consistent with" +
                            "the translation, but wherever the different wording was being used to illustrate a particular point we have retained it, either in parentheses after the" +
                            "standard translation or by insertion of the standard translation in parentheses." +
                            "There were also some instances in the footnotes where an Arabic term or" +
                            "expression had been mentioned without indicating the specific word or" +
                            "words that it corresponded to in the translation of the verse above. In such" +
                            "cases, whenever necessary for clarity, we have inserted the English words" +
                            "within parentheses after the Arabic term." +
                            "\n    We wish to stress that we have only corrected printing errors as well as" +
                            "certain inconsistencies which, in our judgment, Maulana Muhammad Ali" +
                            "himself would have rectified. No other kinds of additions, omissions or" +
                            "changes have been made in the translation or footnotes. At certain points" +
                            "we also consulted the Maulana’s first edition of 1917 to help in identifying" +
                            "some errors and unintended omissions which occurred during the production of the revised 1951 edition." +
                            "\n    Readers of the previous editions should note the slight change in verse" +
                            "numbering in chapter 3, most of chapter 6, and the end of chapter 4, made" +
                            "for reasons of standardization, which is explained on page I-21." +
                            "\n    We wish to thank all those volunteers in North America who, over the" +
                            "past three or four years, did the initial proofreading of the keyed-in text." +
                            "Special mention must be made of Dr. Muhammad Ahmad and Mrs. Lubina" +
                            "Ahmad who painstakingly proofread the Arabic text and of Mrs. Samina" +
                            "Malik who coordinated the entire project and brought it to a successful" +
                            "conclusion." +
                            "\n    In the end we humbly thank Almighty Allah Who enabled us to carry" +
                            "out this massive undertaking, pray for all those departed elders whose hard" +
                            "work and devotion made this translation a reality, and further pray that" +
                            "Allåh may bring humanity to right guidance through it — Åmßn." +
                            "\n\nZahid Aziz" +
                            "\nSamina Malik" +
                            "\nNoman I. Malik" +
                            "\nAhmadiyya Anjuman Isha‘at Islam Lahore Inc. U.S.A. \nJune 2002",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context) - 1,
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
