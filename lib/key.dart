// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';

class KeyRef extends StatefulWidget {
  @override
  _KeyRefState createState() => _KeyRefState();
}

class _KeyRefState extends State<KeyRef> {
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
                              text: "Key to References and Authorities",
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
                        "Footnotes: In a verse the first footnote is marked with the letter a, the second with" +
                            "b, the third with c, and so on. In the footnotes, a note is labelled by the number of" +
                            "the verse followed by the letter which marks it in the verse. For instance, in chapter" +
                            "2, verse 1 has one note, marked a in the verse and labelled as 1a in the footnotes;" +
                            "verse 2 has three notes, marked a, b and c in the verse and labelled as 2a, 2b and 2c" +
                            "in the footnotes. (The Bismillåh verse in chapter 1 carries no verse number but has" +
                            "three notes. These are labelled in the footnotes by just the letter, a, b or c.)" +
                            "References: All references given without an indication of the name are to this book." +
                            "Preceding a colon is the number of a chapter of the Holy Qur’ån, and following the" +
                            "colon are verse numbers or footnotes in that chapter. For instance, 55:29 denotes" +
                            "chapter 55, verse 29, and 4:142a denotes chapter 4, footnote 142a (marked as a" +
                            "within verse 142, and as 142a in the footnotes). 16:33, 34 denotes chapter 16, ver -" +
                            "ses 33 and 34. 3:148–180 denotes chapter 3, verses 148 to 180. 5:64, 64a denotes" +
                            "chapter 5, verse 64 and footnote 64a (i.e. note a in verse 64). 18:94a, 96a denotes" +
                            "chapter 18, footnotes 94a and 96a. When referring to verses or footnotes from" +
                            "within the chapter in which they occur, the chapter number is omitted. For instance," +
                            "in any chapter a reference to v. 5 indicates verse 5 of that chapter, and 51b indicates" +
                            "footnote 51b of that chapter." +
                            "In references to Ïadßth collections, the first figure is the number of the kitåb" +
                            "(book) and the second the number of the båb (chapter), but in references to the" +
                            "Kitåb al-Tafsßr of Bukhårß (B. 65) a number in roman is added to show the number" +
                            "of the s∂rah. In case of Ïadßth collections not divided into kitåbs and båbs, the first" +
                            "number in Roman refers to the volume and the second to the page; so also in the" +
                            "case of historical and other books. A reference to a Lexicon will be met with under" +
                            "the entry for the root of the word. In the case of Commentaries of the Holy Qur’ån," +
                            "the reference given will be met with in the verse under discussion, unless otherwise" +
                            "indicated." +
                            "Note on verse numbering in chapters 3, 4 and 6: In this edition there is a slight" +
                            "difference from the pre-2002 editions in the numbering of verses in chapters 3 and" +
                            "6, and near the end of chapter 4. In chapter 3, the verse which was numbered as 3 is" +
                            "now split into two verses 3 and 4. Therefore, subsequent verses (4 to 199) now bear" +
                            "a number 1 more than before (5 to 200). In chapter 6, the verses which were numbered as 73 and 74 are now combined as verse 73. Therefore, subsequent verses (75" +
                            "to 166) now bear a number 1 less than before (74 to 165). In chapter 4, the verses" +
                            "which were numbered as 173 and 174 are now combined as 173. Therefore, the" +
                            "subsequent verses, 175 to 177, are now numbered as 174 to 176. This change has" +
                            "been made to make our numbering conform to the more widely used convention." +
                            "In the list below, names of books are given in italics; also in those cases where" +
                            "the abbreviation is based on the name of a person, the relevant part of the person’s" +
                            "name is given in italics." +
                            "\nA. . . . . . . Asås al-Balåghah (Dictionary), by Abu-l-Qåsim Maƒm∂d ibn ‘Umar alZamakhsharß." +
                            "\nAD . . . . . Kitåb al-Sunan (Ïadßth), by Ab∂ Daw∂d Sulaimån." +
                            "\nAh. . . . . . Musnad of Imåm Aƒmad ibn Ïanbal (Ïadßth)." +
                            "\nAH . . . . . Baƒr al-MuƒßΔ (Commentary), by Imåm Athßr al-Dßn Ab∂ ‘Abd Allåh Ab∂" +
                            "\nÏayyån al-Undlusß." +
                            "\nAIs . . . . . Ab∂ Isƒåq (Grammarian)." +
                            "\nAkh. . . . . Abu-l-Ïasan ‘Alß ibn Sulaimån al-Akhfash (Grammarian)." +
                            "\nA‘Ub . . . Ab∂ ‘Ubaidah Ma‘mar ibn Muthannå al-Ba©rß (Grammarian)." +
                            "\nAz. . . . . . Ab∂ Man©∂r Muƒammad ibn Aƒmad al-Azharß (Grammarian)." +
                            "\nB. . . . . . . Al-Jåmi‘ al-Musnad al-˝aƒßƒ (Ïadßth), by Al-Imåm Ab∂ ‘Abd Allåh" +
                            "\nMuƒammad ibn Ismå‘ßl al-Bukhårß." +
                            "\nBd. . . . . . Anwår al-Tanzßl wa Asrår al-Ta‘wßl (Commentary), by Qåzß Ab∂ Sa‘ßd ‘Abd" +
                            "\nAllåh ibn ‘Umar al-Bai˙åwß." +
                            "\nCr . . . . . . Cruden’s Bible Concordance." +
                            "\nDk. . . . . . Ab∂ ‘Alß al-Ïusain ibn Óaƒåk ibn Yåsir Ba©rß (Poet)." +
                            "\nDr . . . . . . Al-Musnad (Ïadßth), by Ab∂ Muƒammad ‘Abd Allåh al-Dårimß." +
                            "\nEn. Bib. . Encyclopaedia Biblica." +
                            "\nEn. Br. . . Encyclopaedia Britannica." +
                            "\nFB. . . . . . Fatƒ al-Bårß f ß Sharƒ ˝aƒßƒ Bukhårß (Ïadßth), by Imåm ibn Ïajar ‘Asqalånß." +
                            "\nHam . . . . Exposition of Dßwån Ïamåsah (Poetry), by Yaƒyå ‘Alß Tabrizß." +
                            "\nI‘Ab . . . . ‘Abd Allåh ibn ‘Abbås (Companion)." +
                            "\nIH . . . . . . Ab∂ Muƒammad ‘Abd al-Målik ibn Hishåm (Historian)." +
                            "\nIJ. . . . . . . Jåmi‘ al-Bayån fß Tafsßr al-Qur’ån (Commentary), by Imåm Ab∂ Ja‘far" +
                            "\nMuƒammad ibn Jarßr al-Ôabarß." +
                            "\nIK . . . . . . Tafsßr (Commentary), by Ismå‘ßl ibn ‘Umar (Ibn Kathßr)." +
                            "\nIM. . . . . . Sunan (Ïadßth), by Ab∂ ‘Abd Allåh Muƒammad ibn Yazßd ibn Måjah alQazwßnß." +
                            "\nIMsd. . . . ‘Abd Allåh ibn Mas‘∂d (Companion)." +
                            "\nItq. . . . . . Itqån f ß ‘Ul∂m al-Qur’ån (Commentary), by Imåm Jalål al-Dßn ‘Abd alRaƒmån ibn Abß Bakr al-Suy∂Δß." +
                            "\nJal. . . . . . Al-Jalålain (Commentary), by Jalål al-Dßn Suy∂Δß and his teacher, Jalål alDßn." +
                            "\nJB . . . . . . Jåmi‘ al-Bayån f ß Tafsßr al-Qur’ån (Commentary), by Al-Shaikh Mu‘ßn alDßn ibn ˝afß al-Dßn." +
                            "\nKf . . . . . . Kashshåf (Commentary), by Abu-l-Qåsim Maƒm∂d ibn ‘Umar alZamakhsharß." +
                            "\nI-22 KEY TO REFERENCES AND AUTHORITIES" +
                            "\nKU . . . . . Kanaz al-‘Ummål f ß Sunani-l-Aqwål wa-l-Af‘ål (Ïadßth), by Al-Shaikh ‘Alå" +
                            "\nal-Dßn ‘Alß al-Muttaqß." +
                            "\nLA . . . . . Lisån al-‘Arab (Dictionary), by ‘Allåmah Abu-l-Fa˙l Jamål al-Dßn" +
                            "\nMuƒammad ibn Mukarram." +
                            "\nLL. . . . . . Arabic-English Lexicon by Edward William Lane." +
                            "\nM . . . . . . Al-Muƒkam wa-l-MuƒßΔ al-A‘˚am (Dictionary), by ‘Alß ibn Ismå‘ßl ibn Sßdah." +
                            "\nMB . . . . . Majma‘ Biƒår al-Anwår (Dictionary of Ïadßth), by Al-Shaikh Muƒammad" +
                            "\nÔåhir." +
                            "\nMgh . . . . Mughnß al-Labßb (Grammar), by Al-Shaikh Jamål al-Dßn ibn Hishåm AlAn©årß." +
                            "\nMjd. . . . . Mujåhid ibn Jåbar (Tåbi‘ß)." +
                            "\nMs . . . . . ˝aƒßƒ Muslim (Ïadßth), by Imåm Abu-l-Ïusain ibn Al-Ïajjåj." +
                            "\nMsb . . . . Al-Mi©båƒ al-Munßr f ß Gharßb al-Sharƒ al-Kabßr (Dictionary), by Aƒmad ibn" +
                            "\nMuƒammad ibn ‘Alß al-Muqrß al-Fay∂mß." +
                            "\nMsh . . . . Mishkåt al-Ma©åbßƒ (Ïadßth), by Shaikh Walß al-Dßn Muƒammad ‘Abd" +
                            "\nAllåh." +
                            "\nN. . . . . . . Al-Nihåyah f ß Gharßbi-l-Ïadßth wa-l-Athar (Dictionary of Ïadßth), by Shaikh" +
                            "\nImåm Majd al-Dßn Ab∂ Sa‘ådat al-Mubårik, known as Ibn al-Athßr." +
                            "\nNas . . . . . Sunan al-Naså’ß (Ïadßth), by Ab∂ ‘Abd al-Raƒmån Aƒmad al-Naså’ß." +
                            "\nQ. . . . . . . Al-Qåm∂s al-MuƒßΔ (Dictionary), by Shaikh Majd al-Dßn Muƒammad ibn" +
                            "\nYa‘q∂b Al-Firozåbådß." +
                            "\nQt . . . . . . Qatådah ibn Du‘åmah (Tåbi‘ß)." +
                            "\nR. . . . . . . Al-Mufradåt fß Gharßb al-Qur’ån (Dictionary of Qur’ån), by Shaikh Abu-lQåsim Al-Ïusain al-Råghib al-I©fahånß." +
                            "\nRz. . . . . . Al-Tafsßr al-Kabßr (Commentary), by Imåm Fakhr al-Dßn Råzß." +
                            "\nRM . . . . . R∂ƒ al-Ma‘ånß (Commentary), by Abu-l-Fa˙l Shahåb al-Dßn al-Sayyid" +
                            "\nMaƒm∂d al-Al∂sß." +
                            "\nS . . . . . . . Al-˝iƒåƒ Tåj al-Lughah wa ˝iƒåƒ al-‘Arabiyyah (Dictionary) by Ismå‘ßl ibn" +
                            "\nÏammåd al-Jawharß." +
                            "\nT. . . . . . . Tåj al-‘Ar∂s (Dictionary), by Imåm Muƒibb al-Dßn Abu-l-Fai˙ Murta˙å." +
                            "\nTb. . . . . . Tårßkh al-Umam wa-l-Mul∂k (History), by Ab∂ Ja‘far Muƒammad ibn Jarßr" +
                            "\nal-Ôabarß." +
                            "\nTr . . . . . . Al-Jåmi‘ (Ïadßth), by Ab∂ ‘Íså Muƒammad ibn ‘Íså Tirmidhß." +
                            "\nZj . . . . . . Zajjåj (Grammarian).",
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
