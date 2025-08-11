import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

String calculateAge(DateTime? date) {
  try {
    DateTime birthDate = date ?? DateTime.now();
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age.toString();
  } catch (e) {
    return "-";
  }
}

int increaseInteger(
  int value,
  int increase,
) {
  return value + increase;
}

int profilePhotofindIndexByProperty(
  List<ProfilePhotoTypeStruct> list,
  int id,
) {
  for (int i = 0; i < list.length; i++) {
    if (list[i].id == id) {
      return i;
    }
  }
  return -1; // Eğer bulunamazsa -1 döndür
}

List<ProfilePhotoTypeStruct> sortListByOrder(
  List<ProfilePhotoTypeStruct> list,
  bool ascending,
) {
  list.sort((a, b) {
    var valueA = a.sortOrder;
    var valueB = b.sortOrder;
    if (valueA is num && valueB is num) {
      return ascending ? valueA.compareTo(valueB) : valueB.compareTo(valueA);
    } else if (valueA is String && valueB is String) {
      return ascending ? valueA.compareTo(valueB) : valueB.compareTo(valueA);
    }
    return 0; // Eğer sıralanamıyorsa
  });
  if (list.length < 6) {
    // Listeyi 6 elemana tamamla
    while (list.length < 6) {
      list.add(ProfilePhotoTypeStruct()); // Boş öğe ekleme
    }
  }
  return list;
}

double getLocationValue(
  LatLng location,
  String value,
) {
  if (value == 'latitude') {
    return location.latitude;
  }
  return location.longitude;
}

bool modeCheck(
  int value,
  int modeValue,
) {
  return ((value % modeValue) == 0);
}

List<ProfilePhotoTypeStruct> listfileTypeToProfilePhotoType(
    List<FileTypeStruct> files) {
  return files
      .map((item) => ProfilePhotoTypeStruct.fromMap(item.toMap()))
      .toList();
}

String getValidationErrorMessages(dynamic response) {
  if (response is Map && response.containsKey('errors')) {
    final errors = response['errors'];

    if (errors is Map) {
      return errors.values.expand((value) {
        if (value is List) {
          return value.cast<String>(); // Cast to List<String>
        } else if (value is String) {
          return [value];
        } else {
          return []; // Skip invalid entries
        }
      }).join('\n');
    }
  }
  return '';
}

double increaseDouble(
  double increasing,
  double value,
) {
  return value + increasing;
}

List<String> generateReasonList(
  bool sexual,
  bool violent,
  bool spam,
  bool copyright,
) {
  List<String> reasons = [];

  if (sexual) {
    reasons.add('sexual');
  }
  if (violent) {
    reasons.add('violent');
  }
  if (spam) {
    reasons.add('spam');
  }
  if (copyright) {
    reasons.add('copyright');
  }

  return reasons;
}

int calcAgeInteger(DateTime? date) {
  try {
    DateTime birthDate = date ?? DateTime.now();
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  } catch (e) {
    return 0;
  }
}

String trimString(String string) {
  return string.trim();
}
