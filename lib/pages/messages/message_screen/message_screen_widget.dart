import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/custom_sheets/report_message_sheet/report_message_sheet_widget.dart';
import '/components/custom_sheets/success_sheet/success_sheet_widget.dart';
import '/components/fake_snackbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/message_count_badge_widget.dart';
import '/components/modals/delete_message_modal/delete_message_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'message_screen_model.dart';
export 'message_screen_model.dart';

class MessageScreenWidget extends StatefulWidget {
  const MessageScreenWidget({
    super.key,
    required this.token,
    required this.receiverId,
    required this.receiverPhoto,
    required this.receiverName,
  });

  final String? token;
  final int? receiverId;
  final String? receiverPhoto;
  final String? receiverName;

  static String routeName = 'MessageScreen';
  static String routePath = 'messageScreen';

  @override
  State<MessageScreenWidget> createState() => _MessageScreenWidgetState();
}

class _MessageScreenWidgetState extends State<MessageScreenWidget> {
  late MessageScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkResp = await MessagesGroup.checkChatCall.call(
        chatToken: widget.token,
      );

      if ((_model.checkResp?.succeeded ?? true)) {
        if (!MessagesGroup.checkChatCall.status(
          (_model.checkResp?.jsonBody ?? ''),
        )!) {
          _model.messagesBlocking = true;
          safeSetState(() {});
        }
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
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: Container(
                    height: 100.0,
                    child: FakeSnackbarWidget(
                      text: FFLocalizations.of(context).getText(
                        'xrgl0m5a' /* Bir hata oluştu lütfen tekrar ... */,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    _model.messageTextTextController ??= TextEditingController();
    _model.messageTextFocusNode ??= FocusNode();
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
        body: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).info,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 64.0, 16.0, 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).info,
                                  borderRadius: 15.0,
                                  borderWidth: 1.0,
                                  buttonSize: 49.0,
                                  fillColor: Color(0x00F25822),
                                  icon: Icon(
                                    Icons.menu,
                                    color: FlutterFlowTheme.of(context).info,
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
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.chevron_left_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          Container(
                                            width: 22.0,
                                            height: 22.0,
                                            child: custom_widgets
                                                .MessageCountListener(
                                              width: 22.0,
                                              height: 22.0,
                                              builder: (int messageCount) =>
                                                  MessageCountBadgeWidget(
                                                messageCount: messageCount,
                                                size: 22.0,
                                                backgroundColor:
                                                    Color(0xFFF22222),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          22.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            ShowUserImageWidget.routeName,
                                            queryParameters: {
                                              'image': serializeParam(
                                                widget.receiverPhoto,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: ClipOval(
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x00F7DED0),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  widget.receiverPhoto!,
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        widget.receiverName!,
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
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (!_model.messagesBlocking)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        child:
                                                            DeleteMessageModalWidget(
                                                          chat:
                                                              FriendTypeStruct(
                                                            chatToken:
                                                                widget.token,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 50.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.paw,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          _model.apiResultvruCopy =
                                              await UserActionsGroup.touchCall
                                                  .call(
                                            touchedUser: widget.receiverId,
                                          );

                                          if ((_model.apiResultvruCopy
                                                  ?.succeeded ??
                                              true)) {
                                            var messagesRecordReference =
                                                MessagesRecord.collection.doc();
                                            await messagesRecordReference
                                                .set(createMessagesRecordData(
                                              messageType: MessageTypes.touch,
                                              senderId:
                                                  FFAppState().CurrentUser.id,
                                              receiverId: widget.receiverId,
                                              token: widget.token,
                                              isReaded: false,
                                              message: '',
                                              timestamp: getCurrentTimestamp,
                                            ));
                                            _model.createTouchMessageCopy =
                                                MessagesRecord
                                                    .getDocumentFromData(
                                                        createMessagesRecordData(
                                                          messageType:
                                                              MessageTypes
                                                                  .touch,
                                                          senderId: FFAppState()
                                                              .CurrentUser
                                                              .id,
                                                          receiverId: widget
                                                              .receiverId,
                                                          token: widget.token,
                                                          isReaded: false,
                                                          message: '',
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                        ),
                                                        messagesRecordReference);
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: SuccessSheetWidget(
                                                        successMessage:
                                                            '${FFLocalizations.of(context).getVariableText(
                                                          trText: widget
                                                              .receiverName,
                                                          enText:
                                                              'You touched ',
                                                        )}${FFLocalizations.of(context).getVariableText(
                                                          trText:
                                                              ' kişisini dürttünüz',
                                                          enText: widget
                                                              .receiverName,
                                                        )}',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: ErrorSheetWidget(
                                                        errorMessage:
                                                            getJsonField(
                                                          (_model.apiResultvruCopy
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.block,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            _model.apiResult0iz =
                                                await FriendsGroup.blockUserCall
                                                    .call(
                                              id: widget.receiverId,
                                            );

                                            if ((_model
                                                    .apiResult0iz?.succeeded ??
                                                true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.apiResult0iz
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF1D9567),
                                                ),
                                              );
                                              _model.messagesBlocking = true;
                                              safeSetState(() {});
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.apiResult0iz
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ].divide(SizedBox(height: 30.0)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: custom_widgets.MessageListWidget(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            token: widget.token!,
                            receiverId: widget.receiverId!,
                            receiverName: widget.receiverName!,
                            onLongPressMessageItem: (message) async {
                              if (message.senderId !=
                                  FFAppState().CurrentUser.id) {
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
                                            child: ReportMessageSheetWidget(
                                              messageDocumentId:
                                                  message.reference.id,
                                              userId: widget.receiverId!,
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
                      ),
                    ].divide(SizedBox(height: 0.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Builder(
                  builder: (context) {
                    if (!_model.messagesBlocking) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        constraints: BoxConstraints(
                          minHeight: 128.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 4.0, 15.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.38),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).info,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .messageTextTextController,
                                                  focusNode: _model
                                                      .messageTextFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .manrope(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .manrope(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    hoverColor:
                                                        Colors.transparent,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
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
                                                  maxLines: null,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .messageTextTextControllerValidator
                                                      .asValidator(context),
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
                                                _model.apiResult18o =
                                                    await MessagesGroup
                                                        .checkChatCall
                                                        .call(
                                                  chatToken: widget.token,
                                                );

                                                if ((_model.apiResult18o
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (MessagesGroup
                                                          .checkChatCall
                                                          .status(
                                                        (_model.apiResult18o
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      true) {
                                                    if (functions.trimString(_model
                                                                .messageTextTextController
                                                                .text) !=
                                                            '') {
                                                      var messagesRecordReference =
                                                          MessagesRecord
                                                              .collection
                                                              .doc();
                                                      await messagesRecordReference
                                                          .set(
                                                              createMessagesRecordData(
                                                        message: _model
                                                            .messageTextTextController
                                                            .text,
                                                        messageImage: '',
                                                        senderId: FFAppState()
                                                            .CurrentUser
                                                            .id,
                                                        token: widget.token,
                                                        timestamp:
                                                            getCurrentTimestamp,
                                                        receiverId:
                                                            widget.receiverId,
                                                        isReaded: false,
                                                        messageType:
                                                            MessageTypes.text,
                                                      ));
                                                      _model.createMessage = MessagesRecord
                                                          .getDocumentFromData(
                                                              createMessagesRecordData(
                                                                message: _model
                                                                    .messageTextTextController
                                                                    .text,
                                                                messageImage:
                                                                    '',
                                                                senderId:
                                                                    FFAppState()
                                                                        .CurrentUser
                                                                        .id,
                                                                token: widget
                                                                    .token,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                receiverId: widget
                                                                    .receiverId,
                                                                isReaded: false,
                                                                messageType:
                                                                    MessageTypes
                                                                        .text,
                                                              ),
                                                              messagesRecordReference);
                                                      safeSetState(() {
                                                        _model
                                                            .messageTextTextController
                                                            ?.text = ' ';
                                                      });
                                                    }
                                                  } else {
                                                    _model.messagesBlocking =
                                                        true;
                                                    safeSetState(() {});
                                                  }
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: 100.0,
                                                              child:
                                                                  FakeSnackbarWidget(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'by9dvccu' /* Bir hata oluştu lütfen tekrar ... */,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }

                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/send-message.svg',
                                                  width: 32.0,
                                                  height: 32.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(width: 16.0))
                                              .around(SizedBox(width: 16.0)),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 0.0))
                                          .addToStart(SizedBox(height: 5.0))
                                          .addToEnd(SizedBox(height: 5.0)),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.checkRespImage =
                                      await MessagesGroup.checkChatCall.call(
                                    chatToken: widget.token,
                                  );

                                  if ((_model.checkRespImage?.succeeded ??
                                      true)) {
                                    if (MessagesGroup.checkChatCall.status(
                                      (_model.checkRespImage?.jsonBody ?? ''),
                                    )!) {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }

                                      if (_model.uploadedFileUrl != '') {
                                        var messagesRecordReference =
                                            MessagesRecord.collection.doc();
                                        await messagesRecordReference
                                            .set(createMessagesRecordData(
                                          message: '',
                                          messageImage: _model.uploadedFileUrl,
                                          senderId: FFAppState().CurrentUser.id,
                                          token: widget.token,
                                          timestamp: getCurrentTimestamp,
                                          receiverId: widget.receiverId,
                                          isReaded: false,
                                          messageType: MessageTypes.image,
                                        ));
                                        _model.createImageMessage =
                                            MessagesRecord.getDocumentFromData(
                                                createMessagesRecordData(
                                                  message: '',
                                                  messageImage:
                                                      _model.uploadedFileUrl,
                                                  senderId: FFAppState()
                                                      .CurrentUser
                                                      .id,
                                                  token: widget.token,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  receiverId:
                                                      widget.receiverId,
                                                  isReaded: false,
                                                  messageType:
                                                      MessageTypes.image,
                                                ),
                                                messagesRecordReference);
                                        _model.apiResulte9b2 =
                                            await MessagesGroup.onMessageCall
                                                .call(
                                          chatToken: widget.token,
                                          message: _model
                                              .messageTextTextController.text,
                                          image: _model
                                              .createImageMessage?.messageImage,
                                        );
                                      }
                                    } else {
                                      _model.messagesBlocking = true;
                                      safeSetState(() {});
                                    }
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
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: 100.0,
                                                child: FakeSnackbarWidget(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'x2y6vlky' /* Bir hata oluştu lütfen tekrar ... */,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }

                                  safeSetState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 15.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 46.0,
                                    height: 46.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.image,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.block_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 80.0,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 32.0, 24.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'm85jfda1' /* Buraya artık mesaj gönderileme... */,
                                        ),
                                        textAlign: TextAlign.center,
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
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 32.0, 24.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'f4oytt3r' /* Bir yanlışlık olduğunu düşünüy... */,
                                        ),
                                        textAlign: TextAlign.center,
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
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
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
        ),
      ),
    );
  }
}
