import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
// typedef OnError = void Function(Exception exception);

class AudioPlayerPage extends StatefulWidget {
  final url, chapName;
  AudioPlayerPage({this.url, this.chapName});
  // const AudioPlayerPage({Key? key}) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer player;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setLoopMode(LoopMode.one);
    player.setUrl(widget.url).then((_) {
      if (mounted) setState(() => _ready = true);
    });
    //    player.duration.listen((Duration d) {
    //   print('Max duration: $d');
    //   setState(() => duration = d);
    // });
    print("Duration for audio");
    print(player.duration);
    player.bufferedPositionStream.listen((event) {
      print(event.inMinutes.toString() + "Okay");
    });
    player.durationStream.listen((event) {
      print("PLayback");
      print(event!.inSeconds.toString());
    }, onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // loop();
  }

  // loop() {
  //   Future.delayed(Duration(seconds: 1), () {
  //     print("Pos is");
  //     print(player.position.inMinutes);
  //     Future.delayed(Duration(seconds: 1), () {
  //       loop();
  //     });
  //   });
  // }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  var playerDuration = 0.0;
  Constants c = Constants();
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
            child: !_ready
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
                      c.getDivider(c.deviceHeight(context) * 0.1),
                      Image.asset("assets/book.png"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.chapName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,

                              fontFamily: c.fontFamily(type: "bold"),
                              fontSize: c.getFontSizeMedium(context) + 2,
                              // // fontWeight: FontWeight.bold,
                              color: c.primaryColor(),
                            ),
                          ),
                        ],
                      ),
                      c.getDivider(c.deviceHeight(context) * 0.3),
                      Row(
                        children: [
                          Expanded(
                            child: SfSlider(
                              min: 0.0,
                              max: double.parse(
                                  player.duration!.inMinutes.toString()),
                              value: player.position.inMinutes,
                              interval: 2,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) async {
                                print(double.parse(value.toString())
                                    .ceil()
                                    .toString());

                                setState(() {
                                  player.seek(Duration(
                                      minutes: int.parse(
                                          double.parse(value.toString())
                                              .ceil()
                                              .toString())));
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("00:00"),
                            Text(player.position.inMinutes.toString() + ":00")
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                player.seek(Duration(
                                    minutes: int.parse((double.parse(player
                                                    .position.inMinutes
                                                    .toString())
                                                .ceil() -
                                            1)
                                        .toString())));
                              });
                            },
                            child: Image.asset(
                              "assets/backward.png",
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                !player.playing
                                    ? player.play()
                                    : player.pause();
                              });
                            },
                            child: Image.asset(
                              !player.playing
                                  ? "assets/Play.png"
                                  : "assets/Pause.png",
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // player.seek(Duration(minutes: 1));
                                player.seek(Duration(
                                    minutes: int.parse((double.parse(player
                                                    .position.inMinutes
                                                    .toString())
                                                .ceil() +
                                            1)
                                        .toString())));
                              });
                            },
                            child: Image.asset(
                              "assets/forward.png",
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
