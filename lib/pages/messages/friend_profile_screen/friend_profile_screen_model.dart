import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'friend_profile_screen_widget.dart' show FriendProfileScreenWidget;
import 'package:flutter/material.dart';

class FriendProfileScreenModel
    extends FlutterFlowModel<FriendProfileScreenWidget> {
  ///  Local state fields for this page.

  bool isDogsOpen = false;

  FriendTypeStruct? friendInfos;
  void updateFriendInfosStruct(Function(FriendTypeStruct) updateFn) {
    updateFn(friendInfos ??= FriendTypeStruct());
  }

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Friend)] action in FriendProfileScreen widget.
  ApiCallResponse? apiResultmy0;
  // Stores action output result for [Backend Call - API (Touch)] action in IconButton widget.
  ApiCallResponse? apiResultq4s;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    loadingViewModel = createModel(context, () => LoadingViewModel());
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    loadingViewModel.dispose();
    sidebarModel.dispose();
  }
}
