import '/backend/api_requests/api_calls.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_settings_screen_widget.dart'
    show NewPasswordSettingsScreenWidget;
import 'package:flutter/material.dart';

class NewPasswordSettingsScreenModel
    extends FlutterFlowModel<NewPasswordSettingsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NewPassword.
  late TextInputWrapperModel newPasswordModel;
  // Model for ConfirmPassword.
  late TextInputWrapperModel confirmPasswordModel;
  // Stores action output result for [Backend Call - API (Reset Password)] action in SignIn widget.
  ApiCallResponse? apiResultbno;

  @override
  void initState(BuildContext context) {
    newPasswordModel = createModel(context, () => TextInputWrapperModel());
    confirmPasswordModel = createModel(context, () => TextInputWrapperModel());
    newPasswordModel.customInputTextControllerValidator =
        _formTextFieldValidator1;
    confirmPasswordModel.customInputTextControllerValidator =
        _formTextFieldValidator2;
  }

  @override
  void dispose() {
    newPasswordModel.dispose();
    confirmPasswordModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o21247h0' /* Bu alan zorunludur */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'fakej337' /* Şifre en az 8 karakterden oluş... */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8cinf32k' /* Bu alan zorunludur */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'tcbfa2m9' /* Şifre en az 8 karakterden oluş... */,
      );
    }

    return null;
  }
}
