import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_reports_sheet_widget.dart' show SettingsReportsSheetWidget;
import 'package:flutter/material.dart';

class SettingsReportsSheetModel
    extends FlutterFlowModel<SettingsReportsSheetWidget> {
  ///  Local state fields for this component.

  List<int> selectedItems = [];
  void addToSelectedItems(int item) => selectedItems.add(item);
  void removeFromSelectedItems(int item) => selectedItems.remove(item);
  void removeAtIndexFromSelectedItems(int index) =>
      selectedItems.removeAt(index);
  void insertAtIndexInSelectedItems(int index, int item) =>
      selectedItems.insert(index, item);
  void updateSelectedItemsAtIndex(int index, Function(int) updateFn) =>
      selectedItems[index] = updateFn(selectedItems[index]);

  List<BlockedUserStruct> blockedFriends = [];
  void addToBlockedFriends(BlockedUserStruct item) => blockedFriends.add(item);
  void removeFromBlockedFriends(BlockedUserStruct item) =>
      blockedFriends.remove(item);
  void removeAtIndexFromBlockedFriends(int index) =>
      blockedFriends.removeAt(index);
  void insertAtIndexInBlockedFriends(int index, BlockedUserStruct item) =>
      blockedFriends.insert(index, item);
  void updateBlockedFriendsAtIndex(
          int index, Function(BlockedUserStruct) updateFn) =>
      blockedFriends[index] = updateFn(blockedFriends[index]);

  bool isLoaded = false;

  List<BlockedUserStruct> searchResults = [];
  void addToSearchResults(BlockedUserStruct item) => searchResults.add(item);
  void removeFromSearchResults(BlockedUserStruct item) =>
      searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(int index, BlockedUserStruct item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(
          int index, Function(BlockedUserStruct) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Blocked Friends)] action in settingsReportsSheet widget.
  ApiCallResponse? blockedUsersResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchBlockedUsers] action in TextField widget.
  List<BlockedUserStruct>? blockedSearchResponse;
  // Stores action output result for [Backend Call - API (Block Users)] action in Container widget.
  ApiCallResponse? apiResulth5d;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
