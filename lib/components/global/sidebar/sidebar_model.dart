import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sidebar_widget.dart' show SidebarWidget;
import 'package:flutter/material.dart';

class SidebarModel extends FlutterFlowModel<SidebarWidget> {
  ///  Local state fields for this component.

  bool isDogsOpen = false;

  bool loading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Sidebar)] action in Sidebar widget.
  ApiCallResponse? apiResultodz;
  // Stores action output result for [Custom Action - readLocalStorage] action in Button widget.
  String? refreshToken;
  // Stores action output result for [Backend Call - API (Logout)] action in Button widget.
  ApiCallResponse? apiResult3ps;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
