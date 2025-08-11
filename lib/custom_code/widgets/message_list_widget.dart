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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'dart:ui';
import '/components/messages/message/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class MessageListWidget extends StatefulWidget {
  const MessageListWidget(
      {super.key,
      required this.token,
      required this.receiverId,
      required this.receiverName,
      this.onLongPressMessageItem,
      this.width,
      this.height});

  final String token;
  final String receiverName;
  final int receiverId;
  final double? width;
  final double? height;
  final Future Function(MessagesRecord message)? onLongPressMessageItem;
  @override
  State<MessageListWidget> createState() => _MessageListWidgetState();
}

class _MessageListWidgetState extends State<MessageListWidget> {
  final firestore = FirebaseFirestore.instance;

  StreamSubscription? _streamSubscription;
  ScrollController _listviewController = ScrollController();
  bool _snapShotFetchedFirstData = false;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
  @override
  void initState() {
    super.initState();

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    Stream _stream = queryCollection(
        firestore
            .collection('messages')
            .where('token', isEqualTo: widget.token),
        MessagesRecord.fromSnapshot);
    // On page load action.
    Future.delayed(Duration.zero, () async {
      actions.readChatMessages(
        'messages',
        widget!.token!,
        widget!.receiverId!,
      );

      Future.delayed(Duration(milliseconds: 100), () {
        safeSetState(() {});
      });
      _streamSubscription = _stream.listen((snapshot) {
        () async {
          if (_listviewController.positions.isNotEmpty) {}
        }();
      }, onError: (e) {
        print(e.toString());
      });
    });
  }

  @override
  void dispose() {
    print("dispose");
    _keyboardVisibilitySubscription?.cancel();
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return StreamBuilder(
        stream: queryCollection(
            firestore
                .collection('messages')
                .where('token', isEqualTo: widget.token)
                .orderBy('timestamp', descending: false),
            MessagesRecord.fromSnapshot),
        builder: (context, snapshot) {
          if ((!snapshot.hasData)) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          List<MessagesRecord> messageScreenMessagesRecordList =
              snapshot.data ?? [];
          if (!_snapShotFetchedFirstData) {
            _snapShotFetchedFirstData = true;
          }
          if (messageScreenMessagesRecordList
                  .where((elem) => elem.isReaded == false)
                  .length >
              0) {
            actions.readChatMessages(
              'messages',
              widget!.token!,
              widget!.receiverId!,
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.67,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).info,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    31.0, 0.0, 31.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final messageScreenVar =
                                        messageScreenMessagesRecordList
                                            .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        21.0,
                                        0,
                                        _isKeyboardVisible ? 20 : 35,
                                      ),
                                      reverse: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: messageScreenVar.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder:
                                          (context, messageScreenVarIndex) {
                                        final messageScreenVarItem =
                                            messageScreenVar.reversed.toList()[
                                                messageScreenVarIndex];
                                        return GestureDetector(
                                          onLongPress: () => widget
                                              .onLongPressMessageItem
                                              ?.call(messageScreenVarItem),
                                          child: MessageWidget(
                                            key: Key(
                                                'Key4mo_${messageScreenVarIndex}_of_${messageScreenVar.length}'),
                                            messageInfos: messageScreenVarItem,
                                            receiverName: widget!.receiverName,
                                          ),
                                        );
                                      },
                                      controller: _listviewController,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 15.0)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
