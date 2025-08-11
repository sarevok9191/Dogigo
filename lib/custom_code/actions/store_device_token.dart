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

import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/auth/firebase_auth/auth_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

Future storeDeviceToken() async {
  try {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      AuthenticationGroup.deviceTokenCall.call(token: token!);
    }
  } catch (e) {}
}
