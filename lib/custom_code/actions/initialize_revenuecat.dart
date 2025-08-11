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

import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io' show Platform;

Future initializeRevenuecat(
  String iosKey,
  String androidKey,
) async {
  Purchases.setLogLevel(LogLevel.warn);
  if (Platform.isMacOS || Platform.isAndroid || Platform.isIOS) {
    Purchases.configure(PurchasesConfiguration(
        Platform.isIOS || Platform.isMacOS ? iosKey : androidKey));
  }
}
