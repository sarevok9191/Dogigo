import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'search_screen_widget.dart' show SearchScreenWidget;
import 'package:flutter/material.dart';

class SearchScreenModel extends FlutterFlowModel<SearchScreenWidget> {
  ///  Local state fields for this page.

  bool imageVisible = false;

  bool isDogsOpen = false;

  bool loading = false;

  double safePadding = 0.0;

  List<SearchResultItemStruct> searchResults = [];
  void addToSearchResults(SearchResultItemStruct item) =>
      searchResults.add(item);
  void removeFromSearchResults(SearchResultItemStruct item) =>
      searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(int index, SearchResultItemStruct item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(
          int index, Function(SearchResultItemStruct) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  int? requestingId;

  bool requestLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getSafeTopPadding] action in SearchScreen widget.
  double? safeTopPadding;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Block User)] action in Container widget.
  ApiCallResponse? apiResult0iz;
  // Stores action output result for [Backend Call - API (Touch)] action in Container widget.
  ApiCallResponse? touchResponse;
  // Stores action output result for [Backend Call - API (Send Friend Request)] action in Container widget.
  ApiCallResponse? apiResultiex;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Stores action output result for [Backend Call - API (Update Map Show)] action in Row widget.
  ApiCallResponse? apiResultwhb;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navbarModel.dispose();
    sidebarModel.dispose();
  }

  /// Action blocks.
  Future initial(BuildContext context) async {}

  Future search(BuildContext context) async {
    ApiCallResponse? apiResulthokCopy;

    apiResulthokCopy = await UserActionsGroup.searchCall.call(
      username: textController.text,
    );

    if ((apiResulthokCopy.succeeded ?? true)) {
      searchResults = (getJsonField(
        (apiResulthokCopy.jsonBody ?? ''),
        r'''$.users''',
        true,
      )!
              .toList()
              .map<SearchResultItemStruct?>(SearchResultItemStruct.maybeFromMap)
              .toList() as Iterable<SearchResultItemStruct?>)
          .withoutNulls
          .toList()
          .cast<SearchResultItemStruct>();
    }
  }
}
