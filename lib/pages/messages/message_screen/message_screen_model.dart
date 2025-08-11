import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'message_screen_widget.dart' show MessageScreenWidget;
import 'package:flutter/material.dart';

class MessageScreenModel extends FlutterFlowModel<MessageScreenWidget> {
  ///  Local state fields for this page.

  bool isDogsOpen = false;

  double safeTop = 0.0;

  bool messagesBlocking = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Check Chat)] action in MessageScreen widget.
  ApiCallResponse? checkResp;
  // Stores action output result for [Backend Call - API (Touch)] action in IconButton widget.
  ApiCallResponse? apiResultvruCopy;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? createTouchMessageCopy;
  // Stores action output result for [Backend Call - API (Block User)] action in IconButton widget.
  ApiCallResponse? apiResult0iz;
  // State field(s) for MessageText widget.
  FocusNode? messageTextFocusNode;
  TextEditingController? messageTextTextController;
  String? Function(BuildContext, String?)? messageTextTextControllerValidator;
  // Stores action output result for [Backend Call - API (Check Chat)] action in Image widget.
  ApiCallResponse? apiResult18o;
  // Stores action output result for [Backend Call - Create Document] action in Image widget.
  MessagesRecord? createMessage;
  // Stores action output result for [Backend Call - API (Check Chat)] action in Container widget.
  ApiCallResponse? checkRespImage;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MessagesRecord? createImageMessage;
  // Stores action output result for [Backend Call - API (onMessage)] action in Container widget.
  ApiCallResponse? apiResulte9b2;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    messageTextFocusNode?.dispose();
    messageTextTextController?.dispose();

    sidebarModel.dispose();
  }
}
