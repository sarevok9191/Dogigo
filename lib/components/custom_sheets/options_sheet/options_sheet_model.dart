import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'options_sheet_widget.dart' show OptionsSheetWidget;
import 'package:flutter/material.dart';

class OptionsSheetModel extends FlutterFlowModel<OptionsSheetWidget> {
  ///  Local state fields for this component.

  List<SelectableOptionTypeStruct> searchResults = [];
  void addToSearchResults(SelectableOptionTypeStruct item) =>
      searchResults.add(item);
  void removeFromSearchResults(SelectableOptionTypeStruct item) =>
      searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(
          int index, SelectableOptionTypeStruct item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(
          int index, Function(SelectableOptionTypeStruct) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchSelectableOptions] action in TextField widget.
  List<SelectableOptionTypeStruct>? searchResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
