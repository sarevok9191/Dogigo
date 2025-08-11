import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'notifications_screen_widget.dart' show NotificationsScreenWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationsScreenModel
    extends FlutterFlowModel<NotificationsScreenWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  List<NotificationTypeStruct> notifications = [];
  void addToNotifications(NotificationTypeStruct item) =>
      notifications.add(item);
  void removeFromNotifications(NotificationTypeStruct item) =>
      notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(int index, NotificationTypeStruct item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(
          int index, Function(NotificationTypeStruct) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  bool infiniteLoading = false;

  int page = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    listViewPagingController?.dispose();
    sidebarModel.dispose();
  }

  /// Action blocks.
  Future getInitialList(BuildContext context) async {
    ApiCallResponse? initialResponse;

    page = 1;
    initialResponse = await NotificationsGroup.notificationsIndexCall.call(
      page: page,
    );

    if ((initialResponse.succeeded ?? true)) {
      notifications = (getJsonField(
        (initialResponse.jsonBody ?? ''),
        r'''$.records''',
        true,
      )!
              .toList()
              .map<NotificationTypeStruct?>(NotificationTypeStruct.maybeFromMap)
              .toList() as Iterable<NotificationTypeStruct?>)
          .withoutNulls
          .toList()
          .cast<NotificationTypeStruct>();
    }
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewNotificationsIndexPage);
  }

  void listViewNotificationsIndexPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker)
          .then((listViewNotificationsIndexResponse) {
        final pageItems = ((getJsonField(
                  listViewNotificationsIndexResponse.jsonBody,
                  r'''$.records''',
                  true,
                )!
                        .toList()
                        .map<NotificationTypeStruct?>(
                            NotificationTypeStruct.maybeFromMap)
                        .toList() as Iterable<NotificationTypeStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewNotificationsIndexResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
