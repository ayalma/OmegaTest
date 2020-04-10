import 'dart:convert';
import 'dart:isolate';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:omega_evaluation_project/commons/config_interceptor.dart';
import 'package:omega_evaluation_project/datasource/api/article_api.dart';
import 'package:omega_evaluation_project/datasource/api/article_result.dart';
import 'package:dio/dio.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

ConfigInterceptor config = ConfigInterceptor();
Dio dio = Dio()..interceptors.add(config);
ArticleApi articleApi = ArticleApi(dio);

Future<void> _showNotification(ArticleResult article) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'omega_notification_chanel', 'بازار روز', 'برنامه بازار روز با فلاتر',
      importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(0, 'بازار روز',
      'برای اطلاع از پیام های بازار روز کلیک کنید', platformChannelSpecifics,
      payload: json.encode(article.toJson()));
}

void proccessNotification() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print(
      "[$now] fetch notif ! isolate=${isolateId} function='$proccessNotification'");
  articleApi.loadArticle(2766).then((articles) {
    if (articles.showAble) 
    _showNotification(articles);
  }).catchError((e) {
    print(e); // somhow
  });
}

init() async {
  await AndroidAlarmManager.initialize();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {});
}
