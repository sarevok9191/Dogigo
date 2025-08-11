import '/backend/api_requests/api_calls.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'notification_friend_screen_widget.dart'
    show NotificationFriendScreenWidget;
import 'package:flutter/material.dart';

class NotificationFriendScreenModel
    extends FlutterFlowModel<NotificationFriendScreenWidget> {
  ///  Local state fields for this page.

  bool isDogsOpen = false;

  bool loading = false;

  bool friendExists = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Check Friend Request)] action in NotificationFriendScreen widget.
  ApiCallResponse? checkResponse;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (Accept Friend)] action in SignIn widget.
  ApiCallResponse? apiResultejy;
  // Stores action output result for [Backend Call - API (Check Friend Request)] action in SignIn widget.
  ApiCallResponse? checkResp;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    loadingViewModel.dispose();
  }
}
