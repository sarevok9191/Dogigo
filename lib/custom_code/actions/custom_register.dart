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

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_interceptor.dart';
import '/backend/api_requests/api_calls.dart';
import '/custom_code/actions/index.dart' as actions;
import '/backend/api_requests/api_manager.dart';
import 'package:dio/dio.dart';

Future<bool> customRegister(dynamic data) async {
  final baseUrl = AuthenticationGroup.getBaseUrl();
  var context = appNavigatorKey.currentContext!;

  var dio = Dio();
  final url = '${baseUrl}register';
  print(data);
  var formData = FormData.fromMap(data);

  try {
    var response = await dio.post(
      url,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    if (response.data != null) {
      print(response.data);
    }

    int statusCode = response.statusCode ?? -1;
    if (statusCode >= 200 && statusCode < 300) {
      await actions.writeLocalStorage(
        'refresh_token',
        getJsonField(
          (response.data ?? ''),
          r'''$.refresh_token''',
        ).toString(),
      );
      await actions.writeLocalStorage(
        'access_token',
        getJsonField(
          (response.data ?? ''),
          r'''$.access_token''',
        ).toString(),
      );
      GoRouter.of(context).prepareAuthEvent();
      final user = await authManager.signInWithJwtToken(
        context,
        getJsonField(
          (response.data ?? ''),
          r'''$.access_token''',
        ).toString(),
      );
      if (user == null) {
        return false;
      }
      return true;
    }
    return false;
  } on DioError catch (e) {
    if (e.response != null) {
      // Hata mesajını yazdırma
      print('Hata Kodu: ${e.response?.statusCode}');
      print('Hata Mesajı: ${e.response?.data}');
    } else {
      // Bağlantı hatası gibi durumlar
      print('Hata: ${e.message}');
    }
    return false;
  } catch (e) {
    // Diğer olası hatalar
    print('Beklenmeyen Hata: $e');
    return false;
  }
}
