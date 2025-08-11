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

import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;

Future<bool> purchasePackage(String packageIdenfitier) async {
  if (revenue_cat.customerInfo == null) {
    await revenue_cat.loadCustomerInfo();
  }
  if (revenue_cat.offerings == null) {
    await revenue_cat.loadOfferings();
  }
  bool purchaseStatus = await revenue_cat.purchasePackage(packageIdenfitier);
  return purchaseStatus;
}
