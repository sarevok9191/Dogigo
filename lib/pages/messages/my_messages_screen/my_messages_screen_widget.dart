import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/modals/delete_message_modal/delete_message_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_messages_screen_model.dart';
export 'my_messages_screen_model.dart';

class MyMessagesScreenWidget extends StatefulWidget {
  const MyMessagesScreenWidget({super.key});

  static String routeName = 'MyMessagesScreen';
  static String routePath = 'myMessagesScreen';

  @override
  State<MyMessagesScreenWidget> createState() => _MyMessagesScreenWidgetState();
}

class _MyMessagesScreenWidgetState extends State<MyMessagesScreenWidget> {
  late MyMessagesScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyMessagesScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.fetchList(context);
      safeSetState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
          body: Container(
            decoration: BoxDecoration(
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
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    custom_widgets.TopSafePaddingWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 1.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(39.0, 2.0, 39.0, 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Color(0x7FFFFFFF),
                                borderRadius: 15.0,
                                borderWidth: 1.0,
                                buttonSize: 49.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).alternate,
                                icon: Icon(
                                  Icons.menu,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
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
                              Container(
                                width: 1.0,
                                height: 10.0,
                                decoration: BoxDecoration(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '5w4nv2ga' /* Mesajlar */,
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
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 300),
                                      () async {
                                        _model.isLoaded = false;
                                        safeSetState(() {});
                                        _model.apiResult1v1 =
                                            await MessagesGroup.getMessagesCall
                                                .call(
                                          search: _model.textController.text,
                                        );

                                        if ((_model.apiResult1v1?.succeeded ??
                                            true)) {
                                          _model.messageList = (getJsonField(
                                            (_model.apiResult1v1?.jsonBody ??
                                                ''),
                                            r'''$.records''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<FriendTypeStruct?>(
                                                          FriendTypeStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      FriendTypeStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<FriendTypeStruct>();
                                        }
                                        _model.isLoaded = true;
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'ud71szty' /* Mesaj arat */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFAEB3B3),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF37C20),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF37C20),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 24.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 33.0)),
                          ),
                        ].divide(SizedBox(height: 30.0)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: StreamBuilder<List<MessagesRecord>>(
                          stream: queryMessagesRecord(
                            queryBuilder: (messagesRecord) => messagesRecord
                                .where(
                                  'receiverId',
                                  isEqualTo: FFAppState().CurrentUser.id,
                                )
                                .orderBy('timestamp', descending: true),
                            limit: 5,
                          )..listen((snapshot) {
                              List<MessagesRecord> containerMessagesRecordList =
                                  snapshot;
                              if (_model.containerPreviousSnapshot != null &&
                                  !const ListEquality(
                                          MessagesRecordDocumentEquality())
                                      .equals(containerMessagesRecordList,
                                          _model.containerPreviousSnapshot)) {
                                () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                  _model.apiResultru8Copy = await MessagesGroup
                                      .getMessagesCall
                                      .call();

                                  if ((_model.apiResultru8Copy?.succeeded ??
                                      true)) {
                                    _model.messageList = (getJsonField(
                                      (_model.apiResultru8Copy?.jsonBody ?? ''),
                                      r'''$.records''',
                                      true,
                                    )!
                                                .toList()
                                                .map<FriendTypeStruct?>(
                                                    FriendTypeStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<FriendTypeStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<FriendTypeStruct>();
                                    safeSetState(() {});
                                  }
                                  _model.isLoaded = true;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                }();
                              }
                              _model.containerPreviousSnapshot = snapshot;
                            }),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: SpinKitPumpingHeart(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                ),
                              );
                            }
                            List<MessagesRecord> containerMessagesRecordList =
                                snapshot.data!;

                            return ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).info,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isLoaded) {
                                            return Builder(
                                              builder: (context) {
                                                final messages =
                                                    _model.messageList.toList();

                                                return ListView.builder(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    0,
                                                    240.0,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: messages.length,
                                                  itemBuilder:
                                                      (context, messagesIndex) {
                                                    final messagesItem =
                                                        messages[messagesIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await actions
                                                            .goToMessageDetail(
                                                          context,
                                                          messagesItem,
                                                          () async {
                                                            await _model
                                                                .fetchList(
                                                                    context);
                                                          },
                                                        );
                                                      },
                                                      child: custom_widgets
                                                          .MessageListItem(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 100.0,
                                                        messagesItem:
                                                            messagesItem,
                                                        onclickDelete:
                                                            () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      child:
                                                                          DeleteMessageModalWidget(
                                                                        chat:
                                                                            messagesItem,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          } else {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Lottie.asset(
                                                    'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                                                    width: 80.0,
                                                    height: 80.0,
                                                    fit: BoxFit.contain,
                                                    animate: true,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if ((_model.isLoaded == true) &&
                                              ((isWeb
                                                      ? MediaQuery.viewInsetsOf(
                                                                  context)
                                                              .bottom >
                                                          0
                                                      : _isKeyboardVisible) ==
                                                  false))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 155.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        MyFriendsScreenWidget
                                                            .routeName);
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'qwztglxh' /* KONUŞMA BAŞLAT */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                44.0,
                                                                12.0,
                                                                44.0,
                                                                12.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 18.0,
                                                          letterSpacing: 1.8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
                if (!(isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarWidget(
                        activePage: 'MessagesScreen',
                        hasMessage: false,
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
