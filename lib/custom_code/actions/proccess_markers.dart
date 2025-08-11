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

import '/flutter_flow/nav/serialization_util.dart';

Future<List<MarkerStruct>> proccessMarkers(dynamic data) async {
  final Map<String, dynamic> jsonData = data as Map<String, dynamic>;
  if (jsonData.containsKey("records")) {
    // 'records' listesini dinamik olarak işle
    List<dynamic> records = jsonData['records'] as List<dynamic>;
    records = _convertDatesInList(records);
    List<MarkerStruct> users = records.map((record) {
      record["id"] = record["id"].toString();
      record["position"] =
          deserializeParam(record["location"], ParamType.LatLng, false);
      return MarkerStruct.fromMap(record);
    }).toList();

    return users;
  }
  return [];
}

Map<String, dynamic> _convertDatesInMap(Map<String, dynamic> map) {
  final updatedMap = <String, dynamic>{};
  for (final entry in map.entries) {
    if (entry.value is String && _isDateTime(entry.value)) {
      updatedMap[entry.key] = DateTime.parse(entry.value);
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

/// Bir string'in DateTime formatına uygun olup olmadığını kontrol eder
bool _isDateTime(String value) {
  try {
    DateTime.parse(value);
    return true;
  } catch (e) {
    return false;
  }
}
