import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationController {
  static final _localNotification = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject();
  static Future showNotification(
      {required String verification,
      int id = 0,
      String? title,
      String? body,
      required int payload,
      required DateTime scheduleDate}) async {
    _localNotification.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload)async{
      onNotifications.add(payload);
    });
    tz.initializeTimeZones();
    final locationName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(locationName));
    final vals = _localNotification.getActiveNotifications();
    vals.then((value) async {
      for (var i in value) {
        if (i.title == verification) {
          log('condition true');
          final pref = await SharedPreferences.getInstance();
          pref.setString('dateTime', scheduleDate.toString());
        }
      }
    });

  _localNotification.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      // _scheduleMonthAndTime(scheduleDate,month:[DateTime(year)] ),
      await notificationDetails().whenComplete(() {
        log("message");
      }),
      payload: payload.toString(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime,
    );
  }
static Future notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name',
            channelDescription: 'channel description',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  static InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    // iOS: initializationSettingsIOS,
    // macOS: initialization SettingsMacOS
  );

  static AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('app_icon');

  //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // const AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings('app_icon');

  // final IOSInitializationSettings initializationSettingsIOS =  const IOSInitializationSettings(
  //   requestAlertPermission: true,
  //   requestBadgePermission: true,
  //   requestSoundPermission: true,
  //   onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  // final MacOSInitializationSettings initializationSettingsMacOS = const MacOSInitializationSettings();

  // final InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  //   iOS: initializationSettingsIOS,
  //   macOS: initializationSettingsMacOS);

  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
