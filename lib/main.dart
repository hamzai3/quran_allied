import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'local_notification_service.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/foreword.dart';
import 'package:quran_app/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'quran', // id
  'quran_by_allied', // title
  // description
  importance: Importance.high,
);
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (Platform.isAndroid) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(channel);
  }

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran by Maulana Muhammad Ali ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Poppins-Regular',
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Constants c = Constants();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      c.getshared("UserName").then((value) {
        if (value != 'null') {
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => Foreword()));
        } else {
          Navigator.push(context, CupertinoPageRoute(builder: (_) => Login()));
        }
      });
      // CupertinoPageRoute(builder: (context) => Login());
    });
    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
    FirebaseMessaging.instance.subscribeToTopic("all_test");
    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      print("hello");
      if (message != null) {
        //     if (message.data["pid"] != "") {
        //       if (message.data["type"] == "Product") {
        //         productDetailScreenController.productId = message.data["pid"];

        //         Get.to(() => NewProductDetailPage());
        //       } else {
        //         dashboardScreenController.catid = message.data["pid"];
        //         dashboardScreenController.getGridPageProducts();
        //         Get.to(() => GridHomePage(
        //               brand: false,
        //             ));
        //       }
        //     } else if (message.data["url"] != "") {
        //       await launch(message.data["url"]);
        //     }
        //   }
        //   print(message);
        // });

        // ///forground work
        // FirebaseMessaging.onMessage.listen((message) async {
        //   if (message.notification != null) {
        //     // Navigator.push(
        //     //     context,
        //     //     MaterialPageRoute(p
        //     //         builder: (context) => HomeScreen(snapchatUser: _snapchatUser)));
        //     if (message.data["pid"] != "") {
        //       Get.snackbar(message.notification.title, message.notification.body,
        //           duration: Duration(seconds: 5),
        //           icon: Image.network(
        //             message.data["image_url"],
        //           ), onTap: (GetSnackBar) {
        //         // productDetailScreenController.productId = message.data["pid"];

        //         // Get.to(() => NewProductDetailPage());
        //         if (message.data["type"] == "Product") {
        //           productDetailScreenController.productId = message.data["pid"];

        //           Get.to(() => NewProductDetailPage());
        //         } else {
        //           dashboardScreenController.catid = message.data["pid"];
        //           dashboardScreenController.getGridPageProducts();
        //           Get.to(() => GridHomePage(
        //                 brand: false,
        //               ));
        //         }
        //       });
        //     } else if (message.data["url"] != "") {
        //       Get.snackbar(message.notification.title, message.notification.body,
        //           duration: Duration(seconds: 5),
        //           icon: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Image.network(
        //               message.data["image_url"],
        //             ),
        //           ), onTap: (GetSnackBar) async {
        //         //Get.to((context)=>message.data["pid"],);
        //         await launch(message.data["url"]);
        //       });
        //     }
        // LocalNotificationService.display(
        //     message.notification!.title!, message.notification!.title!);
      }

//       if(Platform.isAndroid){
//  LocalNotificationService.display(
//           message.notification.title, message.notification.title);
//       }else{
//     Get.snackbar(message.notification.title,message.notification.body,duration: Duration(seconds: 5),icon: Image.network(message.data["image_url"],),);
//       }
    });
    FirebaseMessaging.onMessage.listen((message) async {
      LocalNotificationService.display(
          message.notification!.title!, message.notification!.title!);
//       if(Platform.isAndroid){
//  LocalNotificationService.display(
//           message.notification.title, message.notification.title);
//       }else{
//     Get.snackbar(message.notification.title,message.notification.body,duration: Duration(seconds: 5),icon: Image.network(message.data["image_url"],),);
//       }
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      print("hello");
      // if (message != null) {
      //   if (message.data["pid"] != "") {
      //     if (message.data["type"] == "Product") {
      //       productDetailScreenController.productId = message.data["pid"];

      //       Get.to(() => NewProductDetailPage());
      //     } else {
      //       dashboardScreenController.catid = message.data["pid"];
      //       dashboardScreenController.getGridPageProducts();
      //       Get.to(() => GridHomePage(
      //             brand: false,
      //           ));
      //     }
      //     // productDetailScreenController.productId = message.data["pid"];

      //     // Get.to(() => NewProductDetailPage());
      //   } else if (message.data["url"] != "") {
      //     await launch(message.data["url"]);
      //   }
      // }
      //Get.to((context)=>message.data["pid"],);
    });

    // TODO: implement initState
    super.initState();
  }

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
    return WillPopScope(
        onWillPop: () => _exitApp(context),
        child: Scaffold(
          body: SafeArea(
              child: Image.asset(
            "assets/splash.png",
            width: c.deviceWidth(context),
            fit: BoxFit.fill,
          )),
        ));
  }
}
