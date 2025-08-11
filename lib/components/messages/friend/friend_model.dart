import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friend_widget.dart' show FriendWidget;
import 'package:flutter/material.dart';

class FriendModel extends FlutterFlowModel<FriendWidget> {
  ///  Local state fields for this component.

  bool loading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Block User)] action in Container widget.
  ApiCallResponse? apiResult0iz;
  // Stores action output result for [Backend Call - API (Touch)] action in Container widget.
  ApiCallResponse? touchResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
