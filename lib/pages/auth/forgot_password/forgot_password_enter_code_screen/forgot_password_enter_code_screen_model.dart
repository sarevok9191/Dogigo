import '/backend/api_requests/api_calls.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_enter_code_screen_widget.dart'
    show ForgotPasswordEnterCodeScreenWidget;
import 'package:flutter/material.dart';

class ForgotPasswordEnterCodeScreenModel
    extends FlutterFlowModel<ForgotPasswordEnterCodeScreenWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for EmailWrapper component.
  late EmailWrapperModel emailWrapperModel;
  // Stores action output result for [Backend Call - API (Check Reset Code)] action in SignIn widget.
  ApiCallResponse? apiResult8ea;

  @override
  void initState(BuildContext context) {
    emailWrapperModel = createModel(context, () => EmailWrapperModel());
    emailWrapperModel.customInputTextControllerValidator =
        _formTextFieldValidator;
  }

  @override
  void dispose() {
    emailWrapperModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2ktv9smx' /* Bu alan zorunludur */,
      );
    }

    return null;
  }
}
