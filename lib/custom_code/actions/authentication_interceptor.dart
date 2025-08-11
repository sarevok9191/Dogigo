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

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_interceptor.dart';
import '/backend/api_requests/api_calls.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:developer';

class AuthenticationInterceptor extends FFApiInterceptor {
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Clone the options and add the Authorization header if JWT token exists
    var clonedOptions = options.clone();
    var accessToken = currentJwtToken;
    if (accessToken != null && accessToken.isNotEmpty) {
      clonedOptions.headers["Authorization"] = 'Bearer $accessToken';
    }
    return clonedOptions;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // If response status is 401 (Unauthorized), handle token refresh

    if (response.statusCode == 401) {
      UserStruct? user = await actions.refreshLogin();
      if (user != null) {
        return retryFn();
      } else {
        try {
          String? originalUrl = (response.response?.request?.url)?.toString();
        
          if (originalUrl != null && originalUrl.isNotEmpty) {
            Uri url = Uri.parse(originalUrl);
            List<String> excludedUrls = [
              '/api/map/users',
              '/api/map/show-types',
              '/api/update-location',
              '/api/user/devicetoken',
              'api/chatAllTokens'
            ];
            print(originalUrl);
            String? conditionalUrl = excludedUrls
                .where((element) => element == url.path)
                .firstOrNull;
            final context = appNavigatorKey.currentContext;

            if (context != null) {
              // if(! ["splashScreen","loginScreen","registerScreen","forgotPasswordRecreatePasswordScreen","forgotPasswordEnterCodeScreen","forgotPasswordScreen"].contains(currentRoute)){
              //   _navigateToIntroductionScreen();
              // }
              print("modalroute");
              print(Navigator.of(context).widget.pages);
            }
            if (conditionalUrl != null && (!FFAppState().AppMounted)) {
              return response;
            } else {
              _navigateToIntroductionScreen();
            }
          }
        } catch (e) {}
      }
      // If refresh fails, navigate to the introduction screen
    }

    return response;
  }

  void _navigateToIntroductionScreen() {
    if (appNavigatorKey.currentContext != null) {
      final context = appNavigatorKey.currentContext!;
      String currentRoute = getCurrentRoute(context);
      if (currentRoute.isNotEmpty) {
        if ([
          "/introductionScreen",
          "/splashScreen",
          "/loginScreen",
          "/registerScreen",
          "/forgotPasswordRecreatePasswordScreen",
          "/forgotPasswordEnterCodeScreen",
          "/forgotPasswordScreen"
        ].contains(currentRoute)) {
          return;
        }
      }

      GoRouter.of(context).prepareAuthEvent();
      actions.clearNavigate('IntroductionScreen', {});
    }
  }
}
