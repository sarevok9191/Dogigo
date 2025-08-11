import '/backend/api_requests/api_calls.dart';
import '/components/inputs/text_area_wrapper/text_area_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'report_sheet_widget.dart' show ReportSheetWidget;
import 'package:flutter/material.dart';

class ReportSheetModel extends FlutterFlowModel<ReportSheetWidget> {
  ///  Local state fields for this component.

  bool isDone = false;

  ///  State fields for stateful widgets in this component.

  // Model for TextAreaWrapper component.
  late TextAreaWrapperModel textAreaWrapperModel;
  // State field(s) for SexualContentSwitch widget.
  bool? sexualContentSwitchValue;
  // State field(s) for ViolentContentSwitch widget.
  bool? violentContentSwitchValue;
  // State field(s) for SpamContentSwitch widget.
  bool? spamContentSwitchValue;
  // State field(s) for CopyrightContentSwitch widget.
  bool? copyrightContentSwitchValue;
  // Stores action output result for [Backend Call - API (Report Content)] action in Button widget.
  ApiCallResponse? apiResultpp1;

  @override
  void initState(BuildContext context) {
    textAreaWrapperModel = createModel(context, () => TextAreaWrapperModel());
  }

  @override
  void dispose() {
    textAreaWrapperModel.dispose();
  }
}
