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

import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:mime_type/mime_type.dart';

import 'package:dio/dio.dart' as dio;

Future<dynamic> createRegisterData(
    UserStruct user,
    List<DogRelationTypeStruct> dogs,
    FFUploadedFile? userAvatar,
    FFUploadedFile? primaryDogAvatar,
    List<FFUploadedFile> dogAvatars,
    String password,
    String passwordConfirmation) async {
  // User verisini dönüştür
  Map<String, dynamic> data = user.toMap().map((key, value) {
    // Eğer değer bir map ise ve içinde 'id' varsa sadece 'id' değerini al
    if (value is Map<String, dynamic> && value.containsKey("id")) {
      return MapEntry('${key}_id', value["id"]);
    }
    return MapEntry(key, value);
  });

  data["password"] = password;
  data["password_confirmation"] = passwordConfirmation;

  // Avatar kontrolü
  if (userAvatar != null && userAvatar?.bytes != null) {
    data["avatar"] = dio.MultipartFile.fromBytes(userAvatar.bytes!,
        filename: userAvatar!.name,
        contentType: getMediaTypeRegister(userAvatar!.name));
  }

  // Relations oluşturma
  data["relations"] = [];
  Map<String, dynamic> primaryDogData = {
    "action": "store",
    "key": "dogs",
    "data": {
      ...FFAppState().RegisteringUserPrimaryDog.toMap()
        ..map((key, value) {
          if (value is Map<String, dynamic> && value.containsKey("id")) {
            return MapEntry('${key}_id', value["id"]);
          }
          return MapEntry(key, value);
        })
    }
  };
  if (primaryDogAvatar != null) {
    primaryDogData["data"]["avatar"] = dio.MultipartFile.fromBytes(
        primaryDogAvatar.bytes!,
        filename: primaryDogAvatar!.name,
        contentType: getMediaTypeRegister(primaryDogAvatar!.name));
  }
  data["relations"].add(primaryDogData);
  for (var i = 0; i < dogs.length; i++) {
    DogRelationTypeStruct dog = dogs[i];
    Map<String, dynamic> dogData = {
      'action': 'store',
      'key': 'dogs',
      'data': {
        ...dog.toMap().map((key, value) {
          // Eğer değer bir map ise, sadece 'id' anahtarının değerini al
          if (value is Map<String, dynamic> && value.containsKey("id")) {
            return MapEntry('${key}_id', value["id"]);
          }
          return MapEntry(key, value);
        }),
      }
    };

    if (dogAvatars[i].bytes != null || dogAvatars[i].name != null) {
      dogData["data"]["avatar"] = dio.MultipartFile.fromBytes(
          dogAvatars[i].bytes!,
          filename: dogAvatars[i].name,
          contentType: getMediaTypeRegister(dogAvatars[i].name));
    }

    data["relations"].add(dogData);
  }

  return data;
}

dio.DioMediaType? getMediaTypeRegister(String? filename) {
  final contentType = mime(filename);
  if (contentType == null) {
    return null;
  }
  final parts = contentType.split('/');
  if (parts.length != 2) {
    return null;
  }
  return dio.DioMediaType(parts.first, parts.last);
}
