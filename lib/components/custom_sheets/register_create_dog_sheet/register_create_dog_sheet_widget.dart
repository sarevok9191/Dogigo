import '/backend/schema/structs/index.dart';
import '/components/fake_snackbar_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'register_create_dog_sheet_model.dart';
export 'register_create_dog_sheet_model.dart';

class RegisterCreateDogSheetWidget extends StatefulWidget {
  const RegisterCreateDogSheetWidget({
    super.key,
    required this.onSuccessValidation,
  });

  final Future Function(DogRelationTypeStruct dog, FFUploadedFile avatar)?
      onSuccessValidation;

  @override
  State<RegisterCreateDogSheetWidget> createState() =>
      _RegisterCreateDogSheetWidgetState();
}

class _RegisterCreateDogSheetWidgetState
    extends State<RegisterCreateDogSheetWidget> {
  late RegisterCreateDogSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterCreateDogSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.5,
          decoration: BoxDecoration(
            color: Color(0xFFF5AD78),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.5,
            decoration: BoxDecoration(),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/login-top-bg.png',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.5,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: InkWell(
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/login-logo.svg',
                                  width: 96.0,
                                  height: 48.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00F7DED0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 12.0, 32.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0x00F7DED0),
                            ),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '53xga6cj' /* Köpek Ekle */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  41.0, 32.0, 41.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/register-dog-icon.svg',
                                      width: 26.0,
                                      height: 38.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '5e59nlw0' /* Şimdi köpeğinizin sırası. Lütf... */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 13.0,
                                            letterSpacing: 0.2,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 354.0,
                              height: 354.0,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/dots_white.svg',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: ClipOval(
                                      child: Container(
                                        width: 211.0,
                                        height: 211.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 1.78,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Stack(
                                            children: [
                                              Opacity(
                                                opacity: valueOrDefault<double>(
                                                  (_model
                                                                  .uploadedLocalFile
                                                                  .bytes
                                                                  ?.isEmpty ??
                                                              true)
                                                      ? 0.0
                                                      : 1.0,
                                                  0.0,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  child: Image.memory(
                                                    _model.uploadedLocalFile
                                                            .bytes ??
                                                        Uint8List.fromList([]),
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
                                              Opacity(
                                                opacity: valueOrDefault<double>(
                                                  (_model
                                                                  .uploadedLocalFile
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false)
                                                      ? 0.0
                                                      : 1.0,
                                                  1.0,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
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
                                                        safeSetState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        try {
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
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
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                          });
                                                        } else {
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    text: '',
                                                    icon: Icon(
                                                      Icons
                                                          .file_upload_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 76.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconAlignment:
                                                          IconAlignment.end,
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0x03F25822),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.dogNameInputModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TextInputWrapperWidget(
                                    labelText: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Köpeğinizin İsmi',
                                      enText: 'Name of Your Dog',
                                    ),
                                    isRequired: true,
                                    isAutoFocus: true,
                                    labelColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.dogKindSelectDropdownModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SelectDropdownWidget(
                                    labelTitle: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Köpeğinizin Cinsi',
                                      enText: 'Kind of Your Dog',
                                    ),
                                    dropdownTitle: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Köpeğinizin Cinsini Seçin',
                                      enText: 'Select Kind of Your Dog',
                                    ),
                                    options: FFAppState().DogTypes,
                                    sheetTitle: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Köpeğinizin Cinsini Seçin',
                                      enText: 'Select Kind of Your Dog',
                                    ),
                                    absorbing: false,
                                    isRequired: false,
                                    labelColor:
                                        FlutterFlowTheme.of(context).info,
                                    onValueChange: (value) async {},
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.dogBirthdateInputModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: DateInputWrapperWidget(
                                    labelText: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Doğum Tarihi',
                                      enText: 'Birth Date',
                                    ),
                                    isRequired: true,
                                    isAutoFocus: false,
                                    labelColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.dogGenderSelectDropdownModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SelectDropdownWidget(
                                    labelTitle: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Köpeğinizin Cinsiyeti',
                                      enText: 'Sex of Your Dog',
                                    ),
                                    dropdownTitle: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Köpeğinizin Cinsiyetini Seçin',
                                      enText: 'Select Sex of Your Dog',
                                    ),
                                    options: FFAppState().DogGenders,
                                    sheetTitle: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'Köpeğinizin Cinsiyetini Seçin',
                                      enText: 'Select Sex of Your Dog',
                                    ),
                                    absorbing: false,
                                    isRequired: false,
                                    labelColor:
                                        FlutterFlowTheme.of(context).info,
                                    onValueChange: (value) async {},
                                  ),
                                ),
                              ].divide(SizedBox(height: 14.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 26.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if ((_model.dogNameInputModel
                                                .customInputTextController.text !=
                                            '') &&
                                    ((_model.uploadedLocalFile.bytes
                                                ?.isNotEmpty ??
                                            false)) &&
                                    (_model.dogKindSelectDropdownModel.value !=
                                        null) &&
                                    (_model.dogBirthdateInputModel.value !=
                                        null) &&
                                    (_model.dogGenderSelectDropdownModel
                                            .value !=
                                        null)) {
                                  _model.formValidation = true;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    _model.formValidation = false;
                                  }
                                  if (_model.dogBirthdateInputModel.value! >=
                                      getCurrentTimestamp) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: 150.0,
                                              child: FakeSnackbarWidget(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ncdqc5du' /* Geçersiz Tarih */,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    if (_model.formValidation!) {
                                      await widget.onSuccessValidation?.call(
                                        DogRelationTypeStruct(
                                          action: 'store',
                                          key: 'dogs',
                                          title: _model.dogNameInputModel
                                              .customInputTextController.text,
                                          gender: _model
                                              .dogGenderSelectDropdownModel
                                              .value
                                              ?.id,
                                          dogType: _model
                                              .dogKindSelectDropdownModel.value,
                                          birthDate: _model
                                              .dogBirthdateInputModel.value,
                                        ),
                                        _model.uploadedLocalFile,
                                      );
                                      Navigator.pop(context);
                                    }
                                  }
                                } else {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: 150.0,
                                            child: FakeSnackbarWidget(
                                              text: FFLocalizations.of(context)
                                                  .getVariableText(
                                                trText:
                                                    'Lütfen zorunlu alanları doldurun',
                                                enText:
                                                    'Please fill the required fields',
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
                              text: FFLocalizations.of(context).getText(
                                'kbgt4x9k' /* DEVAM ET */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    45.0, 12.0, 45.0, 12.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 1.8,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 20.0))
                            .addToEnd(SizedBox(height: 50.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
