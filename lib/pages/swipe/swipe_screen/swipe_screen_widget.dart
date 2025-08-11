import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'swipe_screen_model.dart';
export 'swipe_screen_model.dart';

class SwipeScreenWidget extends StatefulWidget {
  const SwipeScreenWidget({super.key});

  static String routeName = 'SwipeScreen';
  static String routePath = 'swipeScreen';

  @override
  State<SwipeScreenWidget> createState() => _SwipeScreenWidgetState();
}

class _SwipeScreenWidgetState extends State<SwipeScreenWidget> {
  late SwipeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.listenSwiperState();
        }(),
      );
      await action_blocks.getCurrentUser(context);
      _model.loading = true;
      safeSetState(() {});
      _model.packageDetailsResponse =
          await StaticValuesGroup.packageDetailsCall.call();

      if ((_model.packageDetailsResponse?.succeeded ?? true)) {
        FFAppState().PackageDetails =
            PackageDetailsStruct.maybeFromMap(getJsonField(
          (_model.packageDetailsResponse?.jsonBody ?? ''),
          r'''$.record''',
        ))!;
      }
      await _model.getswipelist(context);
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: custom_widgets.CustomSwipePage(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
