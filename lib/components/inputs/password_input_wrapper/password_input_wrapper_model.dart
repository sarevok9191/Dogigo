import '/flutter_flow/flutter_flow_util.dart';
import 'password_input_wrapper_widget.dart' show PasswordInputWrapperWidget;
import 'package:flutter/material.dart';

class PasswordInputWrapperModel
    extends FlutterFlowModel<PasswordInputWrapperWidget> {
  ///  Local state fields for this component.

  bool show = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CustomInput widget.
  FocusNode? customInputFocusNode;
  TextEditingController? customInputTextController;
  late bool customInputVisibility;
  String? Function(BuildContext, String?)? customInputTextControllerValidator;

  @override
  void initState(BuildContext context) {
    customInputVisibility = false;
  }

  @override
  void dispose() {
    customInputFocusNode?.dispose();
    customInputTextController?.dispose();
  }
}
