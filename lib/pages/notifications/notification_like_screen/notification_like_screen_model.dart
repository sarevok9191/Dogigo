import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notification_like_screen_widget.dart' show NotificationLikeScreenWidget;
import 'package:flutter/material.dart';

class NotificationLikeScreenModel
    extends FlutterFlowModel<NotificationLikeScreenWidget> {
  ///  Local state fields for this page.

  bool isDogsOpen = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (Send Friend Request)] action in Container widget.
  ApiCallResponse? apiResulte7n;
  // Stores action output result for [Backend Call - API (Like)] action in Container widget.
  ApiCallResponse? apiResultqpk;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
