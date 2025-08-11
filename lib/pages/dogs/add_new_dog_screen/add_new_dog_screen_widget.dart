import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/components/modals/add_dog_modal/add_dog_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_new_dog_screen_model.dart';
export 'add_new_dog_screen_model.dart';

class AddNewDogScreenWidget extends StatefulWidget {
  const AddNewDogScreenWidget({super.key});

  static String routeName = 'AddNewDogScreen';
  static String routePath = 'addNewDogScreen';

  @override
  State<AddNewDogScreenWidget> createState() => _AddNewDogScreenWidgetState();
}

class _AddNewDogScreenWidgetState extends State<AddNewDogScreenWidget> {
  late AddNewDogScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewDogScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      safeSetState(() {});
      _model.apiResultz7g = await StaticValuesGroup.getDogTypesCall.call();

      if ((_model.apiResultz7g?.succeeded ?? true)) {
        _model.dogTypes = (getJsonField(
          (_model.apiResultz7g?.jsonBody ?? ''),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(39.0, 0.0, 39.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    custom_widgets.TopSafePaddingWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 1.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Opacity(
                            opacity: 0.0,
                            child: FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 49.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'mma5dpzb' /* Yeni Köpek Ekle */,
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
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 15.0,
                            borderWidth: 1.0,
                            buttonSize: 49.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.close_sharp,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 20.0,
                        child: custom_widgets.CustomRegisterIndicator(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 20.0,
                          index: _model.pageViewCurrentIndex,
                          pageCount: 2,
                          dotWidth: 156.0,
                          dotColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              39.0, 0.0, 39.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: PageView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    onPageChanged: (_) => safeSetState(() {}),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      41.0, 32.0, 41.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/register-dog-icon.svg',
                                                      width: 26.0,
                                                      height: 38.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'akhcz9sz' /* Şimdi köpeğinizin sırası. Onun... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                    .info,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.2,
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
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              wrapWithModel(
                                                model: _model
                                                    .textInputWrapperModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TextInputWrapperWidget(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getVariableText(
                                                    trText: 'Köpeğinizin İsmi',
                                                    enText: 'Name of Your Dog',
                                                  ),
                                                  isRequired: true,
                                                  isAutoFocus: true,
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
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
                                                    trText: 'Köpeğinizin Türü',
                                                    enText: 'Breed of Your Dog',
                                                  ),
                                                  dropdownTitle:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText:
                                                        'Köpeğinizin Türünü Seçin',
                                                    enText:
                                                        'Select Breed of Your Dog',
                                                  ),
                                                  options: _model.dogTypes,
                                                  sheetTitle:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText:
                                                        'Köpeğinizin Türünü Seçin',
                                                    enText:
                                                        'Select Breed of Your Dog',
                                                  ),
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
                                                model: _model
                                                    .dateInputWrapperModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: DateInputWrapperWidget(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getVariableText(
                                                    trText: 'Doğum Tarihi',
                                                    enText: 'Birth Date',
                                                  ),
                                                  isRequired: false,
                                                  isAutoFocus: false,
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
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
                                                  options:
                                                      FFAppState().DogGenders,
                                                  sheetTitle:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText:
                                                        'Köpeğinizin Cinsiyetini Seçin',
                                                    enText:
                                                        'Select Sex of Your Dog',
                                                  ),
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 13.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if ((_model
                                                                    .textInputWrapperModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '') ||
                                                        (_model
                                                                .dateInputWrapperModel
                                                                .value ==
                                                            null) ||
                                                        (_model.dogGenderSelectDropdownModel
                                                                .value ==
                                                            null) ||
                                                        (_model.dogKindSelectDropdownModel
                                                                .value ==
                                                            null)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              trText:
                                                                  'Lütfen gerekli alanları doldurunuz',
                                                              enText:
                                                                  'Please fill to required fields',
                                                            ),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                    } else {
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    }
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'cydp3ijw' /* DEVAM ET */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                45.0,
                                                                12.0,
                                                                45.0,
                                                                12.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
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
                                                          color: Colors.white,
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
                                                    elevation: 3.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  showLoadingIndicator: false,
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 19.0)),
                                          ),
                                        ].divide(SizedBox(height: 45.0)),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      41.0, 32.0, 41.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/register-dog-icon.svg',
                                                      width: 26.0,
                                                      height: 38.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nu5hap2s' /* Köpeğinizin profil fotoğrafını... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                    .info,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.2,
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
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 354.0,
                                              height: 354.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00F7DED0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/dots-on-image.svg',
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
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipOval(
                                                      child: Container(
                                                        width: 211.0,
                                                        height: 211.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: Image.memory(
                                                              _model.uploadedLocalFile
                                                                      .bytes ??
                                                                  Uint8List
                                                                      .fromList(
                                                                          []),
                                                            ).image,
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            width: 1.78,
                                                          ),
                                                        ),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
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
                                                          },
                                                          text: '',
                                                          icon: Icon(
                                                            Icons
                                                                .file_upload_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 76.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconAlignment:
                                                                IconAlignment
                                                                    .end,
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0x03F25822),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
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
                                                      height: double.infinity,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 80.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x04F7DED0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child:
                                                            AnimatedDefaultTextStyle(
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
                                                          duration: Duration(
                                                              milliseconds:
                                                                  600),
                                                          curve: Curves.easeIn,
                                                          child: Text(
                                                            _model
                                                                .textInputWrapperModel
                                                                .customInputTextController
                                                                .text,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (_model
                                                          .dogGenderSelectDropdownModel
                                                          .value
                                                          ?.id ==
                                                      1) {
                                                    return Icon(
                                                      Icons.male,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 20.0,
                                                    );
                                                  } else {
                                                    return Icon(
                                                      Icons.female_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 20.0,
                                                    );
                                                  }
                                                },
                                              ),
                                              Container(
                                                width: 1.0,
                                                height: 18.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7FF37C20),
                                                ),
                                              ),
                                              Text(
                                                functions.calculateAge(_model
                                                    .dateInputWrapperModel
                                                    .value),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'jsMath',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 13.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if ((_model.uploadedLocalFile
                                                            .bytes?.isEmpty ??
                                                        true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          trText:
                                                              'Lütfen gerekli alanları doldurunuz',
                                                          enText:
                                                              'Please fill the required fields',
                                                        ),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
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
                                                } else {
                                                  _model.loading = true;
                                                  safeSetState(() {});
                                                  _model.apiResultiig =
                                                      await DogsGroup
                                                          .createDogCall
                                                          .call(
                                                    title: _model
                                                        .textInputWrapperModel
                                                        .customInputTextController
                                                        .text,
                                                    age: _model
                                                        .dateInputWrapperModel
                                                        .value
                                                        ?.toString(),
                                                    gender: _model
                                                        .dogGenderSelectDropdownModel
                                                        .value
                                                        ?.id,
                                                    dogType: _model
                                                        .dogKindSelectDropdownModel
                                                        .value
                                                        ?.id,
                                                    image: _model
                                                        .uploadedLocalFile,
                                                  );

                                                  if ((_model.apiResultiig
                                                          ?.succeeded ??
                                                      true)) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
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
                                                                  AddDogModalWidget(
                                                                dogName: _model
                                                                    .textInputWrapperModel
                                                                    .customInputTextController
                                                                    .text,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
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
                                                                  (_model.apiResultiig
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
                                                        safeSetState(() {}));
                                                  }

                                                  _model.loading = false;
                                                  safeSetState(() {});
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'dckgc4cz' /* DEVAM ET */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        45.0, 12.0, 45.0, 12.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
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
                                                elevation: 15.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 45.0)),
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
                    if (_model.loading)
                      wrapWithModel(
                        model: _model.loadingViewModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoadingViewWidget(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
