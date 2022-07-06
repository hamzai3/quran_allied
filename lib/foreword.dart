// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:quran_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/language.dart';
import 'dart:convert';
import 'dart:io';

import 'package:quran_app/login.dart';

class Foreword extends StatefulWidget {
  @override
  _ForewordState createState() => _ForewordState();
}

class _ForewordState extends State<Foreword> {
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                            text: 'THE HOLY QUR’AN',
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
                        'English Translation and Commentary by',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context) + 1,
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.6),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Maulana Muhammad Ali',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: c.fontFamily(type: "bold"),
                              fontSize: c.getFontSizeLarge(context) + 1,
                              // // fontWeight: FontWeight.bold,
                              color: c.blackColor(opc: 0.8),
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
                        'Renowned author of several classic works on Islam',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context) + 3,
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'WITH EXPANDED INDEX',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1,
                          fontFamily: c.fontFamily(type: "bold"),
                          fontSize: c.getFontSizeMedium(context) + 3,
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.copyright,
                      size: 18,
                    ),
                    Expanded(
                      child: Text(
                        '2011, Ahmadiyya Anjuman Isha’at Islam',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.75,
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context) - 1,
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Lahore (USA) Inc.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.75,
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'P.O. Box 3370 Dublin, Ohio 43016, U.S.A.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Ph: 614-873-1030\nPh: 614-266-1030',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
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
                      child: Text(
                        'E-mail: aaiil@aol.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Internet: www.muslim.org',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Also available in eBook, print and audio formats',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "regular"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                c.getDivider(15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'ISBN-13: 978-1-9342-7114-8',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "bold"),
                          fontSize: c.getFontSizeMedium(context),
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
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

class Foreword_Page2 extends StatefulWidget {
  @override
  _Foreword_Page2State createState() => _Foreword_Page2State();
}

class _Foreword_Page2State extends State<Foreword_Page2> {
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
                            text: 'FORWORD',
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
                        '    The English Translation of the Holy Qur’ån with Commentary, by Maulana' +
                            'Muhammad Ali (d. 1951), has been highly acclaimed all over the world,' +
                            'ever since the first edition appeared in 1917, and holds the position of a' +
                            'renowned classic of religious literature. It was the first English translation' +
                            'by a Muslim to be generally available and to be made accessible to the' +
                            'West, printed as it was in England. Its publication was all the more remarkable as it took place at a time when there was a grossly distorted, misconceived and dark image of Islam generally prevalent, making the atmosphere' +
                            'extremely hostile to this sublime faith and to prospects of its progress.' +
                            '\n     Besides being a pioneer work, there are several other important respects' +
                            'in which this Translation and Commentary holds an outstanding and un -' +
                            'rivalled position. Two may be noted here. Firstly, it presents the faith of' +
                            'Islam in its pure and pristine form by treating the Qur’ån itself as the direct' +
                            'supreme authority, rather than approaching it through the medium of later' +
                            'interpretations. It thus corrects the deep-seated and widely-held misconceptions about Islamic teachings, and shows Islam to be an entirely peaceful and tolerant religion, a faith which seeks to convince and not to coerce,' +
                            'and one which is concerned not only with outward forms but with the inner' +
                            'spirit as well. Secondly, this work has had an incalculable influence in' +
                            'drawing non-Muslims towards Islam, as well as rescuing Muslims themselves from doubt and disillusionment, as evidenced by the wealth of glowing tributes which have been paid to it.' +
                            '\n     Maulana Muhammad Ali thoroughly revised the whole work in the last' +
                            'five years of his life, the revised edition being published in 1951 followed' +
                            'by several reprint editions over the years.' +
                            '\n     So immense has been the impact, success and popularity of this work' +
                            'that efforts were started many years ago to render it into other languages.' +
                            'Recently, the Ahmadiyya Anjuman Isha‘at Islam Lahore Inc. U.S.A. has' +
                            'renewed these endeavours with fresh vigour, and work is being energetically' +
                            'done to make this book available in more and more languages of the world.' +
                            '\n     This edition has been entirely re-typeset with improved design and layout. A new footnote numbering scheme has been introduced, which gives a' +
                            'neater appearance to the translation as well as being more convenient for' +
                            'locating footnotes. The new scheme is explained fully in the Key to' +
                            'References and Authorities. The Index has also been substantially expanded.' +
                            '\n     We thank Dr. Zahid Aziz of England for carrying out the improvements and' +
                            'revisions mentioned, and correcting misprints in the previous edition.' +
                            'We conclude below with some extracts from the Foreword to the 1963' +
                            'reprint edition of this work, contributed by Maulana Muhammad Yakub' +
                            'Khan, one-time Imam of the Woking Muslim Mission, England, outlining' +
                            'the very great service rendered to Islam by Maulana Muhammad Ali and' +
                            'his devotion to the cause of the Holy Qur’ån.' +
                            'Dr. Saeed Ahmad Khan' +
                            'President, Ahmadiyya Anjuman Lahore, Pakistan' +
                            'N. A. Faruqui' +
                            'Vice-President, Ahmadiyya Anjuman Lahore, Pakistan' +
                            'Lahore, October 1990 ',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        '\nFrom the Foreword to the 1963 Edition\nby Maulana Muhammad Yakub Khan \n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: c.fontFamily(type: "bold"),
                          fontSize: c.getFontSizeMedium(context) + 2,
                          // // fontWeight: FontWeight.bold,
                          color: c.blackColor(opc: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Maulana Muhammad Ali’s Translation marks a definite epoch in the' +
                            'understanding of Islam. Among the Muslim intelligentsia it positively' +
                            'arrested the creeping decay of faith as a result of the Western materialistic' +
                            'influences, and the sceptical trends of Western philosophic thought.' +
                            'Typical of this reaction of the Muslim mind was the fulsome acknowledgement by a well-known devout Muslim thinker and writer, referred to by the' +
                            'author in the Preface, who ascribes his own rescue from the wilderness of' +
                            'atheism to this Translation.' +
                            '\n         In the realm of Western scholarship, the impact of this Translation is' +
                            'noticeable in the changed outlook on Islam and the changed tone of literature about Islam that has since appeared. The very first indications of such' +
                            'wholesome change are met with in the writings of a man of no less scholarly stature than H. G. Wells. In 1920, when his work The Outline of History,' +
                            'appeared, it carried the whole of Section 16 of Chapter 3 as rendered in this' +
                            'Translation, describing it as an example of the Qur’ån’s “majestic utterances from the recent orthodox translation by the Maulvi Muhammad Ali”.' +
                            '\n         Interpreting the Word of God calls for great gifts of scholarship, no' +
                            'doubt, but it requires something much more, which no scholarship can confer — the gift of inner purity. Maulana Muhammad Ali wielded a scholar’s' +
                            'pen with a saint’s hands, and that is where lay the secret of this Translation' +
                            'becoming a real spiritual force and a beacon of light for seekers-after-truth.' +
                            'By the very cast of his mind, Maulana Muhammad Ali was deeply religious. Having obtained three university degrees, when the prospects of a' +
                            'bright worldly career lay at his feet, he dedicated his life to the service of' +
                            'Islam. And what a dedication! He took up his pen in that cause in 1902 as a' +
                            'young man in his twenties, wielded it incessantly, untiringly and devotedly' +
                            'for half a century, and did not lay it down until it was actually snatched' +
                            'from him by the hand of death.' +
                            '\n         Work on the first edition of the English translation of the Qur’ån took' +
                            'him seven long years (1909–1916). The amount of original research that' +
                            'went into tracing the meanings of the words and verses, finding the underlying sense of Sections and Chapters, and linking it up with the preceding' +
                            'and succeeding text, so that the whole of the Qur’ån was shown to have the' +
                            'thread of a continuous theme running through it — it is simply staggering' +
                            'to think of all this stupendous and most taxing labour put in single handed,' +
                            'day after day, for seven long years. But that is exactly what made Maulana' +
                            'Muhammad Ali’s translation the boon of the world of scholarship in the' +
                            'West as well as the East when it appeared in print in 1917. It was a pioneer' +
                            'venture breaking altogether new ground, and the pattern set was followed' +
                            'by all subsequent translations of the Qur’ån by Muslims. It meets every' +
                            'criticism that has been levelled against the Qur’ån. The Introduction is a' +
                            'whole mine of research, which throws light on all the salient features of a' +
                            'truly Divine religion. There is no attempt at pedantry or literary flourishes.' +
                            'Nor is there any pandering to preconceived popular notions or a bid for' +
                            'cheap popularity. It is a loyal service to the Word of God aiming at scrupulously honest, faithful rendering.' +
                            '\n         About the closing years of his life, when the Translation had already' +
                            'run into three editions, and the Maulana was stepping into his seventies, he' +
                            'felt he owed it to the world to give it the fruit of his deeper insight into the' +
                            'Quranic truths, which more extensive study in the meantime, and advancing years, had brought him. Once more he plunged himself into another' +
                            'long spell of the most taxing labour to bring out a revised edition. This' +
                            'took him another five years (1946-1951). He forgot that he was no longer a' +
                            'young man. The strain proved too much for him, so that he had to do the' +
                            'proofreading in his sick-bed, which finally proved his death-bed.' +
                            '“On arrival of the proofs from England,” write his biographers, “the' +
                            'Maulana would get his head raised in his bed, and with hands quivering' +
                            'would correct the proofs and give the final touches.” The final proofs were' +
                            'corrected on October 8, 1951, and five days later he breathed his last. He' +
                            'died in harness in the service of the Qur’ån.' +
                            '\n         The Qur’ån describes the battle for the minds of men as the highest' +
                            'jihåd. Maulana Muhammad Ali was undoubtedly the greatest mujåhid of' +
                            'his day in the cause of the Qur’ån',
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
