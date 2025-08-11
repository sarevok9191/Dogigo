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

import '/custom_code/actions/index.dart' as actions;
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import '/backend/api_requests/api_calls.dart';
import 'package:flutter/scheduler.dart';
import '/backend/push_notifications/push_notifications_handler.dart';
import '/auth/firebase_auth/auth_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;

Future splashCheck(String? nextPage, dynamic? nextPageData) async {
  FFAppState().addListener(() {
    if (FFAppState().CurrentUser.id != 0) {
      revenue_cat.login(FFAppState().CurrentUser.id.toString());
    }
  });
  final context = appNavigatorKey.currentContext;
  await actions.tryLoginLocalStorage();
  if (context != null) {
    action_blocks.getStaticValues(context);
    action_blocks.getCurrentUser(context);
  }
  _startTokenTimer();
  if (!FFAppState().AppMounted) {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
    if (notification != null) {
      await _handlePushNotification(notification);
    } else {
      _handleWithoutInitialMessage(context, nextPage, nextPageData);
    }
  } else {
    print("App Mounted");
    if (nextPage == 'IntroductionScreen' &&
        currentUser != null &&
        currentUser?.uid != null) {
      nextPage = "HomePage";
    }
    print(nextPage ?? 'nextPage Null');
    clearNavigate(nextPage ?? 'IntroductionScreen', {});
  }
}

_handleWithoutInitialMessage(
    BuildContext? context, String? nextPage, String? nextPageData) {
  Future.delayed(Duration.zero, () async {
    if (nextPage != null && (nextPage?.isNotEmpty ?? false)) {
      try {
        Map<String, dynamic>? pageData = nextPageData != null
            ? nextPageData is String
                ? jsonDecode(nextPageData)
                : nextPageData
            : null;

        if (nextPage == 'IntroductionScreen' &&
            currentUser != null &&
            currentUser?.uid != null) {
          nextPage = "HomePage";
        }
        Map<String, dynamic> initialParameterData = {};
        if (pageData != null) {
          initialParameterData = pageData;
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
            context!.pushNamed(nextPage!, queryParameters: allParams);
          }
        } else {
          actions.clearNavigate(nextPage!, {});
        }
      } catch (e, trace) {
        actions.clearNavigate("IntroductionScreen", {});
      }
    }
  });
}

Timer? _timer;
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

void _startTokenTimer() {
  _firebaseMessaging.requestPermission();
  if (_timer == null || (!(_timer?.isActive ?? false))) {
    _timer = Timer.periodic(const Duration(seconds: 60), (Timer timer) {
      if (currentUser?.uid?.isNotEmpty ?? false) {
        _getToken();
      }
    });
  }
}

Future<void> _getToken() async {
  try {
    await _firebaseMessaging.requestPermission();

    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      AuthenticationGroup.deviceTokenCall.call(token: token!);
    }
  } catch (e) {}
}

_handlePushNotification(RemoteMessage message) async {
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
}

Map<String, dynamic> _convertDatesInMap(Map<String, dynamic> map) {
  final updatedMap = <String, dynamic>{};

  for (final entry in map.entries) {
    if (entry.value is String && _isDateTime(entry.value)) {
      if (entry.key.contains("birth_date") ||
          entry.key.contains("date_birth") ||
          entry.key.contains("created_at") ||
          entry.key.contains("updated_at")) {
        updatedMap[entry.key] = DateTime.parse(entry.value);
      } else {
        updatedMap[entry.key] = entry.value;
      }
    } else if (entry.value is Map<String, dynamic>) {
      updatedMap[entry.key] = _convertDatesInMap(entry.value);
    } else if (entry.value is List) {
      updatedMap[entry.key] = _convertDatesInList(entry.value);
    } else {
      updatedMap[entry.key] = entry.value;
    }
  }
  return updatedMap;
}

/// Bir List'in içindeki tüm DateTime stringlerini dönüştürür
List<dynamic> _convertDatesInList(List<dynamic> list) {
  return list.map((item) {
    if (item is String && _isDateTime(item)) {
      return DateTime.parse(item);
    } else if (item is Map<String, dynamic>) {
      return _convertDatesInMap(item);
    } else if (item is List) {
      return _convertDatesInList(item);
    }
    return item;
  }).toList();
}

bool _isDateTime(String value) {
  try {
    DateTime.parse(value);

    return true;
  } catch (e) {
    return false;
  }
}
