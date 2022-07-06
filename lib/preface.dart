// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';

class Preface extends StatefulWidget {
  @override
  _PrefaceState createState() => _PrefaceState();
}

class _PrefaceState extends State<Preface> {
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
                            text: "Preface ",
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
                        "There has been a demand for a revised edition of my English Translation and" +
                            "Commentary of the Holy Qur’ån since the end of the Second World War." +
                            "Conditions have changed so rapidly since I first took this work in hand in 1909 that" +
                            "I myself felt the need for a revised edition. In fact, it is not only the change of" +
                            "circumstances that called for a revision; my own knowledge of the Holy Book has" +
                            "since increased to a very large extent owing to the fact that I have been engaged" +
                            "day and night in further research in this line, studying the Holy Qur’ån, the Ïadßth" +
                            "and other religious literature of Islåm. During this interval of about 33 years — the" +
                            "first edition was published in 1917 — I made substantial contribution to the religious literature of Islåm both in English and in Urdu. After the English Translation" +
                            "\nI wrote a voluminous Urdu Commentary, the Bayån al-Qur’ån, in three volumes," +
                            "and this kept me occupied for another seven years. It extends to over 2,500 pages" +
                            "and is much more explanatory than the notes in the English Translation. During the" +
                            "same period I also wrote a life of the Holy Prophet in Urdu, which was later translated into English under the name of Muƒammad the Prophet. A little later was" +
                            "issued a history of the Early Caliphate both in Urdu and in English. About the year" +
                            "1928 a smaller edition of the English Translation without Arabic Text and with" +
                            "briefer notes was published. Then came the translation and commentary in Urdu of" +
                            "the ˝aƒßƒ Bukhårß, the well-known Ïadßth collection. In 1936 was published another voluminous work in English, The Religion of Islåm, which contains full information on almost all Islamic questions of modern days. The New World Order, A" +
                            "Manual of Ïadßth and The Living Thoughts of the Prophet Muƒammad were added" +
                            "after 1940.  " +
                            "\nOwing to the extensive study which I had to make for these writings I myself" +
                            "felt that I had received more light and was bound to give the English-reading public, which extends over a vast part of the world, a deeper insight into the Holy" +
                            "Qur’ån than I had given in my younger days. I began the work of revising the translation and commentary of the Holy Qur’ån some time late in 1946, but the year" +
                            "1947 was a critical year for the Indo-Pakistan sub-continent and, on 29th August," +
                            "1947, I myself had to flee for my life from Dalhousie, where I used to work in the" +
                            "summer months. The literary work that I was doing there suffered considerably but" +
                            "I took it up later at Quetta, where I passed the summer of 1948. Before making" +
                            "much progress, however, I fell seriously ill and the work had again to be put off for" +
                            "more than six months. The manuscript was ready by the middle of 1950, but another serious illness overtook me at Karachi, where I was then carrying on this work. I" +
                            "was spared, however, by God’s grace, to see the work through the press, and to" +
                            "give it the finishing touches; perhaps also to render some further service to the" +
                            "cause of Truth. Though still on my sick-bed I am able to go through the proofs and" +
                            "revise the Introduction.",
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
