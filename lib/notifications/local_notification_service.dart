import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Service for managing local notifications
class LocalNotificationService {
  // Private constructor to enforce singleton pattern
  LocalNotificationService._();

  // Singleton instance of the LocalNotificationService
  static final instance = LocalNotificationService._();

  // Instance of FlutterLocalNotificationsPlugin
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Request iOS permissions for local notifications
  static requestIOSPermissions(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // Initialize notification settings for Android and iOS
  Future<void> initNotificationSettings() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: false,
    );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        log('onSelectNotification');
      },
    );
  }

  // Show an instant notification
  Future<void> showInstantNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    log('showInstantNotification');
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _notificationDetails(),
      payload: payload,
    );
  }

  // Configure notification details for Android and iOS
  _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id 3',
        'Aqarmap',
        channelDescription: 'This channel is used for important notifications.',
        importance: Importance.max,
        priority: Priority.max,
        enableVibration: true,
        playSound: true,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  // Handle the selection of a notification
  onSelectNotification(dynamic payload) async {
    log('onSelectNotification');
  }
}
