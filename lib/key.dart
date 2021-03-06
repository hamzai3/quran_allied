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
                            "in the footnotes. (The Bismill??h verse in chapter 1 carries no verse number but has" +
                            "three notes. These are labelled in the footnotes by just the letter, a, b or c.)" +
                            "References: All references given without an indication of the name are to this book." +
                            "Preceding a colon is the number of a chapter of the Holy Qur?????n, and following the" +
                            "colon are verse numbers or footnotes in that chapter. For instance, 55:29 denotes" +
                            "chapter 55, verse 29, and 4:142a denotes chapter 4, footnote 142a (marked as a" +
                            "within verse 142, and as 142a in the footnotes). 16:33, 34 denotes chapter 16, ver -" +
                            "ses 33 and 34. 3:148???180 denotes chapter 3, verses 148 to 180. 5:64, 64a denotes" +
                            "chapter 5, verse 64 and footnote 64a (i.e. note a in verse 64). 18:94a, 96a denotes" +
                            "chapter 18, footnotes 94a and 96a. When referring to verses or footnotes from" +
                            "within the chapter in which they occur, the chapter number is omitted. For instance," +
                            "in any chapter a reference to v. 5 indicates verse 5 of that chapter, and 51b indicates" +
                            "footnote 51b of that chapter." +
                            "In references to ??ad??th collections, the first figure is the number of the kit??b" +
                            "(book) and the second the number of the b??b (chapter), but in references to the" +
                            "Kit??b al-Tafs??r of Bukh??r?? (B. 65) a number in roman is added to show the number" +
                            "of the s???rah. In case of ??ad??th collections not divided into kit??bs and b??bs, the first" +
                            "number in Roman refers to the volume and the second to the page; so also in the" +
                            "case of historical and other books. A reference to a Lexicon will be met with under" +
                            "the entry for the root of the word. In the case of Commentaries of the Holy Qur?????n," +
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
                            "the abbreviation is based on the name of a person, the relevant part of the person???s" +
                            "name is given in italics." +
                            "\nA. . . . . . . As??s al-Bal??ghah (Dictionary), by Abu-l-Q??sim Ma??m???d ibn ???Umar alZamakhshar??." +
                            "\nAD . . . . . Kit??b al-Sunan (??ad??th), by Ab??? Daw???d Sulaim??n." +
                            "\nAh. . . . . . Musnad of Im??m A??mad ibn ??anbal (??ad??th)." +
                            "\nAH . . . . . Ba??r al-Mu?????? (Commentary), by Im??m Ath??r al-D??n Ab??? ???Abd All??h Ab???" +
                            "\n??ayy??n al-Undlus??." +
                            "\nAIs . . . . . Ab??? Is????q (Grammarian)." +
                            "\nAkh. . . . . Abu-l-??asan ???Al?? ibn Sulaim??n al-Akhfash (Grammarian)." +
                            "\nA???Ub . . . Ab??? ???Ubaidah Ma???mar ibn Muthann?? al-Ba??r?? (Grammarian)." +
                            "\nAz. . . . . . Ab??? Man?????r Mu??ammad ibn A??mad al-Azhar?? (Grammarian)." +
                            "\nB. . . . . . . Al-J??mi??? al-Musnad al-??a?????? (??ad??th), by Al-Im??m Ab??? ???Abd All??h" +
                            "\nMu??ammad ibn Ism???????l al-Bukh??r??." +
                            "\nBd. . . . . . Anw??r al-Tanz??l wa Asr??r al-Ta???w??l (Commentary), by Q??z?? Ab??? Sa?????d ???Abd" +
                            "\nAll??h ibn ???Umar al-Bai????w??." +
                            "\nCr . . . . . . Cruden???s Bible Concordance." +
                            "\nDk. . . . . . Ab??? ???Al?? al-??usain ibn ??a????k ibn Y??sir Ba??r?? (Poet)." +
                            "\nDr . . . . . . Al-Musnad (??ad??th), by Ab??? Mu??ammad ???Abd All??h al-D??rim??." +
                            "\nEn. Bib. . Encyclopaedia Biblica." +
                            "\nEn. Br. . . Encyclopaedia Britannica." +
                            "\nFB. . . . . . Fat?? al-B??r?? f ?? Shar?? ??a?????? Bukh??r?? (??ad??th), by Im??m ibn ??ajar ???Asqal??n??." +
                            "\nHam . . . . Exposition of D??w??n ??am??sah (Poetry), by Ya??y?? ???Al?? Tabriz??." +
                            "\nI???Ab . . . . ???Abd All??h ibn ???Abb??s (Companion)." +
                            "\nIH . . . . . . Ab??? Mu??ammad ???Abd al-M??lik ibn Hish??m (Historian)." +
                            "\nIJ. . . . . . . J??mi??? al-Bay??n f?? Tafs??r al-Qur?????n (Commentary), by Im??m Ab??? Ja???far" +
                            "\nMu??ammad ibn Jar??r al-??abar??." +
                            "\nIK . . . . . . Tafs??r (Commentary), by Ism???????l ibn ???Umar (Ibn Kath??r)." +
                            "\nIM. . . . . . Sunan (??ad??th), by Ab??? ???Abd All??h Mu??ammad ibn Yaz??d ibn M??jah alQazw??n??." +
                            "\nIMsd. . . . ???Abd All??h ibn Mas??????d (Companion)." +
                            "\nItq. . . . . . Itq??n f ?? ???Ul???m al-Qur?????n (Commentary), by Im??m Jal??l al-D??n ???Abd alRa??m??n ibn Ab?? Bakr al-Suy???????." +
                            "\nJal. . . . . . Al-Jal??lain (Commentary), by Jal??l al-D??n Suy??????? and his teacher, Jal??l alD??n." +
                            "\nJB . . . . . . J??mi??? al-Bay??n f ?? Tafs??r al-Qur?????n (Commentary), by Al-Shaikh Mu?????n alD??n ibn ??af?? al-D??n." +
                            "\nKf . . . . . . Kashsh??f (Commentary), by Abu-l-Q??sim Ma??m???d ibn ???Umar alZamakhshar??." +
                            "\nI-22 KEY TO REFERENCES AND AUTHORITIES" +
                            "\nKU . . . . . Kanaz al-???Umm??l f ?? Sunani-l-Aqw??l wa-l-Af?????l (??ad??th), by Al-Shaikh ???Al??" +
                            "\nal-D??n ???Al?? al-Muttaq??." +
                            "\nLA . . . . . Lis??n al-???Arab (Dictionary), by ???All??mah Abu-l-Fa??l Jam??l al-D??n" +
                            "\nMu??ammad ibn Mukarram." +
                            "\nLL. . . . . . Arabic-English Lexicon by Edward William Lane." +
                            "\nM . . . . . . Al-Mu??kam wa-l-Mu?????? al-A?????am (Dictionary), by ???Al?? ibn Ism???????l ibn S??dah." +
                            "\nMB . . . . . Majma??? Bi????r al-Anw??r (Dictionary of ??ad??th), by Al-Shaikh Mu??ammad" +
                            "\n????hir." +
                            "\nMgh . . . . Mughn?? al-Lab??b (Grammar), by Al-Shaikh Jam??l al-D??n ibn Hish??m AlAn????r??." +
                            "\nMjd. . . . . Muj??hid ibn J??bar (T??bi?????)." +
                            "\nMs . . . . . ??a?????? Muslim (??ad??th), by Im??m Abu-l-??usain ibn Al-??ajj??j." +
                            "\nMsb . . . . Al-Mi??b???? al-Mun??r f ?? Ghar??b al-Shar?? al-Kab??r (Dictionary), by A??mad ibn" +
                            "\nMu??ammad ibn ???Al?? al-Muqr?? al-Fay???m??." +
                            "\nMsh . . . . Mishk??t al-Ma????b???? (??ad??th), by Shaikh Wal?? al-D??n Mu??ammad ???Abd" +
                            "\nAll??h." +
                            "\nN. . . . . . . Al-Nih??yah f ?? Ghar??bi-l-??ad??th wa-l-Athar (Dictionary of ??ad??th), by Shaikh" +
                            "\nIm??m Majd al-D??n Ab??? Sa?????dat al-Mub??rik, known as Ibn al-Ath??r." +
                            "\nNas . . . . . Sunan al-Nas??????? (??ad??th), by Ab??? ???Abd al-Ra??m??n A??mad al-Nas???????." +
                            "\nQ. . . . . . . Al-Q??m???s al-Mu?????? (Dictionary), by Shaikh Majd al-D??n Mu??ammad ibn" +
                            "\nYa???q???b Al-Firoz??b??d??." +
                            "\nQt . . . . . . Qat??dah ibn Du?????mah (T??bi?????)." +
                            "\nR. . . . . . . Al-Mufrad??t f?? Ghar??b al-Qur?????n (Dictionary of Qur?????n), by Shaikh Abu-lQ??sim Al-??usain al-R??ghib al-I??fah??n??." +
                            "\nRz. . . . . . Al-Tafs??r al-Kab??r (Commentary), by Im??m Fakhr al-D??n R??z??." +
                            "\nRM . . . . . R????? al-Ma?????n?? (Commentary), by Abu-l-Fa??l Shah??b al-D??n al-Sayyid" +
                            "\nMa??m???d al-Al???s??." +
                            "\nS . . . . . . . Al-??i?????? T??j al-Lughah wa ??i?????? al-???Arabiyyah (Dictionary) by Ism???????l ibn" +
                            "\n??amm??d al-Jawhar??." +
                            "\nT. . . . . . . T??j al-???Ar???s (Dictionary), by Im??m Mu??ibb al-D??n Abu-l-Fai?? Murta????." +
                            "\nTb. . . . . . T??r??kh al-Umam wa-l-Mul???k (History), by Ab??? Ja???far Mu??ammad ibn Jar??r" +
                            "\nal-??abar??." +
                            "\nTr . . . . . . Al-J??mi??? (??ad??th), by Ab??? ?????s?? Mu??ammad ibn ?????s?? Tirmidh??." +
                            "\nZj . . . . . . Zajj??j (Grammarian).",
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
