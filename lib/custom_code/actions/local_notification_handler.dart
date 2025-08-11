// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import '/custom_code/actions/index.dart' as actions;
import '/auth/firebase_auth/auth_util.dart';
import '/backend/push_notifications/push_notifications_handler.dart';

Future localNotificationHandler() async {
  FirebaseMessaging.instance.requestPermission();
  final notification = await FirebaseMessaging.instance.getInitialMessage();
  if (notification != null) {
    await _handlePushNotification(notification);
  }
  LocalNotificationService().initialize();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    LocalNotificationService().display(message);
  });
  FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    LocalNotificationService().display(message);
  });
}

_handlePushNotification(RemoteMessage message) async {
  Future.delayed(const Duration(milliseconds: 1000), () async {
    try {
      Map<String, dynamic> data = message.data;
      if (data.containsKey("nextPage")) {
        String nextPage = data["nextPage"];
        Map<String, dynamic>? nextPageData = data.containsKey("nextPageData")
            ? jsonDecode(data["nextPageData"])
            : null;

        if (nextPage == 'IntroductionScreen' &&
            currentUser != null &&
            currentUser?.uid != null) {
          nextPage = "HomePage";
        }
        Map<String, dynamic> initialParameterData = {};
        if (nextPageData != null) {
          initialParameterData = nextPageData;
        }
        final parametersBuilder = parametersBuilderMap[nextPage];
        if (parametersBuilder != null) {
          var parameterData = await parametersBuilder(initialParameterData);
          var allParams = parameterData.allParams;
          allParams =
              allParams.map((k, v) => MapEntry(k, v is int ? v.toString() : v));
          final context = appNavigatorKey.currentContext;
          if (context != null) {
            if (nextPage == "MessageScreen") {
              actions.clearNavigate("MyMessagesScreen", {});
            }
            context!.pushNamed(nextPage, queryParameters: allParams);
          }
        } else {}
      }
    } catch (e, trace) {}
  });
}

class LocalNotificationService {
  static final LocalNotificationService _instance =
      LocalNotificationService._internal();

  factory LocalNotificationService() => _instance;

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  LocalNotificationService._internal();

  void initialize() async {
    _notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (response) async {
        if (response.payload != null) {
          try {
            Map<String, dynamic> data = jsonDecode(response.payload!);
            if (data.containsKey("nextPage")) {
              String nextPage = data["nextPage"];
              Map<String, dynamic>? nextPageData =
                  data.containsKey("nextPageData")
                      ? jsonDecode(data["nextPageData"])
                      : null;

              if (nextPage == 'IntroductionScreen' &&
                  currentUser != null &&
                  currentUser?.uid != null) {
                nextPage = "HomePage";
              }
              Map<String, dynamic> initialParameterData = {};
              if (nextPageData != null) {
                initialParameterData = nextPageData;
              }
              final parametersBuilder = parametersBuilderMap[nextPage];
              if (parametersBuilder != null) {
                var parameterData =
                    await parametersBuilder(initialParameterData);
                var allParams = parameterData.allParams;
                allParams = allParams
                    .map((k, v) => MapEntry(k, v is int ? v.toString() : v));
                final context = appNavigatorKey.currentContext;
                if (context != null) {
                  if (nextPage == "MessageScreen") {
                    actions.clearNavigate("MyMessagesScreen", {});
                  }
                  context!.pushNamed(nextPage, queryParameters: allParams);
                }
              } else {}
            }
          } catch (e, trace) {}
        }
      },
    );
    _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(sound: true, alert: true, badge: true);
  }

  void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      if (message.notification != null) {
        List<DarwinNotificationAttachment> iosAttachments = [];
        if (message.notification!.apple != null) {
          if (message.notification!.apple!.imageUrl != null) {
            String iosImage = await _downloadAndSaveImage(
                message.notification!.apple!.imageUrl!, 'bigPicture.png');
            iosAttachments.add(DarwinNotificationAttachment(iosImage));
          }
        }

        // String notificationSound =await  copyAssetToLocal('assets/audios/mixkit-dog-barking-twice-1.wav', 'notification.wav');
        // String iosnotificationSound =await  copyAssetToLocal('assets/audios/notification.caf', 'notification.caf');
        NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails('Patido', 'Patido channel',
              importance: Importance.max,
              icon: '@mipmap/ic_launcher',
              priority: Priority.high,
              sound: RawResourceAndroidNotificationSound('gizmos')),
          iOS: DarwinNotificationDetails(
              attachments: iosAttachments,
              presentAlert: true,
              presentBadge: true,
              presentBanner: true,
              presentList: true,
              presentSound: true,
              sound: 'gizmos.caf'),
        );
        await _notificationsPlugin.show(id, message.notification!.title,
            message.notification!.body, notificationDetails,
            payload: jsonEncode(message.data));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> _downloadAndSaveImage(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final HttpClient httpClient = HttpClient();
    final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    final HttpClientResponse response = await request.close();
    final File file = File(filePath);
    await response.pipe(file.openWrite());
    return filePath;
  }

  Future<String> copyAssetToLocal(String assetPath, String fileName) async {
    final ByteData data =
        await rootBundle.load(assetPath); // Asset'ten veriyi yükle
    final Directory tempDir = await getLibraryDirectory(); // Geçici dizin al

    final File file = File('$tempDir/Sounds/$fileName'); // Dosya yolu oluştur

    await file.writeAsBytes(data.buffer.asUint8List(),
        flush: true); // Veriyi yaz
    return file.path; // Oluşturulan dosyanın yolu
  }
}
