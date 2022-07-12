import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/annotations.dart';
import 'package:quran_app/bookmark.dart';
import 'package:quran_app/profile.dart';
import 'package:quran_app/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  Future chapter_list(context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/chapters.json");
    return jsonDecode(data); //latest Dart
  }

  Future audio_list(context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/audio.json");
    return jsonDecode(data); //latest Dart
  }

  Future surahs(context, ind) async {
    var filename = "assets/surah/${(ind)}_new.json";
    // var filename = "assets/surah/001.json";
    print(filename);
    String data = await DefaultAssetBundle.of(context).loadString(filename);
    return jsonDecode(data); //latest Dart
  }

  fontFamily({type = "regular"}) {
    return type == 'regular' ? 'Poppins-Regular' : 'Poppins-Poppins-Bold';
  }

  deviceWidth(context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
  }

  primaryColor() {
    return const Color(0xff496F51);
  }

  redColor() {
    return Color(0xC4F04444);
  }

  tertiaryColor() {
    return const Color(0xffB9B9B9);
  }

  secondaryColor() {
    return const Color(0xffDAB53F);
  }

  whiteColor() {
    return const Color(0xffffffff);
  }

  backgroundColor() {
    return const Color(0xff808080);
  }

  blackColor({opc = 1.0}) {
    return const Color(0xff000000).withOpacity(opc);
  }

  deviceHeight(context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
  }

  getFontSizeMedium(context) {
    return MediaQuery.of(context).size.height * 0.020;
  }

  getFontSizeSmall(context) {
    return MediaQuery.of(context).size.height * 0.015;
  }

  getColor(str) {
    if (str == 'green') {
      return Colors.green;
    } else if (str == 'red') {
      return Colors.red;
    } else if (str == 'yellow') {
      return Colors.yellow;
    } else if (str == 'blue') {
      return Colors.blue;
    } else if (str == 'orange') {
      return Colors.orange;
    } else if (str == 'pink') {
      return Colors.pink;
    }
  }

  getAudioList(ind) {
    List<String> audioTracks = [
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-1.mp3?alt=media&token=a1cbdc4c-95fa-4cdf-9b7f-968b776bdbec](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-1.mp3?alt=media&token=a1cbdc4c-95fa-4cdf-9b7f-968b776bdbec)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-2.mp3?alt=media&token=70943399-6a5e-4411-8e7d-3147267bde20](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-2.mp3?alt=media&token=70943399-6a5e-4411-8e7d-3147267bde20)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-3.mp3?alt=media&token=274a56f8-a176-4df5-a7d4-4a4c16457def](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-3.mp3?alt=media&token=274a56f8-a176-4df5-a7d4-4a4c16457def)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-4.mp3?alt=media&token=dc3831ae-b23a-4f1d-8bbb-2d250ba25dd0](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-4.mp3?alt=media&token=dc3831ae-b23a-4f1d-8bbb-2d250ba25dd0)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-5.mp3?alt=media&token=f4dda6d9-af2c-4818-9c82-fea11831ae2a](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-5.mp3?alt=media&token=f4dda6d9-af2c-4818-9c82-fea11831ae2a)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-6.mp3?alt=media&token=61fac86e-322c-4f98-a05f-49d9278663e5](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-6.mp3?alt=media&token=61fac86e-322c-4f98-a05f-49d9278663e5)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-7.mp3?alt=media&token=d39a93c9-ff33-4b3d-a9ea-f97c94f0c4c6](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-7.mp3?alt=media&token=d39a93c9-ff33-4b3d-a9ea-f97c94f0c4c6)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-8.mp3?alt=media&token=ea08c5b2-d984-4fe3-a459-c1b21ee98b5d](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-8.mp3?alt=media&token=ea08c5b2-d984-4fe3-a459-c1b21ee98b5d)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-9.mp3?alt=media&token=e94f7cab-6faf-46aa-b5a8-8680f3845ff3](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-9.mp3?alt=media&token=e94f7cab-6faf-46aa-b5a8-8680f3845ff3)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-10.mp3?alt=media&token=11b8e799-8722-4526-973f-8cc569b033e6](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-10.mp3?alt=media&token=11b8e799-8722-4526-973f-8cc569b033e6)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-11.mp3?alt=media&token=f2e59ea4-b4ae-4f6c-8e50-597f203d4367](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-11.mp3?alt=media&token=f2e59ea4-b4ae-4f6c-8e50-597f203d4367)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-12.mp3?alt=media&token=82ab9385-051a-4b80-86fc-22455e14f43b](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-12.mp3?alt=media&token=82ab9385-051a-4b80-86fc-22455e14f43b)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-13.mp3?alt=media&token=2f544214-c65f-4d1b-83be-0d800d781d82](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-13.mp3?alt=media&token=2f544214-c65f-4d1b-83be-0d800d781d82)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-14.mp3?alt=media&token=8cc1ff88-2c3f-49e7-90ac-a89cf2e52b5d](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-14.mp3?alt=media&token=8cc1ff88-2c3f-49e7-90ac-a89cf2e52b5d)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-15.mp3?alt=media&token=85bce090-2c6a-419d-a9e8-4bd283efc727](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-15.mp3?alt=media&token=85bce090-2c6a-419d-a9e8-4bd283efc727)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-16.mp3?alt=media&token=f9fe9220-e623-480e-9a79-d20fe734169a](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-16.mp3?alt=media&token=f9fe9220-e623-480e-9a79-d20fe734169a)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-17.mp3?alt=media&token=f19f7c78-43cd-4b06-95f7-3570f8caf0b7](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-17.mp3?alt=media&token=f19f7c78-43cd-4b06-95f7-3570f8caf0b7)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-18.mp3?alt=media&token=972663cf-81a8-47a4-9311-d40a40473fdd](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-18.mp3?alt=media&token=972663cf-81a8-47a4-9311-d40a40473fdd)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-19.mp3?alt=media&token=b3205770-f1ab-442a-ad88-7053448545d4](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-19.mp3?alt=media&token=b3205770-f1ab-442a-ad88-7053448545d4)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-20.mp3?alt=media&token=cd811dd8-d007-40aa-83a1-4ec110caf2b8](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-20.mp3?alt=media&token=cd811dd8-d007-40aa-83a1-4ec110caf2b8)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-21.mp3?alt=media&token=ae923e9e-adcb-4e3d-982a-4b03e95ce172](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-21.mp3?alt=media&token=ae923e9e-adcb-4e3d-982a-4b03e95ce172)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-22.mp3?alt=media&token=c54af80b-04da-48f9-b0c7-3c4f310b1ecb](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-22.mp3?alt=media&token=c54af80b-04da-48f9-b0c7-3c4f310b1ecb)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-23.mp3?alt=media&token=67b42e7c-7b81-4fbe-8dd0-b886ef28f7a7](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-23.mp3?alt=media&token=67b42e7c-7b81-4fbe-8dd0-b886ef28f7a7)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-24.mp3?alt=media&token=c597274c-063e-4291-8057-ba2f77e90ef5](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-24.mp3?alt=media&token=c597274c-063e-4291-8057-ba2f77e90ef5)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-25.mp3?alt=media&token=2480af74-d538-4ceb-8a92-baca32222783](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-25.mp3?alt=media&token=2480af74-d538-4ceb-8a92-baca32222783)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-26.mp3?alt=media&token=badc4bf1-b675-4b3a-97f0-bd9adef5dab0](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-26.mp3?alt=media&token=badc4bf1-b675-4b3a-97f0-bd9adef5dab0)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-27.mp3?alt=media&token=09f0e09c-e41d-436a-9e99-5f734d73b6c2](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-27.mp3?alt=media&token=09f0e09c-e41d-436a-9e99-5f734d73b6c2)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-28.mp3?alt=media&token=c2ff9a17-e027-43a4-8f3d-3b289bbfbdf8](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-28.mp3?alt=media&token=c2ff9a17-e027-43a4-8f3d-3b289bbfbdf8)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-29.mp3?alt=media&token=cca3f740-d0a8-4077-803f-af7523eaf28c](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-29.mp3?alt=media&token=cca3f740-d0a8-4077-803f-af7523eaf28c)",
      "https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran Audio%2FPart-30.mp3?alt=media&token=5c8eb622-cb5e-44b1-90d6-28c830f3b77b](https://firebasestorage.googleapis.com/v0/b/holyquran-f922b.appspot.com/o/Quran%20Audio%2FPart-30.mp3?alt=media&token=5c8eb622-cb5e-44b1-90d6-28c830f3b77b)",
    ];
    return audioTracks[ind];
  }

  getFontSizeLabel(context) {
    return MediaQuery.of(context).size.height * 0.021;
  }

  getFontSizeLarge(context) {
    return MediaQuery.of(context).size.height * 0.030;
  }

  getDivider(height) {
    return Divider(
      height: height,
      color: Colors.transparent,
    );
  }

  showInSnackBar(context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
        duration: Duration(seconds: 3),
      ),
    );
  }

  menu(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(10.0),
            content: Container(
                // Specify some width
                width: MediaQuery.of(context).size.width * .2,
                height: MediaQuery.of(context).size.height * .28,
                decoration: BoxDecoration(
                    color: whiteColor(),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => Profile()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor(),
                                  border: Border.all(
                                    color: primaryColor(),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: whiteColor(),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontFamily: fontFamily(type: "regular"),
                              fontSize: getFontSizeMedium(context) - 1,
                              // // fontWeight: FontWeight.bold,
                              color: blackColor(opc: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                      child: Column(
                        children: [
                          getDivider(10.0),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => Settings()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor(),
                                  border: Border.all(
                                    color: primaryColor(),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.settings,
                                  size: 40,
                                  color: whiteColor(),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                              fontFamily: fontFamily(type: "regular"),
                              fontSize: getFontSizeMedium(context) - 1,
                              // // fontWeight: FontWeight.bold,
                              color: blackColor(opc: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => Annotations()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor(),
                                  border: Border.all(
                                    color: primaryColor(),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.edit,
                                  size: 40,
                                  color: whiteColor(),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Annotations",
                            style: TextStyle(
                              fontFamily: fontFamily(type: "regular"),
                              fontSize: getFontSizeMedium(context) - 1,
                              // // fontWeight: FontWeight.bold,
                              color: blackColor(opc: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => Bookmarks()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor(),
                                  border: Border.all(
                                    color: primaryColor(),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.bookmark,
                                  size: 40,
                                  color: whiteColor(),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Bookmarks",
                            style: TextStyle(
                              fontFamily: fontFamily(type: "regular"),
                              fontSize: getFontSizeMedium(context) - 1,
                              // // fontWeight: FontWeight.bold,
                              color: blackColor(opc: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  Future<bool> setshared(String name, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(name, value);
    return true;
  }

  Future<String> getshared(String skey) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(skey).toString();
  }
}
