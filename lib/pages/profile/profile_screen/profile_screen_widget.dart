import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/components/inputs/phone_input_wrapper/phone_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_area_wrapper/text_area_wrapper_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profile_screen_model.dart';
export 'profile_screen_model.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  static String routeName = 'ProfileScreen';
  static String routePath = 'profileScreen';

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  late ProfileScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await actions.syncAppStateFirebaseUser();
        }(),
      );
      _model.apiResult2vj = await StaticValuesGroup.getCountriesCall.call();

      if ((_model.apiResult2vj?.succeeded ?? true)) {
        _model.countries = (getJsonField(
          (_model.apiResult2vj?.jsonBody ?? ''),
          r'''$.records''',
          true,
        )!
                .toList()
                .map<SelectableOptionTypeStruct?>(
                    SelectableOptionTypeStruct.maybeFromMap)
                .toList() as Iterable<SelectableOptionTypeStruct?>)
            .withoutNulls
            .toList()
            .cast<SelectableOptionTypeStruct>();
      }
      _model.profileInfos = await ProfileGroup.getProfileInfosCall.call();

      if ((_model.profileInfos?.succeeded ?? true)) {
        _model.userInfos = UserStruct.maybeFromMap(getJsonField(
          (_model.profileInfos?.jsonBody ?? ''),
          r'''$.user''',
        ));
      }
      _model.apiResultx6k = await StaticValuesGroup.getCitiesCall.call(
        countryId: _model.userInfos?.country.id,
      );

      if ((_model.apiResultx6k?.succeeded ?? true)) {
        _model.cities = (getJsonField(
          (_model.apiResultx6k?.jsonBody ?? ''),
          r'''$.records''',
          true,
        )!
                .toList()
                .map<SelectableOptionTypeStruct?>(
                    SelectableOptionTypeStruct.maybeFromMap)
                .toList() as Iterable<SelectableOptionTypeStruct?>)
            .withoutNulls
            .toList()
            .cast<SelectableOptionTypeStruct>();
      }
      _model.isLoaded = true;
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
    return FutureBuilder<ApiCallResponse>(
      future: StaticValuesGroup.getGendersCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: SpinKitPumpingHeart(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20.0,
                ),
              ),
            ),
          );
        }
        final profileScreenGetGendersResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
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
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
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
                                      39.0, 0.0, 39.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context).info,
                                        borderRadius: 15.0,
                                        borderWidth: 1.0,
                                        buttonSize: 49.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                        icon: Icon(
                                          Icons.menu,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          scaffoldKey.currentState!
                                              .openDrawer();
                                        },
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'vlczb105' /* Profil */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (!_model.isLoaded) {
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        39.0, 48.0, 39.0, 58.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Lottie.asset(
                                          'assets/jsons/Animation_-_1732613829909.json',
                                          width: 110.0,
                                          height: 110.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 0.0, 39.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 233.0,
                                                      height: 233.0,
                                                      decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/dots_white.svg',
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 233.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x04F7DED0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Text(
                                                          _model.userInfos!
                                                              .firstName,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montaguSlab(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 30.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 122.0,
                                                    height: 122.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.network(
                                                          _model.userInfos!
                                                              .avatar.url,
                                                        ).image,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 122.0,
                                                      height: 122.0,
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                ShowUserImageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'image':
                                                                      serializeParam(
                                                                    _model
                                                                        .userInfos
                                                                        ?.avatar
                                                                        .url,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 122.0,
                                                              height: 122.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl: _model
                                                                    .userInfos!
                                                                    .avatar
                                                                    .url,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.98,
                                                                    -0.66),
                                                            child: Container(
                                                              width: 16.0,
                                                              height: 16.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF42FC46),
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF508D4E),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.35, 0.78),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  100.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .pen,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 16.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  imageQuality:
                                                                      100,
                                                                  allowPhoto:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                if ((_model
                                                                            .uploadedLocalFile
                                                                            .bytes
                                                                            ?.isNotEmpty ??
                                                                        false)) {
                                                                  _model.isLoaded =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.uploadProfileImageResponse =
                                                                      await ProfileGroup
                                                                          .updateUserAvatarCall
                                                                          .call(
                                                                    avatar: _model
                                                                        .uploadedLocalFile,
                                                                  );

                                                                  if ((_model
                                                                          .uploadProfileImageResponse
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model.userInfos =
                                                                        UserStruct.maybeFromMap(
                                                                            getJsonField(
                                                                      (_model.uploadProfileImageResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.user''',
                                                                    ));
                                                                    FFAppState()
                                                                            .CurrentUser =
                                                                        UserStruct.maybeFromMap(
                                                                            getJsonField(
                                                                      (_model.uploadProfileImageResponse
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.user''',
                                                                    ))!;
                                                                  }
                                                                }
                                                                _model.isLoaded =
                                                                    true;
                                                                safeSetState(
                                                                    () {});

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '465c9ttj' /* @ */,
                                                ),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 11.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    _model.userInfos!.username,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 11.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              )
                                            ],
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
                                                      .primary,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: _model
                                                      .userInfos!.friendCount
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.manrope(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 1.3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'f7750jzd' /*  ARKADAŞ */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.manrope(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xDDFFFFFF),
                                                        fontSize: 13.0,
                                                        letterSpacing: 1.3,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.manrope(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 36.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      SettingsScreenWidget
                                                          .routeName);
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEDEDED),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                16.0,
                                                                24.0,
                                                                16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '52ahc33x' /* Ayarlar */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 22.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      ProfileGalleryScreenWidget
                                                          .routeName);
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEDEDED),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                16.0,
                                                                24.0,
                                                                16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2g5qrjh9' /* Resim Galerisi */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .chevron_right_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 22.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 15.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 39.0, 0.0, 184.0),
                                          child: Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'kg473ctd' /* Genel Bilgiler */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.manrope(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 13.0, 0.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model.aboutMeModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        TextAreaWrapperWidget(
                                                      labelText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        trText: 'Hakkımda',
                                                        enText: 'About me',
                                                      ),
                                                      isRequired: true,
                                                      isAutoFocus: false,
                                                      initialValue: _model
                                                          .userInfos?.about,
                                                      labelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.firstNameModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TextInputWrapperWidget(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'İsim',
                                                      enText: 'Name',
                                                    ),
                                                    isRequired: true,
                                                    isAutoFocus: false,
                                                    initialValue: _model
                                                        .userInfos?.firstName,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    readOnly: true,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.lastNameModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TextInputWrapperWidget(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Soyisim',
                                                      enText: 'Surname',
                                                    ),
                                                    isRequired: true,
                                                    isAutoFocus: false,
                                                    initialValue: _model
                                                        .userInfos?.lastName,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    readOnly: true,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.phoneNumberModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      PhoneInputWrapperWidget(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText:
                                                          'Telefon Numarası',
                                                      enText: 'Phone Number',
                                                    ),
                                                    isRequired: true,
                                                    isAutoFocus: false,
                                                    initialValue: _model
                                                        .userInfos?.phoneNumber,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.usernameModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: EmailWrapperWidget(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Kullanıcı Adı',
                                                      enText: 'Username',
                                                    ),
                                                    isRequired: false,
                                                    isAutoFocus: false,
                                                    initialValue: _model
                                                        .userInfos?.username,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    readOnly: true,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.emailWrapperModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: EmailWrapperWidget(
                                                    labelText: 'E-Mail',
                                                    isRequired: true,
                                                    isAutoFocus: false,
                                                    initialValue:
                                                        _model.userInfos?.email,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    readOnly: true,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.birthDateModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: DateInputWrapperWidget(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Doğum Tarihi',
                                                      enText: 'Birth Date',
                                                    ),
                                                    isRequired: true,
                                                    isAutoFocus: false,
                                                    initialValue: _model
                                                        .userInfos?.dateBirth
                                                        ?.toString(),
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    defaultDate: _model
                                                        .userInfos?.dateBirth,
                                                    readonly: true,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .genderSelectDropdownModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SelectDropdownWidget(
                                                    labelTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Cinsiyet',
                                                      enText: 'Sex',
                                                    ),
                                                    dropdownTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText:
                                                          'Cinsiyetinizi Seçin',
                                                      enText: 'Select Your Sex',
                                                    ),
                                                    options: (getJsonField(
                                                      profileScreenGetGendersResponse
                                                          .jsonBody,
                                                      r'''$.records''',
                                                      true,
                                                    )
                                                                ?.toList()
                                                                .map<SelectableOptionTypeStruct?>(
                                                                    SelectableOptionTypeStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                SelectableOptionTypeStruct?>)
                                                        .withoutNulls,
                                                    sheetTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText:
                                                          'Cinsiyetinizi Seçin',
                                                      enText: 'Select Your Sex',
                                                    ),
                                                    initialValue: _model
                                                                .userInfos
                                                                ?.userGender ==
                                                            '1'
                                                        ? SelectableOptionTypeStruct(
                                                            id: 1,
                                                            title: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              trText: 'Erkek',
                                                              enText: 'MAN',
                                                            ),
                                                          )
                                                        : SelectableOptionTypeStruct(
                                                            id: 2,
                                                            title: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              trText: 'Bayan',
                                                              enText: 'Woman',
                                                            ),
                                                          ),
                                                    absorbing: true,
                                                    isRequired: false,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    onValueChange:
                                                        (value) async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .countrySelectDropdownModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SelectDropdownWidget(
                                                    labelTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Ülke',
                                                      enText: 'Country',
                                                    ),
                                                    dropdownTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Ülke Seçin',
                                                      enText: 'Select Country',
                                                    ),
                                                    options: _model.countries,
                                                    sheetTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Ülke Seçin',
                                                      enText: 'Select Country',
                                                    ),
                                                    initialValue: _model
                                                        .userInfos?.country,
                                                    absorbing: false,
                                                    isRequired: false,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    onValueChange:
                                                        (value) async {
                                                      _model.citiesRepsonse =
                                                          await StaticValuesGroup
                                                              .getCitiesCall
                                                              .call(
                                                        countryId: value?.id,
                                                      );

                                                      if ((_model.apiResult9ln
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.cities =
                                                            (getJsonField(
                                                          (_model.citiesRepsonse
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.records''',
                                                          true,
                                                        )!
                                                                        .toList()
                                                                        .map<SelectableOptionTypeStruct?>(SelectableOptionTypeStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        SelectableOptionTypeStruct?>)
                                                                .withoutNulls
                                                                .toList()
                                                                .cast<
                                                                    SelectableOptionTypeStruct>();
                                                        safeSetState(() {});
                                                      }
                                                      _model
                                                          .updateUserInfosStruct(
                                                        (e) => e..city = null,
                                                      );
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .citySelectDropdownModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SelectDropdownWidget(
                                                    key: ValueKey('city'),
                                                    labelTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Şehir',
                                                      enText: 'City',
                                                    ),
                                                    dropdownTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Şehir Seçin',
                                                      enText: 'Select City',
                                                    ),
                                                    options: _model.cities,
                                                    sheetTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Şehir Seçin',
                                                      enText: 'Select City',
                                                    ),
                                                    initialValue:
                                                        _model.userInfos?.city,
                                                    absorbing: false,
                                                    isRequired: false,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    onValueChange:
                                                        (value) async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.addressModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TextAreaWrapperWidget(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText: 'Adres',
                                                      enText: 'Address',
                                                    ),
                                                    isRequired: true,
                                                    isAutoFocus: false,
                                                    initialValue: _model
                                                        .userInfos?.address,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 55.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.isLoaded = false;
                                                      safeSetState(() {});
                                                      _model.apiResult9ln =
                                                          await ProfileGroup
                                                              .updateProfileInfosCall
                                                              .call(
                                                        firstName: _model
                                                            .firstNameModel
                                                            .customInputTextController
                                                            .text,
                                                        lastName: _model
                                                            .lastNameModel
                                                            .customInputTextController
                                                            .text,
                                                        email: _model
                                                            .emailWrapperModel
                                                            .customInputTextController
                                                            .text,
                                                        phoneNumber: _model
                                                            .phoneNumberModel
                                                            .customInputTextController
                                                            .text,
                                                        username: _model
                                                            .usernameModel
                                                            .customInputTextController
                                                            .text,
                                                        countryId: _model
                                                            .countrySelectDropdownModel
                                                            .value
                                                            ?.id,
                                                        userGender: _model
                                                            .genderSelectDropdownModel
                                                            .value
                                                            ?.id,
                                                        cityId: _model
                                                            .citySelectDropdownModel
                                                            .value
                                                            ?.id,
                                                        dateBirth: _model
                                                            .birthDateModel
                                                            .value
                                                            ?.toString(),
                                                        address: _model
                                                            .addressModel
                                                            .customInputTextController
                                                            .text,
                                                        about: _model
                                                            .aboutMeModel
                                                            .customInputTextController
                                                            .text,
                                                      );

                                                      if ((_model.apiResult9ln
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                                .CurrentUser =
                                                            UserStruct
                                                                .maybeFromMap(
                                                                    getJsonField(
                                                          (_model.apiResult9ln
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.user''',
                                                        ))!;
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiResult9ln
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                      }

                                                      _model.isLoaded = true;
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'u1rwk84p' /* KAYDET */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  72.0,
                                                                  12.0,
                                                                  72.0,
                                                                  12.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    1.8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 15.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 21.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavbarWidget(
                          activePage: 'ProfileScreen',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
