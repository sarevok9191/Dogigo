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

import '/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:patido_app/backend/api_requests/api_calls.dart';
import 'package:collection/collection.dart';

import 'index.dart'; // Imports other custom actions

import '/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:patido_app/backend/api_requests/api_calls.dart';
import 'package:collection/collection.dart';
import 'dart:async';

List<StreamSubscription> messageEventListener = [];
int _CurrentListeningId = 0;
Timer? _notificationListener;
Future listenMessageEvents() async {
  Timer.periodic(Duration(seconds: 10), (timer) async {
    if (FFAppState().CurrentUser.id != 0) {
      try {
        _CurrentListeningId = FFAppState().CurrentUser.id;
        final apiResult = await NotificationsGroup.getCountCall.call();
        if (apiResult.succeeded) {
          int? count = getJsonField(
            apiResult.jsonBody,
            r'''$.count''',
            false,
          );
          if (count != null) {
            FFAppState().UnReadNotificationCount = count!;
          } else {
            FFAppState().UnReadNotificationCount = 0;
          }
        }
      } catch (e) {
        FFAppState().UnReadNotificationCount = 0;
      } finally {
        FFAppState().update(() {});
      }
    }
  });
}
