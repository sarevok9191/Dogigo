import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_friends_sheet_widget.dart' show SettingsFriendsSheetWidget;
import 'package:flutter/material.dart';

class SettingsFriendsSheetModel
    extends FlutterFlowModel<SettingsFriendsSheetWidget> {
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

  List<FriendTypeStruct> friends = [];
  void addToFriends(FriendTypeStruct item) => friends.add(item);
  void removeFromFriends(FriendTypeStruct item) => friends.remove(item);
  void removeAtIndexFromFriends(int index) => friends.removeAt(index);
  void insertAtIndexInFriends(int index, FriendTypeStruct item) =>
      friends.insert(index, item);
  void updateFriendsAtIndex(int index, Function(FriendTypeStruct) updateFn) =>
      friends[index] = updateFn(friends[index]);

  List<FriendTypeStruct> searchResults = [];
  void addToSearchResults(FriendTypeStruct item) => searchResults.add(item);
  void removeFromSearchResults(FriendTypeStruct item) =>
      searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(int index, FriendTypeStruct item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(
          int index, Function(FriendTypeStruct) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Profile Visibility)] action in settingsFriendsSheet widget.
  ApiCallResponse? apiResultbal;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchFriends] action in TextField widget.
  List<FriendTypeStruct>? searchResponse;
  // Stores action output result for [Backend Call - API (Update Profile Visibility)] action in Container widget.
  ApiCallResponse? apiResultydz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
