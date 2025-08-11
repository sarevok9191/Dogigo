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
import '/pages/messages/message_screen/message_screen_widget.dart';
Future goToMessageDetail(
  BuildContext context,
  FriendTypeStruct friend,
  Future Function()? onBack,
) async {
  await context.pushNamed(
    MessageScreenWidget.routeName,
    queryParameters: {
      'token': serializeParam(
        friend.chatToken,
        ParamType.String,
      ),
      'receiverId': serializeParam(
        friend.id,
        ParamType.int,
      ),
      'receiverPhoto': serializeParam(
        friend.avatar?.url,
        ParamType.String,
      ),
      'receiverName': serializeParam(
        friend.firstName,
        ParamType.String,
      ),
    }.withoutNulls,
  );
  onBack?.call();
}
