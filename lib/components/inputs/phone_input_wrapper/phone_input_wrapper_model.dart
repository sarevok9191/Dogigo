import '/flutter_flow/flutter_flow_util.dart';
import 'phone_input_wrapper_widget.dart' show PhoneInputWrapperWidget;
import 'package:flutter/material.dart';

class PhoneInputWrapperModel extends FlutterFlowModel<PhoneInputWrapperWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CustomInput widget.
  FocusNode? customInputFocusNode;
  TextEditingController? customInputTextController;
  String? Function(BuildContext, String?)? customInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    customInputFocusNode?.dispose();
    customInputTextController?.dispose();
  }
}
