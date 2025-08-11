import '/backend/api_requests/api_calls.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/notifications/notification_item/notification_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notifications_screen_model.dart';
export 'notifications_screen_model.dart';

class NotificationsScreenWidget extends StatefulWidget {
  const NotificationsScreenWidget({super.key});

  static String routeName = 'NotificationsScreen';
  static String routePath = 'notificationsScreen';

  @override
  State<NotificationsScreenWidget> createState() =>
      _NotificationsScreenWidgetState();
}

class _NotificationsScreenWidgetState extends State<NotificationsScreenWidget> {
  late NotificationsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await NotificationsGroup.readNotificationsCall.call();
        }(),
      );
      FFAppState().UnReadNotificationCount = 0;
      _model.loading = true;
      safeSetState(() {});
      await _model.getInitialList(context);
      safeSetState(() {});
      _model.loading = false;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          child: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.sidebarModel,
                updateCallback: () => safeSetState(() {}),
                child: SidebarWidget(),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary,
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary,
                    FlutterFlowTheme.of(context).primary
                  ],
                  stops: [0.0, 0.25, 0.575, 0.76875, 1.0],
                  begin: AlignmentDirectional(1.0, -0.87),
                  end: AlignmentDirectional(-1.0, 0.87),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    custom_widgets.TopSafePaddingWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            39.0, 0.0, 39.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).secondary,
                              borderRadius: 15.0,
                              borderWidth: 1.0,
                              buttonSize: 49.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.menu,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '75e8p3al' /* Bildirimler */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Opacity(
                              opacity: 0.0,
                              child: Container(
                                width: 49.0,
                                height: 49.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).info,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: RefreshIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                    backgroundColor: FlutterFlowTheme.of(context).info,
                    strokeWidth: 2.0,
                    onRefresh: () async {
                      safeSetState(
                          () => _model.listViewPagingController?.refresh());
                    },
                    child: PagedListView<ApiPagingParams, dynamic>(
                      pagingController: _model.setListViewController(
                        (nextPageMarker) =>
                            NotificationsGroup.notificationsIndexCall.call(
                          page: functions.increaseInteger(
                              nextPageMarker.nextPageNumber, 1),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: LoadingViewWidget(),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: LoadingViewWidget(),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => Center(
                          child: Image.asset(
                            'assets/images/havent-active-dog.png',
                          ),
                        ),
                        itemBuilder: (context, _, notificationIndex) {
                          final notificationItem = _model
                              .listViewPagingController!
                              .itemList![notificationIndex];
                          return NotificationItemWidget(
                            key: Key(
                                'Keyyuw_${notificationIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                            notification: notificationItem,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
