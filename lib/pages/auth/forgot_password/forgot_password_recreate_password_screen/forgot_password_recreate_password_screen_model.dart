import '/backend/api_requests/api_calls.dart';
import '/components/inputs/password_input_wrapper/password_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_recreate_password_screen_widget.dart'
    show ForgotPasswordRecreatePasswordScreenWidget;
import 'package:flutter/material.dart';

class ForgotPasswordRecreatePasswordScreenModel
    extends FlutterFlowModel<ForgotPasswordRecreatePasswordScreenWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for PasswordInputWrapper component.
  late PasswordInputWrapperModel passwordInputWrapperModel1;
  // Model for PasswordInputWrapper component.
  late PasswordInputWrapperModel passwordInputWrapperModel2;
  // Stores action output result for [Backend Call - API (Reset Password)] action in SignIn widget.
  ApiCallResponse? apiResultd3p;

  @override
  void initState(BuildContext context) {
    passwordInputWrapperModel1 =
        createModel(context, () => PasswordInputWrapperModel());
    passwordInputWrapperModel2 =
        createModel(context, () => PasswordInputWrapperModel());
    passwordInputWrapperModel1.customInputTextControllerValidator =
        _formTextFieldValidator1;
    passwordInputWrapperModel2.customInputTextControllerValidator =
        _formTextFieldValidator2;
  }

  @override
  void dispose() {
    passwordInputWrapperModel1.dispose();
    passwordInputWrapperModel2.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'flas5k1r' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'upx7jwc0' /* Şifre en az 8 haneli olmalıdır... */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u207ip8w' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '0myww1od' /* Şifre en az 8 haneli olmalıdır... */,
      );
    }

    return null;
  }
}
