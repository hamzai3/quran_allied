// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';

class Transliteration extends StatefulWidget {
  @override
  _TransliterationState createState() => _TransliterationState();
}

class _TransliterationState extends State<Transliteration> {
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
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Transliteration of Arabic Words ",
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
                      ),
                    )
                  ],
                ),
                c.getDivider(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "In this book I have adopted the most recent rules of transliteration recognized by" +
                            "Western Orientalists, with very slight variation, as explained below, but no transliteration can exactly express the vocalic differences of two languages, and the" +
                            "Roman characters in which Arabic words and phrases have been spelt give the" +
                            "sound of the original only approximately. Besides the inability of the characters of" +
                            "one language to represent the exact pronunciation of the words of another, there is" +
                            "this additional difficulty in romanizing Arabic words that in certain combinations" +
                            "the pronunciation does not follow the written characters; for example, al-Raƒmån is" +
                            "pronounced ar-Raƒmån, the sound of l merging in that of the next following letter," +
                            "r. To this category belong all the letters which are known by the name of al-ƒur∂f" +
                            "al-Shamsiyyah (lit., solar letters), and they are as follows: tå, thå, dål, dhål, rå, zå," +
                            "sßn, shßn, ©åd, ˙åd, Δå, ˚å, låm, n∂n (dentals, sibilants, and liquids). Whenever a" +
                            "word beginning with one of these letters has the prefix al (representing the article" +
                            "the), the låm is passed over in pronunciation and assimilated to the following consonant; in the case of all other letters, al is pronounced fully. This merging of one" +
                            "letter in another occurs also in certain other cases, for which a grammar of the" +
                            "Arabic language should be referred to." +
                            "\n   I have represented the tå added either at the end of a noun for ta’nßth — to" +
                            "make a noun feminine or to attach to it the sign of the feminine gender — as in" +
                            "Makkat or Makkah or Madßnat or Madßnah, or at the end of a verb to make it a" +
                            "ma©dar or infinitive noun, as in raƒmat or raƒmah, either by t or by h, the latter" +
                            "being the proper way of sounding it when there is a waqf or a stop",
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
                Image.asset(
                  "assets/transliteration.png",
                  width: c.deviceWidth(context),
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
