import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool imageVisible = false;

  bool isDogsOpen = false;

  bool loading = true;

  double safePadding = 0.0;

  ///  State fields for stateful widgets in this page.

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
    navbarModel.dispose();
    sidebarModel.dispose();
  }

  /// Action blocks.
  Future initial(BuildContext context) async {}

  Future getMapShowAbles(BuildContext context) async {
    ApiCallResponse? selectableResponses;

    selectableResponses = await LocationGroup.getShowAbleTypesCall.call();

    if ((selectableResponses.succeeded ?? true)) {
      FFAppState().MapShowAbles = (getJsonField(
        (selectableResponses.jsonBody ?? ''),
        r'''$.options''',
        true,
      )!
              .toList()
              .map<MapShowSelectionStruct?>(MapShowSelectionStruct.maybeFromMap)
              .toList() as Iterable<MapShowSelectionStruct?>)
          .withoutNulls
          .toList()
          .cast<MapShowSelectionStruct>();
    }
  }
}
