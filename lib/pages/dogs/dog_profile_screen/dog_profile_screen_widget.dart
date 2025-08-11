import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_area_wrapper/text_area_wrapper_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/components/modals/delete_dog_modal/delete_dog_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dog_profile_screen_model.dart';
export 'dog_profile_screen_model.dart';

class DogProfileScreenWidget extends StatefulWidget {
  const DogProfileScreenWidget({
    super.key,
    required this.id,
  });

  final int? id;

  static String routeName = 'DogProfileScreen';
  static String routePath = 'dogProfileScreen';

  @override
  State<DogProfileScreenWidget> createState() => _DogProfileScreenWidgetState();
}

class _DogProfileScreenWidgetState extends State<DogProfileScreenWidget> {
  late DogProfileScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DogProfileScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dogGendersResp = await StaticValuesGroup.dogGendersCall.call();

      if ((_model.dogGendersResp?.succeeded ?? true)) {
        _model.genders = (getJsonField(
          (_model.dogGendersResp?.jsonBody ?? ''),
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
      _model.dogTypeResult = await StaticValuesGroup.getDogTypesCall.call();

      _model.dogTypes = (getJsonField(
        (_model.dogTypeResult?.jsonBody ?? ''),
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
      safeSetState(() {});
      _model.apiResult8p3 = await DogsGroup.showDogCall.call(
        id: widget.id,
      );

      if ((_model.apiResult8p3?.succeeded ?? true)) {
        _model.dogInfos =
            DogTypeStruct.maybeFromMap(DogsGroup.showDogCall.record(
          (_model.apiResult8p3?.jsonBody ?? ''),
        ));
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResult8p3?.jsonBody ?? ''),
                r'''$.message''',
              ).toString().toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final dogProfileScreenGetGendersResponse = snapshot.data!;

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
                  custom_widgets.TopSafePaddingWidget(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 1.0,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          39.0, 14.0, 39.0, 14.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 15.0,
                            borderWidth: 1.0,
                            buttonSize: 49.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.keyboard_arrow_left_sharp,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Text(
                            FFLocalizations.of(context).getVariableText(
                              trText: '${_model.dogInfos?.title} Profili',
                              enText: 'Profile of ${_model.dogInfos?.title}',
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
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x00F25822),
                            icon: FaIcon(
                              FontAwesomeIcons.trashAlt,
                              color: FlutterFlowTheme.of(context).info,
                              size: 22.0,
                            ),
                            onPressed: () async {
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
                                        child: DeleteDogModalWidget(
                                          id: widget.id!,
                                          dogName: _model.dogInfos!.title,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (_model.isLoaded) {
                          return Stack(
                            children: [
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        39.0, 48.0, 39.0, 58.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                height: 233.0,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 233.0,
                                                        height: 233.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/dots_white.svg',
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
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
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 122.0,
                                                        height: 122.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              _model.dogInfos!
                                                                  .avatar.url,
                                                            ).image,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.35, 0.78),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 100.0,
                                                            buttonSize: 45.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .pen,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 16.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              final selectedMedia =
                                                                  await selectMediaWithSourceBottomSheet(
                                                                context:
                                                                    context,
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
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
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
                                                                _model.loading =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                _model.uploadImageResponse =
                                                                    await DogsGroup
                                                                        .updateAvatarCall
                                                                        .call(
                                                                  id: widget
                                                                      .id,
                                                                  avatar: _model
                                                                      .uploadedLocalFile,
                                                                );

                                                                if ((_model
                                                                        .uploadImageResponse
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  _model.dogInfos =
                                                                      DogTypeStruct
                                                                          .maybeFromMap(
                                                                              getJsonField(
                                                                    (_model.uploadImageResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.record''',
                                                                  ));
                                                                }
                                                              }
                                                              _model.loading =
                                                                  false;
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x04F7DED0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Text(
                                                            _model.dogInfos!
                                                                .title,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                                  fontSize:
                                                                      30.0,
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 21.0, 0.0, 0.0),
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
                                                    DogGalleryScreenWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        widget.id,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
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
                                                            '7mkppa6n' /* Resim Galerisi */,
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
                                                  0.0, 39.0, 0.0, 0.0),
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
                                                    '2hrng5km' /* Genel Bilgiler */,
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
                                                    model: _model
                                                        .textAreaWrapperModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        TextAreaWrapperWidget(
                                                      labelText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        trText:
                                                            'Köpek Hakkında',
                                                        enText: 'About Dog',
                                                      ),
                                                      isRequired: false,
                                                      isAutoFocus: false,
                                                      initialValue: _model
                                                          .dogInfos
                                                          ?.description,
                                                      labelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .textInputWrapperModel,
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
                                                    isRequired: false,
                                                    isAutoFocus: false,
                                                    initialValue:
                                                        _model.dogInfos?.title,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    readOnly: true,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .dogKindSelectDropdownModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: SelectDropdownWidget(
                                                    labelTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText:
                                                          'Köpeğinizin Türü',
                                                      enText:
                                                          'Breed of Your Dog',
                                                    ),
                                                    dropdownTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText:
                                                          'Köpeğinizin Türünü Seçin',
                                                      enText:
                                                          'Select Breed  of Your Dog',
                                                    ),
                                                    options: _model.dogTypes,
                                                    sheetTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText:
                                                          'Köpeğinizin Türünü Seçin',
                                                      enText:
                                                          'Select Kind of Your Dog',
                                                    ),
                                                    initialValue: _model
                                                        .dogInfos?.dogType,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    absorbing: true,
                                                    isRequired: false,
                                                    onValueChange:
                                                        (value) async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .dateInputWrapperModel,
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
                                                    isRequired: false,
                                                    isAutoFocus: false,
                                                    initialValue: _model
                                                        .dogInfos?.birthDate
                                                        ?.toString(),
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    defaultDate: _model
                                                        .dogInfos?.birthDate,
                                                    readonly: true,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .dogGenderSelectDropdownModel,
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
                                                          'Köpeğinizin Cinsiyetini Seçin',
                                                      enText:
                                                          'Select Sex of Your Dog',
                                                    ),
                                                    options: _model.genders,
                                                    sheetTitle:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                      trText:
                                                          'Köpeğinizin Cinsiyetini Seçin',
                                                      enText:
                                                          'Select Sex of Your Dog',
                                                    ),
                                                    initialValue:
                                                        SelectableOptionTypeStruct(
                                                      id: _model
                                                          .dogInfos?.gender,
                                                      title: _model.dogInfos
                                                                  ?.gender ==
                                                              1
                                                          ? FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                              trText: 'Erkek',
                                                              enText: 'Male',
                                                            )
                                                          : FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                              trText: 'Dişi',
                                                              enText: 'Female',
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 55.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.isLoaded = false;
                                                      safeSetState(() {});
                                                      _model.apiResultg3d =
                                                          await DogsGroup
                                                              .updateDogCall
                                                              .call(
                                                        id: widget.id,
                                                        title: _model
                                                            .textInputWrapperModel
                                                            .customInputTextController
                                                            .text,
                                                        description: _model
                                                            .textAreaWrapperModel
                                                            .customInputTextController
                                                            .text,
                                                        age: _model
                                                            .dateInputWrapperModel
                                                            .value
                                                            ?.toString(),
                                                        gender: _model
                                                            .dogGenderSelectDropdownModel
                                                            .value
                                                            ?.id
                                                            .toString(),
                                                        dogType: _model
                                                            .dogKindSelectDropdownModel
                                                            .value
                                                            ?.id,
                                                        image: _model
                                                            .uploadedLocalFile,
                                                      );

                                                      if ((_model.apiResultg3d
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.dogInfos =
                                                            DogTypeStruct
                                                                .maybeFromMap(
                                                                    getJsonField(
                                                          (_model.apiResultg3d
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.record''',
                                                        ));
                                                        safeSetState(() {});
                                                      } else {
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
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      ErrorSheetWidget(
                                                                    errorMessage:
                                                                        getJsonField(
                                                                      (_model.apiResultg3d
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }

                                                      _model.isLoaded = true;
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'n3bzxcpz' /* KAYDET */,
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
                                ],
                              ),
                              if (_model.loading == true)
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x56FFBE98),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset(
                                        'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                                        width: 110.0,
                                        height: 110.0,
                                        fit: BoxFit.contain,
                                        animate: true,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Lottie.asset(
                              'assets/jsons/Animation_-_1732613829909.json',
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.contain,
                              animate: true,
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
      },
    );
  }
}
