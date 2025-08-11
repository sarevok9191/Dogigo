import '/backend/api_requests/api_calls.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'check_code_screen_widget.dart' show CheckCodeScreenWidget;
import 'package:flutter/material.dart';

class CheckCodeScreenModel extends FlutterFlowModel<CheckCodeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NewPassword.
  late EmailWrapperModel newPasswordModel;
  // Stores action output result for [Backend Call - API (Check Reset Code)] action in SignIn widget.
  ApiCallResponse? apiResultksb;

  @override
  void initState(BuildContext context) {
    newPasswordModel = createModel(context, () => EmailWrapperModel());
  }

  @override
  void dispose() {
    newPasswordModel.dispose();
  }
}
