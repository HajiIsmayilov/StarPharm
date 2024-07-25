import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:star_pharm/cache/notification_cache.dart';
import 'package:uuid/uuid.dart';
import '../models/notification.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  void connectNotification() async {
    NotificationCache notificationCache = NotificationCache();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCIjSMI2J2YubSNI1sy-uHoKuh54rfdV7E',
        appId: '1:188358117907:android:3d3faa7bf8151fcecb0de6',
        messagingSenderId: '188358117907',
        projectId: 'starpharm-ca3e5',
      ),
    );
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(
        title: "${event.notification?.title}",
        description: "${event.notification?.body}",
      );

      NotificationModel notification = NotificationModel(
          uuid: const Uuid().v4(),
          title: event.notification?.title ?? 'null',
          text: event.notification?.body ?? 'null',
          imageUrl: 'null');

      notificationCache.add(notification);
    });
  }
}
