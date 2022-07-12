import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//import 'flutterna';
class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize(BuildContext context) async {
    print("initializing");
    if (Platform.isIOS) {
      print("initializing ios");
      _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()!
          .requestPermissions(alert: true, badge: true, sound: true);
    }
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: IOSInitializationSettings(
        requestSoundPermission: true,
        requestAlertPermission: true,
        requestBadgePermission: true,
      ),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? route) async {
        print("route");
      },
    );
    // if (scheduled) {
    //   tzx.initializeTimeZones();
    //   final locationName = await FlutterNativeTimezone.getLocalTimezone();
    //   tzx.setLocalLocation(tzx.getLocation(locationName));
    // }
  }

  static void display(String title, String body) async {
    print("hello");
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      //var bigpicture
      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            'jerkeats', // id
            'jerkeatschannel', // title
            importance: Importance.max,
            priority: Priority.max,
          ),
          iOS: IOSNotificationDetails());

      await _notificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails,
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
