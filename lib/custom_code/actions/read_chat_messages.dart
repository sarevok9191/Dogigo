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
import '/custom_code/actions/index.dart' as actions;

Future readChatMessages(
  String collection,
  String token,
  int senderId,
) async {
  // Add your function code here!

  final firestore = FirebaseFirestore.instance;

  // Koşullara uygun belgeleri sorgula
  Query query = firestore.collection(collection);
  query = query.where('token', isEqualTo: token);
  query = query.where('senderId', isEqualTo: senderId);
  query = query.where('isReaded', isEqualTo: false);
  // Sorguyu çalıştır ve belgeleri al
  final querySnapshot = await query.get();

  // Batch işlem başlat
  final batch = firestore.batch();

  // Her belgeyi batch'e ekle
  for (var doc in querySnapshot.docs) {
    batch.update(doc.reference, {'isReaded': true});
  }

  // Batch işlemini çalıştır
  await batch.commit();
  await actions.fetchUnreadMessages([token]);
}
