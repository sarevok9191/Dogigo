// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import '/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:patido_app/backend/api_requests/api_calls.dart';
import 'package:collection/collection.dart';
import 'dart:async';

class MessageCountListener extends StatefulWidget {
  const MessageCountListener({
    super.key,
    this.width,
    this.height,
    this.builder,
  });

  final double? width;
  final double? height;
  final Widget Function(int messageCount)? builder;

  @override
  State<MessageCountListener> createState() => _MessageCountListenerState();
}

class _MessageCountListenerState extends State<MessageCountListener> {
  Stream<List<MessagesRecord>>? _userDocStream;
  List tokens = [];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((duration)async{
      final apiResult = await MessagesGroup.allTokensCall.call();
      if (apiResult.succeeded) {
        tokens = getJsonField(
          apiResult.jsonBody,
          r'''$.tokens''',
          true,
        );
        _userDocStream = queryMessagesRecord(
          queryBuilder: (messagesRecord) => messagesRecord
              // .where('token', whereIn: tokens)
              .where('isReaded', isEqualTo: false)
              .where("receiverId", isEqualTo: FFAppState().CurrentUser.id),
          singleRecord: false,
        );
        safeSetState((){

        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return _userDocStream == null ? SizedBox(width: 0,height: 0,) : StreamBuilder<List<MessagesRecord>>(
      stream: _userDocStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(width: 0, height: 0);
        }
        Widget? builderResponse = widget.builder?.call(snapshot.data!.where((record) => tokens.contains(record.token)).length);
        if (builderResponse != null) {
          return builderResponse;
        }
        return Container(
          width: 0,
          height: 0,
        );
      },
    );
  }
}
