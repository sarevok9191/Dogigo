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
import 'package:cloud_firestore/cloud_firestore.dart';

Future fetchUnreadMessages(List<dynamic> tokenList) async {
  final firestore = FirebaseFirestore.instance;
  FFAppState().UnreadedMessageCount = 0;

  for (var i = 0; i < tokenList.length; i += 10) {
    var chunk = tokenList.sublist(
        i, i + 10 > tokenList.length ? tokenList.length : i + 10);

    QuerySnapshot querySnapshot = await firestore
        .collection('messages')
        .where('token', whereIn: chunk)
        .where('isReaded', isEqualTo: false)
        .where("receiverId", isEqualTo: FFAppState().CurrentUser.id)
        .get();

    int unreadCount = querySnapshot.docs.length;
    FFAppState().UnreadedMessageCount += unreadCount;
  }

  FFAppState().HasMessage = FFAppState().UnreadedMessageCount > 0;
  FFAppState().update(() {});
}
