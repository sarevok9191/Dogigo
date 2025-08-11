import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'settings_friends_sheet_model.dart';
export 'settings_friends_sheet_model.dart';

class SettingsFriendsSheetWidget extends StatefulWidget {
  const SettingsFriendsSheetWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<SettingsFriendsSheetWidget> createState() =>
      _SettingsFriendsSheetWidgetState();
}

class _SettingsFriendsSheetWidgetState
    extends State<SettingsFriendsSheetWidget> {
  late SettingsFriendsSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsFriendsSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultbal = await ProfileGroup.getProfileVisibilityCall.call();

      if ((_model.apiResultbal?.succeeded ?? true)) {
        _model.friends = (getJsonField(
          (_model.apiResultbal?.jsonBody ?? ''),
          r'''$.blocks''',
          true,
        )!
                .toList()
                .map<FriendTypeStruct?>(FriendTypeStruct.maybeFromMap)
                .toList() as Iterable<FriendTypeStruct?>)
            .withoutNulls
            .toList()
            .cast<FriendTypeStruct>();
        safeSetState(() {});
        _model.selectedItems = (getJsonField(
          (_model.apiResultbal?.jsonBody ?? ''),
          r'''$.blocks''',
          true,
        )!
                .toList()
                .map<FriendTypeStruct?>(FriendTypeStruct.maybeFromMap)
                .toList() as Iterable<FriendTypeStruct?>)
            .withoutNulls
            .where((e) => e.isSelected)
            .toList()
            .map((e) => e.id)
            .toList()
            .toList()
            .cast<int>();
        safeSetState(() {});
      } else {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: ErrorSheetWidget(
                  errorMessage: getJsonField(
                    (_model.apiResultbal?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString().toString(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(39.0, 62.0, 39.0, 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 49.0,
                    height: 49.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.chevron_left_sharp,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 24.0,
                    ),
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
                Opacity(
                  opacity: 0.0,
                  child: Container(
                    width: 49.0,
                    height: 49.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.title,
              'Select',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 26.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).info,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FaIcon(
                    FontAwesomeIcons.search,
                    color: Color(0xFFFCBD7B),
                    size: 24.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () async {
                            _model.searchResponse = await actions.searchFriends(
                              _model.textController.text,
                              _model.friends.toList(),
                            );
                            _model.searchResults = _model.searchResponse!
                                .toList()
                                .cast<FriendTypeStruct>();
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'ativqmm7' /* Arkadaşlarımı ara */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFAEB3B3),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).info,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 9.0))
                    .addToStart(SizedBox(width: 18.0))
                    .addToEnd(SizedBox(width: 18.0)),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.75,
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
                        final optionsList = (_model.searchResults.length > 0
                                ? _model.searchResults
                                : _model.friends)
                            .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: optionsList.length,
                          itemBuilder: (context, optionsListIndex) {
                            final optionsListItem =
                                optionsList[optionsListIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.selectedItems
                                        .contains(optionsListItem.id) ==
                                    false) {
                                  _model.addToSelectedItems(optionsListItem.id);
                                  safeSetState(() {});
                                } else {
                                  _model.removeFromSelectedItems(
                                      optionsListItem.id);
                                  safeSetState(() {});
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _model.selectedItems
                                              .contains(optionsListItem.id) ==
                                          true
                                      ? Color(0xFFFFF4EE)
                                      : FlutterFlowTheme.of(context).info,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          56.0, 0.0, 51.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipOval(
                                                child: Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.network(
                                                      optionsListItem
                                                          .avatar.url,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                optionsListItem.fullName,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
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
                                                              .secondary,
                                                      fontSize: 16.0,
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
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                          if (_model.selectedItems.contains(
                                                  optionsListItem.id) ==
                                              true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Icon(
                                                Icons.check,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x7FF37C20),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 16.0))
                                      .addToStart(SizedBox(height: 16.0)),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.74),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.apiResultydz =
                          await ProfileGroup.updateProfileVisibilityCall.call(
                        idsList: _model.selectedItems,
                      );

                      if ((_model.apiResultydz?.succeeded ?? true)) {
                        Navigator.pop(context);
                      }

                      safeSetState(() {});
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 15.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 49.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                27.0, 12.0, 27.0, 12.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'qzkcg7rk' /* KAYDET & DEVAM ET */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 18.0,
                                    letterSpacing: 1.8,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 14.0)),
      ),
    );
  }
}
