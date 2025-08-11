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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:ui';

class LiveMessageCounterWidget extends StatefulWidget {
  final String token;
  final double? width;
  final double? height;

  LiveMessageCounterWidget({
    required this.token,
    this.width,
    this.height,
  });

  @override
  State<StatefulWidget> createState() => _LiveMessageCounter();
}

class _LiveMessageCounter extends State<LiveMessageCounterWidget> {
  int _messsageCount = 0;
  StreamSubscription? _listener;
  final firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      int currentUserId = FFAppState().CurrentUser.id;
      _listener = firestore
          .collection("messages")
          .where('token', isEqualTo: widget.token)
          .where('isReaded', isEqualTo: false)
          .where('receiverId', isEqualTo: currentUserId)
          .snapshots()
          .listen((snapshot) {
        _messsageCount = snapshot.docs.length;
        safeSetState(() {});
      });
    });
  }

  @override
  void dispose() {
    _listener?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return _listener == null || _messsageCount == 0
          ? Container()
          : Container(
              width: widget.width ?? 22.0,
              height: widget.height ?? 22.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                _messsageCount.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            );
    });
  }
}
