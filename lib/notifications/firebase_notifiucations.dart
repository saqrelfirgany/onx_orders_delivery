// Import necessary Dart and Flutter packages
import 'dart:convert';
import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/helper/helper.dart';
import 'local_notification_service.dart';

// Class for managing Firebase notifications
class FirebaseNotifications {
  // Define constants for notification channel
  static const String channelName = 'channel id 3';
  static const String channelDescription = 'This channel is used for important notifications.';

  // Create instances for FlutterLocalNotificationsPlugin and FirebaseMessaging
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // Initialize notifications
  static void initNotifications({required BuildContext context}) async {
    // Request notification permission
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      // Notification permission is granted
    } else {
      // Open app settings if permission is not granted
      AppSettings.openAppSettings();
    }

    // Define AndroidNotificationChannel for local notifications
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channel id 3',
      'Aqarmap',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
    );

    // Initialize Android and iOS notification settings
    const androidInitializationSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iOSInitialSettings = IOSInitializationSettings();

    InitializationSettings initializationSettings = const InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitialSettings,
    );

    // Initialize FlutterLocalNotificationsPlugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: handleClickNotification,
    );

    // Resolve Android specific implementation for local notifications plugin
    final AndroidFlutterLocalNotificationsPlugin? androidNotificationsPlugin = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    // Create notification channel
    await androidNotificationsPlugin?.createNotificationChannel(channel);

    // Set foreground notification presentation options for FirebaseMessaging
    firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Listen for incoming Firebase messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('onMessage message:$message');
      log('onMessage message.data:${message.data}');
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;
      if (message.notification != null && message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
      final NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: android?.smallIcon,
          visibility: NotificationVisibility.public,
          enableVibration: true,
          priority: Priority.max,
          playSound: true,
        ),
      );
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification?.title,
        notification?.body,
        platformChannelSpecifics,
      );
    });

    // Listen for when the app is opened from a background state due to a notification
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final messageData = event.data;
      LocalNotificationService.instance.onSelectNotification(jsonEncode(messageData));
    });

    // Set a background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Get and log the device token
    log('###################DeviceToken###################');
    var token = await firebaseMessaging.getToken();
    log('DeviceToken:::$token');
    Helper.deviceToken = token ?? '00000000000000000';
  }

  // Callback function when a notification is clicked
  static void handleClickNotification(String? payload) {
    log('handleClickNotification');
  }

  // Background message handler for FirebaseMessaging
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
}
