import '/backend/api_requests/api_calls.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/components/inputs/password_input_wrapper/password_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_screen_widget.dart' show LoginScreenWidget;
import 'package:flutter/material.dart';

class LoginScreenModel extends FlutterFlowModel<LoginScreenWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for EmailWrapper component.
  late EmailWrapperModel emailWrapperModel;
  // Model for PasswordInputWrapper component.
  late PasswordInputWrapperModel passwordInputWrapperModel;
  // Stores action output result for [Validate Form] action in SignIn widget.
  bool? loginFormValidate;
  // Stores action output result for [Backend Call - API (Login)] action in SignIn widget.
  ApiCallResponse? apiResultjdu;

  @override
  void initState(BuildContext context) {
    emailWrapperModel = createModel(context, () => EmailWrapperModel());
    passwordInputWrapperModel =
        createModel(context, () => PasswordInputWrapperModel());
    emailWrapperModel.customInputTextControllerValidator =
        _formTextFieldValidator1;
    passwordInputWrapperModel.customInputTextControllerValidator =
        _formTextFieldValidator2;
  }

  @override
  void dispose() {
    emailWrapperModel.dispose();
    passwordInputWrapperModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tyvtu294' /* Bu alan zorunludur */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'uq2mgm95' /* Email formatında olmalıdır */,
      );
    }
    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fyo6ov7b' /* Bu alan zorunludur */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'n123bw1d' /* Bu alan 8 karakterden uzun olm... */,
      );
    }

    return null;
  }
}
