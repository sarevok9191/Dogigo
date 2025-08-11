import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_screen_model.dart';
export 'search_screen_model.dart';

class SearchScreenWidget extends StatefulWidget {
  const SearchScreenWidget({super.key});

  static String routeName = 'SearchScreen';
  static String routePath = 'searchScreen';

  @override
  State<SearchScreenWidget> createState() => _SearchScreenWidgetState();
}

class _SearchScreenWidgetState extends State<SearchScreenWidget> {
  late SearchScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.safeTopPadding = await actions.getSafeTopPadding(
        context,
      );
      _model.safePadding = _model.safeTopPadding!;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0,
                            valueOrDefault<double>(
                              functions.increaseDouble(
                                  12.0, _model.safePadding),
                              0.0,
                            ),
                            24.0,
                            24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Color(0x80FFFFFF),
                              borderRadius: 8.0,
                              borderWidth: 1.25,
                              buttonSize: 49.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                Icons.menu,
                                color: Color(0xFFF37C20),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                scaffoldKey.currentState!.openDrawer();
                              },
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
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 1.1,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.72),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 500),
                                        () async {
                                          _model.loading = true;
                                          safeSetState(() {});
                                          await _model.search(context);
                                          _model.loading = false;
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'de6ajgpw' /* Kişi Ara */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x80FFFFFF),
                                            width: 1.8,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.8,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.8,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.8,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor:
                                            FlutterFlowTheme.of(context).info,
                                        prefixIcon: Icon(
                                          Icons.search,
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
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 42.0, 15.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.sizeOf(context).height *
                                            0.45,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).info,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if ((_model.searchResults.length > 0) &&
                                          !_model.loading) {
                                        return Builder(
                                          builder: (context) {
                                            final result =
                                                _model.searchResults.toList();

                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    List.generate(result.length,
                                                        (resultIndex) {
                                                  final resultItem =
                                                      result[resultIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    15.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ShowUserImageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'image':
                                                                          serializeParam(
                                                                        resultItem
                                                                            .avatar,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 68.0,
                                                                  height: 68.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              resultItem.avatar,
                                                                          width:
                                                                              65.0,
                                                                          height:
                                                                              65.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            65.0,
                                                                        height:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (resultItem
                                                                          .isOnline)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.72,
                                                                              -0.89),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                15.0,
                                                                            height:
                                                                                15.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFF42FC46),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              border: Border.all(
                                                                                color: Color(0xFF508D4E),
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 5,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    resultItem
                                                                        .fullName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.manrope(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFFF37C20),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Stack(
                                                                children: [
                                                                  AnimatedOpacity(
                                                                    opacity: _model
                                                                            .requestLoading
                                                                        ? 0.0
                                                                        : 1.0,
                                                                    duration:
                                                                        270.0
                                                                            .ms,
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (resultItem
                                                                              .isFriend) {
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.requestingId = _model.requestingId;
                                                                                    _model.requestLoading = true;
                                                                                    safeSetState(() {});
                                                                                    _model.apiResult0iz = await FriendsGroup.blockUserCall.call(
                                                                                      id: _model.requestingId,
                                                                                    );

                                                                                    if ((_model.apiResult0iz?.succeeded ?? true)) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.apiResult0iz?.jsonBody ?? ''),
                                                                                              r'''$.message''',
                                                                                            ).toString(),
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: Color(0xFF1D9567),
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.apiResult0iz?.jsonBody ?? ''),
                                                                                              r'''$.message''',
                                                                                            ).toString(),
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    _model.requestLoading = false;
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 32.0,
                                                                                    height: 32.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: SvgPicture.asset(
                                                                                          'assets/images/block_icon.svg',
                                                                                          width: 200.0,
                                                                                          height: 200.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
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
                                                                                    context.pushNamed(
                                                                                      MessageScreenWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'token': serializeParam(
                                                                                          resultItem.chatToken,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'receiverId': serializeParam(
                                                                                          resultItem.id,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'receiverPhoto': serializeParam(
                                                                                          resultItem.avatar,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'receiverName': serializeParam(
                                                                                          resultItem.firstName,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 32.0,
                                                                                    height: 32.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: SvgPicture.asset(
                                                                                          'assets/images/chat_icon.svg',
                                                                                          width: 200.0,
                                                                                          height: 200.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
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
                                                                                    _model.requestingId = resultItem.id;
                                                                                    _model.requestLoading = true;
                                                                                    safeSetState(() {});
                                                                                    _model.touchResponse = await UserActionsGroup.touchCall.call(
                                                                                      touchedUser: _model.requestingId,
                                                                                    );

                                                                                    if ((_model.touchResponse?.succeeded ?? true)) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.touchResponse?.jsonBody ?? ''),
                                                                                              r'''$.message''',
                                                                                            ).toString(),
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: Color(0xFF1D9567),
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.touchResponse?.jsonBody ?? ''),
                                                                                              r'''$.message''',
                                                                                            ).toString(),
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    _model.requestLoading = false;
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 32.0,
                                                                                    height: 32.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(7.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: SvgPicture.asset(
                                                                                          'assets/images/touch_icon.svg',
                                                                                          width: 32.0,
                                                                                          height: 32.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 7.0)),
                                                                            );
                                                                          } else if (resultItem.hasFriendRequest ==
                                                                              true) {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                height: 34.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(300.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFFCBD7B),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.person_search_rounded,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '7i1o3dta' /* Bekleniyor */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.manrope(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Builder(
                                                                              builder: (context) {
                                                                                if (!_model.requestLoading) {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.requestLoading = true;
                                                                                        safeSetState(() {});
                                                                                        _model.apiResultiex = await UserActionsGroup.sendFriendRequestCall.call(
                                                                                          userId: resultItem.id,
                                                                                        );

                                                                                        if ((_model.apiResultiex?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResultiex?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).success,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResultiex?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        await _model.search(context);
                                                                                        _model.requestLoading = false;
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 34.0,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(300.0),
                                                                                          border: Border.all(
                                                                                            color: Color(0xFFFCBD7B),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: SvgPicture.asset(
                                                                                                  'assets/images/add_friend.svg',
                                                                                                  width: 24.0,
                                                                                                  height: 24.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '9m3qvk4v' /* Arkadaş Ekle */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.manrope(
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Lottie.asset(
                                                                                    'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                                                                                    width: 40.0,
                                                                                    height: 40.0,
                                                                                    fit: BoxFit.contain,
                                                                                    animate: true,
                                                                                  );
                                                                                }
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                      .requestLoading)
                                                                    AnimatedOpacity(
                                                                      opacity: _model
                                                                              .requestLoading
                                                                          ? 1.0
                                                                          : 0.0,
                                                                      duration:
                                                                          140.0
                                                                              .ms,
                                                                      curve: Curves
                                                                          .easeInOut,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child: Lottie
                                                                            .asset(
                                                                          'assets/jsons/Animation_-_1732613829909.json',
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              40.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                          animate:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 2.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x85FFBE98),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        );
                                      } else if ((_model.searchResults.length ==
                                              0) &&
                                          (_model.textController.text ==
                                                  '') &&
                                          !_model.loading) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.person_search_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 72.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'pqazsebe' /* Aramaya Devam Et */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sentient',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8vl8svbn' /* Ve Daha Fazla Kişi Keşfet */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Sentient',
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      } else if (_model.loading) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Lottie.asset(
                                              'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                                              width: 60.0,
                                              height: 60.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.frown,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 72.0,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                32.0,
                                                                12.0,
                                                                32.0,
                                                                0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ah87aha5' /* Aramana uygun sonuç  bulamadık */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Sentient',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 19.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (!(isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible))
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarWidget(
                        activePage: 'SearchScreen',
                      ),
                    ),
                  ),
                if (_model.isDogsOpen == true)
                  Align(
                    alignment: AlignmentDirectional(0.77, -0.68),
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
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      selectableDogItem.image,
                                                    ),
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
