import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_sheets/map_dog_info_sheet/map_dog_info_sheet_widget.dart';
import '/components/custom_sheets/map_user_info_sheet/map_user_info_sheet_widget.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = 'homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.syncAppStateFirebaseUser();
        }(),
      );
      unawaited(
        () async {
          await actions.requestTrackingPermission();
        }(),
      );
      unawaited(
        () async {
          await actions.storeDeviceToken();
        }(),
      );
      unawaited(
        () async {
          await action_blocks.fetchUnReadMessagesBlock(context);
        }(),
      );
      FFAppState().AppMounted = true;
      if (FFAppState().LastLocation == null) {
        await actions.getFirstLocation();
        if (FFAppState().LastLocation != null) {
          unawaited(
            () async {
              await actions.getMapUsers(
                FFAppState().LastLocation!,
              );
            }(),
          );
        }
      }
      if (FFAppState().MapShowAbles.length == 0) {
        unawaited(
          () async {
            await _model.getMapShowAbles(context);
          }(),
        );
      }
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
          body: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.isDogsOpen = false;
              safeSetState(() {});
            },
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Container(
                          key: ValueKey('homePageMap'),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: custom_widgets.MapWidget(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            initialZoom: 12.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: false,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: false,
                            markerImageSize: 200.0,
                            customMapStyle:
                                '[\n  {\n    \"featureType\": \"administrative\",\n    \"elementType\": \"geometry\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.country\",\n    \"elementType\": \"all\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.province\",\n    \"elementType\": \"all\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.locality\",\n    \"elementType\": \"geometry\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.locality\",\n    \"elementType\": \"labels\",\n    \"stylers\": [\n      {\n        \"visibility\": \"on\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.locality\",\n    \"elementType\": \"labels.text\",\n    \"stylers\": [\n      {\n        \"visibility\": \"on\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.locality\",\n    \"elementType\": \"labels.text.fill\",\n    \"stylers\": [\n      {\n        \"visibility\": \"on\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.locality\",\n    \"elementType\": \"labels.text.stroke\",\n    \"stylers\": [\n      {\n        \"visibility\": \"on\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.locality\",\n    \"elementType\": \"labels.icon\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"administrative.land_parcel\",\n    \"elementType\": \"all\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"landscape\",\n    \"elementType\": \"geometry.fill\",\n    \"stylers\": [\n      {\n        \"saturation\": -11\n      },\n      {\n        \"visibility\": \"on\"\n      },\n      {\n        \"color\": \"#fa9e51\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"landscape\",\n    \"elementType\": \"labels\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"poi\",\n    \"elementType\": \"labels\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"poi.business\",\n    \"elementType\": \"all\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"poi.park\",\n    \"elementType\": \"geometry.fill\",\n    \"stylers\": [\n      {\n        \"color\": \"#8aab6f\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"poi.park\",\n    \"elementType\": \"labels.text\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road\",\n    \"elementType\": \"geometry.fill\",\n    \"stylers\": [\n      {\n        \"color\": \"#ffffff\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road\",\n    \"elementType\": \"labels.text\",\n    \"stylers\": [\n      {\n        \"visibility\": \"on\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road\",\n    \"elementType\": \"labels.icon\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road.highway\",\n    \"elementType\": \"geometry.fill\",\n    \"stylers\": [\n      {\n        \"color\": \"#ffffff\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road.highway\",\n    \"elementType\": \"geometry.stroke\",\n    \"stylers\": [\n      {\n        \"color\": \"#d6d6d6\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road.arterial\",\n    \"elementType\": \"geometry.stroke\",\n    \"stylers\": [\n      {\n        \"color\": \"#d6d6d6\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road.local\",\n    \"elementType\": \"geometry.fill\",\n    \"stylers\": [\n      {\n        \"color\": \"#ffffff\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"road.local\",\n    \"elementType\": \"geometry.stroke\",\n    \"stylers\": [\n      {\n        \"visibility\": \"on\",\n        \"color\": \"#e0e0e0\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"transit\",\n    \"elementType\": \"all\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"water\",\n    \"elementType\": \"geometry.fill\",\n    \"stylers\": [\n      {\n        \"color\": \"#b1d2e7\"\n      }\n    ]\n  },\n  {\n    \"featureType\": \"water\",\n    \"elementType\": \"labels\",\n    \"stylers\": [\n      {\n        \"visibility\": \"off\"\n      }\n    ]\n  }\n]',
                            initialLocation: FFAppState().LastLocation != null
                                ? FFAppState().LastLocation
                                : null,
                            style: MapStyle.dark,
                            markers: FFAppState().MapMarkers,
                            myLocationButtonEnabled: false,
                            onCameraIdle: (latlng) async {},
                            onTapMarker: (marker) async {
                              if (marker.mapShowType == 'dog') {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.8,
                                            child: MapDogInfoSheetWidget(
                                              marker: marker,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.8,
                                            child: MapUserInfoSheetWidget(
                                              marker: marker,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }
                            },
                          ),
                        ),
                        if (_model.loading == true)
                          Opacity(
                            opacity: 0.8,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    'assets/jsons/Animation_-_1732613829909.json',
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavbarWidget(
                      activePage: 'MapScreen',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 110.0,
                        color: Color(0x740F0F0F),
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                        spreadRadius: 32.0,
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      custom_widgets.TopSafePaddingWidget(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 49.0,
                              height: 49.0,
                              child: Stack(
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Color(0xFFF37C20),
                                    borderRadius: 8.0,
                                    borderWidth: 1.25,
                                    buttonSize: 49.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.menu,
                                      color: Color(0xFFF37C20),
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                  ),
                                  if (FFAppState().UnReadNotificationCount > 0)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.44, -1.41),
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFAppState().UnReadNotificationCount >
                                                      9
                                                  ? '9+'
                                                  : valueOrDefault<String>(
                                                      FFAppState()
                                                          .UnReadNotificationCount
                                                          .toString(),
                                                      '0',
                                                    ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/dogs_white.svg',
                                width: 96.0,
                                height: 48.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.isDogsOpen = !_model.isDogsOpen;
                                    safeSetState(() {});
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Container(
                                      width: 49.0,
                                      height: 49.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7DED0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                          FFAppState()
                                              .CurrentUser
                                              .shownMap
                                              .image,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.isDogsOpen == true)
                  Align(
                    alignment: AlignmentDirectional(0.91, -0.48),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: 264.0,
                          constraints: BoxConstraints(
                            maxHeight: 196.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                13.0, 13.0, 13.0, 13.0),
                            child: Builder(
                              builder: (context) {
                                final selectableDog =
                                    FFAppState().MapShowAbles.toList();

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(selectableDog.length,
                                            (selectableDogIndex) {
                                      final selectableDogItem =
                                          selectableDog[selectableDogIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.loading = true;
                                          _model.isDogsOpen = false;
                                          safeSetState(() {});
                                          _model.apiResultwhb =
                                              await LocationGroup
                                                  .updateMapShowCall
                                                  .call(
                                            type: selectableDogItem.type,
                                            id: selectableDogItem.id,
                                          );

                                          if ((_model.apiResultwhb?.succeeded ??
                                              true)) {
                                            FFAppState()
                                                .updateCurrentUserStruct(
                                              (e) => e
                                                ..shownMap = selectableDogItem,
                                            );
                                          }
                                          await actions.getMapUsers(
                                            FFAppState().LastLocation!,
                                          );
                                          _model.loading = false;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Container(
                                                width: 49.0,
                                                height: 49.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.network(
                                                      selectableDogItem.image,
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              selectableDogItem.label,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.manrope(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 9.0)),
                                        ),
                                      );
                                    }).divide(SizedBox(height: 10.0)),
                                  ),
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
        ),
      ),
    );
  }
}
