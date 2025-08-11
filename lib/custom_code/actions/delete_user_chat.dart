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

import 'package:cloud_firestore/cloud_firestore.dart';

Future deleteUserChat(String token) async {
  final firestore = FirebaseFirestore.instance;

  Query query = firestore.collection('messages');
  query = query.where('token', isEqualTo: token);

  final querySnapshot = await query.get();
  final batch = firestore.batch();

  for (var doc in querySnapshot.docs) {
    batch.delete(doc.reference);
  }

  await batch.commit();
}
