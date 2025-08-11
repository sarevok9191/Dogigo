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

import '/custom_code/actions/index.dart' as actions;
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';

import 'dart:async';

Future tryLoginLocalStorage() async {
  if (currentUser == null ||
      (currentUser?.uid == null ?? true) ||
      (currentUser?.uid?.isEmpty ?? true)) {
    String? accessToken = await actions.readLocalStorage(
      'access_token',
    );
    final context = appNavigatorKey.currentContext;

    if (accessToken != null && accessToken != '' && context != null) {
      GoRouter.of(context).prepareAuthEvent();
      final user = await authManager.signInWithJwtToken(
        context,
        accessToken,
      );
      if (user != null) {
        AppStateNotifier.instance.update(user);
        ApiCallResponse response =
            await ProfileGroup.getProfileInfosCall.call();
        if (response.jsonBody != null && response.jsonBody is Map) {
          dynamic jsonResponse = _convertDatesInMap(response.jsonBody);
          if ((response?.succeeded ?? false) && context != null) {
            FFAppState().CurrentUser = UserStruct.maybeFromMap(getJsonField(
              (jsonResponse),
              r'''$.user''',
            ))!;
            unawaited(
              () async {
                await actions.storeDeviceToken();
              }(),
            );
            if ((FFAppState().CurrentUser.preferredLocale != null &&
                    FFAppState().CurrentUser.preferredLocale != '') &&
                ((FFAppState().CurrentUser.preferredLocale == 'tr') ||
                    (FFAppState().CurrentUser.preferredLocale == 'en'))) {
              setAppLanguage(
                  context!, FFAppState().CurrentUser.preferredLocale);
              await action_blocks.getStaticValues(context!);
            }
          }
        }
      }
    }
  }
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
