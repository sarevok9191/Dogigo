import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_dropdown_widget.dart' show SelectDropdownWidget;
import 'package:flutter/material.dart';

class SelectDropdownModel extends FlutterFlowModel<SelectDropdownWidget> {
  ///  Local state fields for this component.

  SelectableOptionTypeStruct? value;
  void updateValueStruct(Function(SelectableOptionTypeStruct) updateFn) {
    updateFn(value ??= SelectableOptionTypeStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
