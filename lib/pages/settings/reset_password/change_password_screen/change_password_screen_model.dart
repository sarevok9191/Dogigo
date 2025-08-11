import '/backend/api_requests/api_calls.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_screen_widget.dart' show ChangePasswordScreenWidget;
import 'package:flutter/material.dart';

class ChangePasswordScreenModel
    extends FlutterFlowModel<ChangePasswordScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for CurrentPassword.
  late EmailWrapperModel currentPasswordModel;
  // Model for NewPassword.
  late EmailWrapperModel newPasswordModel;
  // Model for RepeatPassword.
  late EmailWrapperModel repeatPasswordModel;
  // Stores action output result for [Backend Call - API (Change Password)] action in SignIn widget.
  ApiCallResponse? apiResultwuw;

  @override
  void initState(BuildContext context) {
    currentPasswordModel = createModel(context, () => EmailWrapperModel());
    newPasswordModel = createModel(context, () => EmailWrapperModel());
    repeatPasswordModel = createModel(context, () => EmailWrapperModel());
  }

  @override
  void dispose() {
    currentPasswordModel.dispose();
    newPasswordModel.dispose();
    repeatPasswordModel.dispose();
  }
}
