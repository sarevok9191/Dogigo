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

Future clearNavigate(String name, dynamic? pathParameters) async {
  if (appNavigatorKey.currentContext != null) {
    final context = appNavigatorKey.currentContext!;
    while (context.canPop() == true) {
      context.pop();
    }
    context.pushReplacementNamed(
      name,
      queryParameters:
          pathParameters != null && pathParameters is Map<String, dynamic>
              ? pathParameters
              : (const <String, dynamic>{}),
      // pathParameters:
      //     pathParameters != null && pathParameters is Map<String, dynamic>
      //         ? pathParameters.map((key, value) => MapEntry(key, value.toString()))
      //         : (const <String, String>{}),
    );
  }
}
