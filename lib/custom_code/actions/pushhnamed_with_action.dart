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

Future pushhnamedWithAction(
  BuildContext context,
  String pageName,
  Future Function()? onBack,
  dynamic? pageData,
) async {
  print(pageData);
  context
      .pushNamed(pageName,
          queryParameters: pageData != null && pageData is Map
              ? pageData as Map<String, dynamic>
              : {})
      .then((_) {
    onBack?.call();
  });
}
