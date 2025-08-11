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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '/components/messages/conversation/conversation_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageListItem extends StatefulWidget {
  const MessageListItem({
    super.key,
    this.width,
    this.height,
    required this.messagesItem,
    this.onclickDelete,
  });

  final double? width;
  final double? height;
  final FriendTypeStruct messagesItem;
  final Future Function()? onclickDelete;
  @override
  State<MessageListItem> createState() => _MessageListItemState();
}

class _MessageListItemState extends State<MessageListItem> with AutomaticKeepAliveClientMixin{
   @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // Generated code for this Column Widget...
    return FutureBuilder<List<MessagesRecord>>(
      future: queryMessagesRecordOnce(
        queryBuilder: (messagesRecord) => messagesRecord.where(
          'token',
          isEqualTo: widget.messagesItem.chatToken,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return SizedBox(
            width: 0,
            height: 0,
          );
        }
        List<MessagesRecord> columnMessagesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnMessagesRecord = columnMessagesRecordList.isNotEmpty
            ? columnMessagesRecordList.first
            : null;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: (ctx) {
                      if (widget.onclickDelete != null) {
                        widget.onclickDelete?.call();
                      }
                    },
                    icon: Icons.delete,
                    backgroundColor: FlutterFlowTheme.of(context).error,
                    foregroundColor: Colors.white,
                    label: FFLocalizations.of(context).getVariableText(
                      trText: 'Sil',
                      enText: 'Delete',
                    ),
                  ),
                ],
              ),
              child: ConversationWidget(
                key: Key('Keynvs_${widget.messagesItem.chatToken}_of_'),
                messageInfo: widget.messagesItem,
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ],
        );
      },
    );
  }
}
