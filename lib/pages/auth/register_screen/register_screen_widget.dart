import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/register_done_sheet/register_done_sheet_widget.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/components/inputs/password_input_wrapper/password_input_wrapper_widget.dart';
import '/components/inputs/phone_input_wrapper/phone_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_area_wrapper/text_area_wrapper_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/components/modals/web_view_modal/web_view_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dart:typed_data';

import 'register_screen_model.dart';
export 'register_screen_model.dart';

class RegisterScreenWidget extends StatefulWidget {
  const RegisterScreenWidget({super.key});

  static String routeName = 'RegisterScreen';
  static String routePath = 'registerScreen';

  @override
  State<RegisterScreenWidget> createState() => _RegisterScreenWidgetState();
}

class _RegisterScreenWidgetState extends State<RegisterScreenWidget> {
  late RegisterScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      safeSetState(() {});
      _model.apiResult6vy = await StaticValuesGroup.getCountriesCall.call();

      if ((_model.apiResult6vy?.succeeded ?? true)) {
        _model.countries = (getJsonField(
          (_model.apiResult6vy?.jsonBody ?? ''),
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
      _model.apiResultpsi = await StaticValuesGroup.getDogTypesCall.call();

      if ((_model.apiResultpsi?.succeeded ?? true)) {
        FFAppState().DogTypes = (getJsonField(
          (_model.apiResultpsi?.jsonBody ?? ''),
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
      _model.apiResultxdo = await StaticValuesGroup.getGendersCall.call();

      if ((_model.apiResultxdo?.succeeded ?? true)) {
        _model.genders = (getJsonField(
          (_model.apiResultxdo?.jsonBody ?? ''),
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
        FFAppState().Genders = (getJsonField(
          (_model.apiResultxdo?.jsonBody ?? ''),
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

    // ===== Responsive tokens =====
    final size = MediaQuery.sizeOf(context);
    final w = size.width;
    final h = size.height;

    // side padding scales by width
    final double hPad = (w * 0.06).clamp(12.0, 48.0);

    // square containers (1:1 areas like avatar stacks)
    final double square = (w - 2 * hPad).clamp(260.0, 420.0);

    // circular avatar diameter
    final double avatar = (square * 0.45).clamp(110.0, 200.0);

    // buttons
    final double buttonW = (w - 2 * hPad).clamp(280.0, 560.0);
    final double buttonH = (w * 0.14).clamp(48.0, 56.0);

    // progress indicator height
    final double indicatorH = (w * 0.08).clamp(24.0, 34.0);

    // gaps
    final double gapSm = (w * 0.02).clamp(8.0, 14.0);
    final double gapMd = (w * 0.04).clamp(16.0, 24.0);
    final double gapLg = (h * 0.08).clamp(48.0, 96.0);

    // icons
    final double iconSize = (w * 0.05).clamp(18.0, 24.0);

    // type scale
    final double h1Size = (w * 0.065).clamp(20.0, 28.0);
    final double titleSize = (w * 0.06).clamp(18.0, 26.0);
    final double bodySize = (w * 0.04).clamp(13.0, 16.0);
    final double smallSize = (w * 0.035).clamp(12.0, 14.0);

    // helper for bottom-lift shadow
    List<BoxShadow> bottomLiftShadow() => [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            spreadRadius: 0,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ];

    // sex text helper
    String sexLabelFromId(int? id) => (id == 1) ? 'Male' : 'Female';

    // user sex from app state (id or string)
    String userSexLabel() {
      final g = FFAppState().RegisteringUser.userGender;
      if (g == '1') return 'Male';
      if (g == '0') return 'Female';
      if ((g ?? '').toLowerCase().contains('male')) return 'Male';
      if ((g ?? '').toLowerCase().contains('female')) return 'Female';
      return '—';
    }

    String ageYearsText(String? ageStr) {
      // functions.calculateAge returns a string; just wrap as requested
      final a = ageStr ?? '';
      return 'Age ($a) years old';
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFEEEE9), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2],
            ),
          ),
          child: Stack(
            children: [
              const Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SizedBox(width: double.infinity, height: 0.0),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                  child: Container(
                    width: w,
                    height: h,
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(hPad, 12.0, hPad, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Back or header stack (kept minimal)
                          Stack(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.pageViewCurrentIndex == 0) {
                                      context.safePop();
                                    } else {
                                      await _model.pageViewController
                                          ?.previousPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    }
                                  },
                                  child: const SizedBox(),
                                ),
                              ),
                            ],
                          ),

                          // progress indicator (height tiny)
                          SizedBox(
                            height: 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(
                                        -0.5, 0.0),
                                    child: SizedBox(
                                      width: w,
                                      height: indicatorH,
                                      child: custom_widgets
                                          .CustomRegisterIndicator(
                                        width: w,
                                        height: indicatorH,
                                        index: _model.pageViewCurrentIndex,
                                        pageCount: 4,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Title
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                  'bb62k52v' /* Hesap Oluştur */),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily:
                                        GoogleFonts.manrope().fontFamily,
                                    color: const Color(0xFF000000),
                                    fontSize: h1Size,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),

                          Expanded(
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: h,
                                  child: PageView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller:
                                        _model.pageViewController ??=
                                            PageController(initialPage: 0),
                                    onPageChanged: (_) => safeSetState(() {}),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      // ========== PAGE 1: User info form ==========
                                      Form(
                                        key: _model.formKey2,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 0.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 5.0,
                                                              0.0, 20.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                                  'i7wkq3ob' /* Hey, köpek dostu! ... */),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts
                                                                            .manrope()
                                                                        .fontFamily,
                                                                color: const Color(
                                                                    0xFF858584),
                                                                fontSize:
                                                                    bodySize,
                                                                letterSpacing:
                                                                    0.2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(SizedBox(
                                                        width: gapMd)),
                                                  ),
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model.nameInputModel,
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
                                                  isAutoFocus: true,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .surnameInputModel,
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
                                                ),
                                              ),
                                              wrapWithModel(
                                                model:
                                                    _model.phoneInputModel,
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
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .emailWrapperModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EmailWrapperWidget(
                                                  labelText:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                              '65s7t44h' /* E-posta */),
                                                  isRequired: true,
                                                  isAutoFocus: false,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .usernameWrapperModel,
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
                                                  isRequired: true,
                                                  isAutoFocus: false,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .passwordInputModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    PasswordInputWrapperWidget(
                                                  labelText:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText: 'Şifre',
                                                    enText: 'Password',
                                                  ),
                                                  isRequired: true,
                                                  isAutoFocus: false,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .repeatPasswordInputModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    PasswordInputWrapperWidget(
                                                  labelText:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText: 'Şifre Tekrarı',
                                                    enText:
                                                        'Repeat Password',
                                                  ),
                                                  isRequired: true,
                                                  isAutoFocus: false,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .birthdateInputModel,
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
                                                  initialValue: '',
                                                  maxDate: null,
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
                                                    enText:
                                                        'Select Your Sex',
                                                  ),
                                                  options:
                                                      FFAppState().Genders,
                                                  sheetTitle:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText:
                                                        'Cinsiyetinizi Seçin',
                                                    enText:
                                                        'Select Your Sex',
                                                  ),
                                                  absorbing: false,
                                                  isRequired: true,
                                                  onValueChange:
                                                      (value) async {},
                                                ),
                                              ),
                                              FutureBuilder<ApiCallResponse>(
                                                future: _model.countriesList(
                                                  requestFn: () =>
                                                      StaticValuesGroup
                                                          .getCountriesCall
                                                          .call(),
                                                ),
                                                builder:
                                                    (context, snapshot) {
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        child:
                                                            SpinKitPumpingHeart(
                                                          color:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final _ =
                                                      snapshot.data!;
                                                  return wrapWithModel(
                                                    model: _model
                                                        .countrySelectDropdownModel,
                                                    updateCallback: () =>
                                                        safeSetState(
                                                            () {}),
                                                    child:
                                                        SelectDropdownWidget(
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
                                                        trText:
                                                            'Ülke Seçin',
                                                        enText:
                                                            'Select Country',
                                                      ),
                                                      options:
                                                          _model.countries,
                                                      sheetTitle:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        trText:
                                                            'Ülke Seçin',
                                                        enText:
                                                            'Select Country',
                                                      ),
                                                      absorbing: false,
                                                      isRequired: true,
                                                      onValueChange:
                                                          (value) async {
                                                        _model.citiesRepsonse =
                                                            await StaticValuesGroup
                                                                .getCitiesCall
                                                                .call(
                                                          countryId:
                                                              value?.id,
                                                        );
                                                        if ((_model
                                                                .citiesRepsonse
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.cities = (getJsonField(
                                                            (_model.citiesRepsonse
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.records''',
                                                            true,
                                                          )!
                                                                  .toList()
                                                                  .map<SelectableOptionTypeStruct?>(
                                                                      SelectableOptionTypeStruct
                                                                          .maybeFromMap)
                                                                  .toList() as Iterable<
                                                              SelectableOptionTypeStruct?>)
                                                              .withoutNulls
                                                              .toList()
                                                              .cast<
                                                                  SelectableOptionTypeStruct>();
                                                          safeSetState(
                                                              () {});
                                                        }
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .citySelectDropdownModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: SelectDropdownWidget(
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
                                                  absorbing: _model
                                                          .countrySelectDropdownModel
                                                          .value ==
                                                      null,
                                                  isRequired: true,
                                                  onValueChange:
                                                      (value) async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .addressInputModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    TextAreaWrapperWidget(
                                                  labelText:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText: 'Adres',
                                                    enText: 'Address',
                                                  ),
                                                  isRequired: true,
                                                  isAutoFocus: false,
                                                ),
                                              ),
                                              // agreement
                                              Material(
                                                color: Colors.transparent,
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        const CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity
                                                              .compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                  ),
                                                  child:
                                                      CheckboxListTile(
                                                    value: _model
                                                            .checkboxListTileValue ??
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() =>
                                                          _model.checkboxListTileValue =
                                                              newValue ??
                                                                  false);
                                                      if (newValue ==
                                                          true) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag:
                                                              false,
                                                          context:
                                                              context,
                                                          builder:
                                                              (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () {
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
                                                                      SizedBox(
                                                                    height: MediaQuery.sizeOf(context).height *
                                                                        0.8,
                                                                    child:
                                                                        const WebViewModalWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                    title: RichText(
                                                      text: TextSpan(
                                                        style: FlutterFlowTheme
                                                                .of(
                                                                    context)
                                                            .labelSmall
                                                            .override(
                                                              fontFamily:
                                                                  GoogleFonts
                                                                          .manrope()
                                                                      .fontFamily,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontSize:
                                                                  bodySize,
                                                              color: Colors
                                                                  .black,
                                                            ),
                                                        children: const [
                                                          TextSpan(
                                                              text:
                                                                  'Kullanıcı Sözleşmesi ve'),
                                                          TextSpan(
                                                            text:
                                                                ' Gizlilik',
                                                            style:
                                                                TextStyle(
                                                              color: Color(
                                                                  0xFFF79E7F),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '  metnini okudum ve kabul ediyorum.',
                                                            style:
                                                                TextStyle(
                                                              color: Colors
                                                                  .black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                0.0,
                                                                12.0,
                                                                0.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              // Continue button
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 26.0,
                                                            0.0, 0.0),
                                                child: Container(
                                                  width: buttonW,
                                                  height: buttonH,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      end:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      colors: [
                                                        Color(0xFFF79E7F),
                                                        Color(0xFFF25822),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(28.0),
                                                  ),
                                                  child: FFButtonWidget(
                                                    onPressed:
                                                        () async {
                                                      if (_model.checkboxListTileValue ==
                                                          false) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(context).getVariableText(
                                                                trText:
                                                                    'Kullanıcı Sözleşmesini kabul etmeniz gerekmektedir.',
                                                                enText:
                                                                    'You must accept the User Agreement.',
                                                              ),
                                                              style:
                                                                  TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      } else {
                                                        if ((_model.birthdateInputModel.value ==
                                                                null) ||
                                                            (_model
                                                                    .nameInputModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model
                                                                    .surnameInputModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model
                                                                    .phoneInputModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model
                                                                    .emailWrapperModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model
                                                                    .usernameWrapperModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model
                                                                    .passwordInputModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model
                                                                    .repeatPasswordInputModel
                                                                    .customInputTextController
                                                                    .text ==
                                                                '')) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content:
                                                                  Text(
                                                                FFLocalizations.of(context).getVariableText(
                                                                  trText:
                                                                      'Lütfen zorunlu alanları doldurunuz.',
                                                                  enText:
                                                                      'Please fill the required fields',
                                                                ),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                ),
                                                              ),
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                            ),
                                                          );
                                                        } else {
                                                          if (_model
                                                                  .birthdateInputModel
                                                                  .value! >=
                                                              getCurrentTimestamp) {
                                                            ScaffoldMessenger.of(
                                                                    context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content:
                                                                    Text(
                                                                  FFLocalizations.of(context).getVariableText(
                                                                    trText:
                                                                        'Lütfen zorunlu alanları doldurunuz.',
                                                                    enText:
                                                                        'Please fill the required fields',
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                  ),
                                                                ),
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );
                                                          } else {
                                                            _model.checkRegisterResponse =
                                                                await AuthenticationGroup
                                                                    .checkRegisterUniqueCall
                                                                    .call(
                                                              email: _model
                                                                  .emailWrapperModel
                                                                  .customInputTextController
                                                                  .text,
                                                              username: _model
                                                                  .usernameWrapperModel
                                                                  .customInputTextController
                                                                  .text,
                                                              dateBirth: _model
                                                                  .birthdateInputModel
                                                                  .value
                                                                  ?.toString(),
                                                              password: _model
                                                                  .passwordInputModel
                                                                  .customInputTextController
                                                                  .text,
                                                              passwordConfirmation:
                                                                  _model
                                                                      .repeatPasswordInputModel
                                                                      .customInputTextController
                                                                      .text,
                                                            );

                                                            if ((_model
                                                                    .checkRegisterResponse
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if (_model.formKey2
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey2
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                              if (_model
                                                                      .passwordInputModel
                                                                      .customInputTextController
                                                                      .text ==
                                                                  _model
                                                                      .repeatPasswordInputModel
                                                                      .customInputTextController
                                                                      .text) {
                                                                await _model
                                                                    .pageViewController
                                                                    ?.nextPage(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      FFLocalizations.of(context).getVariableText(
                                                                        trText:
                                                                            'Şifre tekrarı eşleşmiyor',
                                                                        enText:
                                                                            'Password Confirmation Doesnt Match',
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                      ),
                                                                    ),
                                                                    duration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              if ((_model.checkRegisterResponse?.statusCode ??
                                                                      200) ==
                                                                  422) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      functions.getValidationErrorMessages(
                                                                        (_model.checkRegisterResponse?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                      ),
                                                                    ),
                                                                    duration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      FFLocalizations.of(context).getVariableText(
                                                                        trText:
                                                                            'Bir Hata Oluştu! Lütfen daha sonra tekrar deneyin',
                                                                        enText:
                                                                            'An Error Occurred! Please try again later.',
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                      ),
                                                                    ),
                                                                    duration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                      safeSetState(() {});
                                                    },
                                                    text:
                                                        FFLocalizations.of(context).getText('5gsud5z1' /* DEVAM ET */),
                                                    options:
                                                        FFButtonOptions(
                                                      height: buttonH,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  45.0,
                                                                  12.0,
                                                                  45.0,
                                                                  12.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          Colors.transparent,
                                                      textStyle:
                                                          const TextStyle(
                                                        fontFamily:
                                                            'Manrope',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                        letterSpacing: 1.8,
                                                        color: Colors.white,
                                                      ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  28.0),
                                                    ),
                                                    showLoadingIndicator:
                                                        false,
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(
                                                    height: gapMd))
                                                .addToEnd(const SizedBox(
                                                    height: 80.0)),
                                          ),
                                        ),
                                      ),

                                      // ========== PAGE 2: User avatar + merged info box ==========
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0,
                                                            0.0, 0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                                'c9dw02ie' /* İnsanların sizi görebilmesi için... */),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  GoogleFonts
                                                                          .manrope()
                                                                      .fontFamily,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      110,
                                                                      110,
                                                                      110),
                                                              fontSize:
                                                                  bodySize,
                                                              letterSpacing:
                                                                  0.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(SizedBox(
                                                      width: gapMd)),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: SizedBox(
                                                width: square,
                                                height: square,
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    // Avatar circle
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -0.25),
                                                      child: ClipOval(
                                                        child: Container(
                                                          width: avatar,
                                                          height: avatar,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFFDEEE6),
                                                            shape: BoxShape
                                                                .circle,
                                                            border:
                                                                Border.all(
                                                              color: const Color(
                                                                  0xFFFABBA4),
                                                              width: 1.78,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              // uploaded image
                                                              Opacity(
                                                                opacity: valueOrDefault<
                                                                    double>(
                                                                  (_model.uploadedLocalFile1.bytes?.isEmpty ??
                                                                          true)
                                                                      ? 0.0
                                                                      : 1.0,
                                                                  0.0,
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          100.0),
                                                                  child: Image
                                                                      .memory(
                                                                    _model.uploadedLocalFile1.bytes ??
                                                                        Uint8List.fromList(
                                                                            []),
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              // upload button
                                                              Opacity(
                                                                opacity: valueOrDefault<
                                                                    double>(
                                                                  (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                                                                          false)
                                                                      ? 0.0
                                                                      : 1.0,
                                                                  1.0,
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                          context:
                                                                              context,
                                                                          allowPhoto:
                                                                              true);
                                                                      if (selectedMedia !=
                                                                              null &&
                                                                          selectedMedia.every((m) =>
                                                                              validateFileFormat(m.storagePath,
                                                                                  context))) {
                                                                        safeSetState(() => _model.isDataUploading1 =
                                                                            true);
                                                                        var files =
                                                                            <FFUploadedFile>[];
                                                                        try {
                                                                          files = selectedMedia
                                                                              .map((m) => FFUploadedFile(
                                                                                    name: m.storagePath.split('/').last,
                                                                                    bytes: m.bytes,
                                                                                    height: m.dimensions?.height,
                                                                                    width: m.dimensions?.width,
                                                                                    blurHash: m.blurHash,
                                                                                  ))
                                                                              .toList();
                                                                        } finally {
                                                                          safeSetState(() =>
                                                                              _model.isDataUploading1 = false);
                                                                        }
                                                                        if (files.length ==
                                                                            selectedMedia.length) {
                                                                          safeSetState(() =>
                                                                              _model.uploadedLocalFile1 = files.first);
                                                                        }
                                                                      }
                                                                    },
                                                                    text: '',
                                                                    icon:
                                                                        const Icon(
                                                                      Icons.person_outline_sharp,
                                                                      color: Color(
                                                                          0xFFFFA573),
                                                                      size:
                                                                          76.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      padding:
                                                                          const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                      iconAlignment:
                                                                          IconAlignment
                                                                              .end,
                                                                      iconPadding:
                                                                          const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                      color: const Color(
                                                                          0x03F25822),
                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                            fontFamily:
                                                                                GoogleFonts.manrope().fontFamily,
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    // MERGED bordered info box (Name + Sex + Age)
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.95),
                                                      child: LayoutBuilder(
                                                        builder: (context, c) {
                                                          final cw =
                                                              c.maxWidth;
                                                          final boxW =
                                                              (cw * 0.62)
                                                                  .clamp(
                                                                      180.0,
                                                                      300.0);
                                                          final boxH =
                                                              (cw * 0.34)
                                                                  .clamp(
                                                                      110.0,
                                                                      150.0);
                                                          return Container(
                                                            width: boxW,
                                                            height: boxH,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        gapSm,
                                                                    vertical:
                                                                        gapSm),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .white,
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xFFD8D8D8),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              boxShadow:
                                                                  bottomLiftShadow(),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                // Name
                                                                Text(
                                                                  _model
                                                                      .nameInputModel
                                                                      .customInputTextController
                                                                      .text,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            GoogleFonts.manrope().fontFamily,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            titleSize,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        gapSm),
                                                                // Sex + Age row
                                                                Wrap(
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .center,
                                                                  spacing: 8,
                                                                  runSpacing:
                                                                      6,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .center,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Icon(
                                                                          (FFAppState().RegisteringUser.userGender == '1' ||
                                                                                  (FFAppState().RegisteringUser.userGender ?? '')
                                                                                      .toLowerCase()
                                                                                      .contains('male'))
                                                                              ? Icons.male
                                                                              : Icons.female_sharp,
                                                                          size:
                                                                              iconSize,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                4),
                                                                        Text(
                                                                          userSexLabel(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                smallSize,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      width: 1,
                                                                      height:
                                                                          iconSize -
                                                                              2,
                                                                      color: const Color(
                                                                          0x7FF37C20),
                                                                    ),
                                                                    Text(
                                                                      ageYearsText(functions.calculateAge(_model.birthdateInputModel.value)),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            smallSize,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // Continue
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0.0, gapLg,
                                                          0.0, 0.0),
                                              child: Container(
                                                width: buttonW,
                                                height: buttonH,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment.topLeft,
                                                    end: Alignment
                                                        .bottomRight,
                                                    colors: [
                                                      Color(0xFFF79E7F),
                                                      Color(0xFFF25822),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if ((_model
                                                                .uploadedLocalFile1
                                                                .bytes
                                                                ?.isNotEmpty ??
                                                            false)) {
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.ease,
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                              trText:
                                                                  'Profil fotoğrafı zorunludur..!',
                                                              enText:
                                                                  'Profile Photo Is Required!',
                                                            ),
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFFFF0000),
                                                              fontSize: 12.0,
                                                            ),
                                                            textAlign:
                                                                TextAlign
                                                                    .center,
                                                          ),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                          '6b1a299c' /* DEVAM ET */),
                                                  options:
                                                      FFButtonOptions(
                                                    width: buttonW,
                                                    height: buttonH,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                45.0,
                                                                12.0,
                                                                45.0,
                                                                12.0),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                                28.0),
                                                    color:
                                                        Colors.transparent,
                                                    textStyle:
                                                        const TextStyle(
                                                      fontFamily:
                                                          'Manrope',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0,
                                                      letterSpacing: 1.8,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  showLoadingIndicator:
                                                      false,
                                                ),
                                              ),
                                            ),
                                          ].addToEnd(const SizedBox(
                                              height: 80.0)),
                                        ),
                                      ),

                                      // ========== PAGE 3: Dog info form + merged info box ==========
                                      Form(
                                        key: _model.formKey1,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize:
                                                MainAxisSize.min,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 0.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              40.0,
                                                              10.0,
                                                              41.0,
                                                              10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                                  '0hfahpzw' /* Şimdi köpeğinizin sırası... */),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    GoogleFonts
                                                                            .manrope()
                                                                        .fontFamily,
                                                                color: const Color(
                                                                    0xFF858584),
                                                                fontSize:
                                                                    bodySize,
                                                                letterSpacing:
                                                                    0.2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(SizedBox(
                                                        width: gapMd)),
                                                  ),
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .dogNameInputModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TextInputWrapperWidget(
                                                  labelText:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText:
                                                        'Köpeğinizin İsmi',
                                                    enText:
                                                        'Name of Your Dog',
                                                  ),
                                                  isRequired: true,
                                                  isAutoFocus: true,
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
                                                        'Köpeğinizin Cinsi',
                                                    enText:
                                                        'Breed of Your Dog',
                                                  ),
                                                  dropdownTitle:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText:
                                                        'Köpeğinizin Cinsini Seçin',
                                                    enText:
                                                        'Select Breed of Your Dog',
                                                  ),
                                                  options:
                                                      FFAppState().DogTypes,
                                                  sheetTitle:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    trText:
                                                        'Köpeğinizin Cinsini Seçin',
                                                    enText:
                                                        'Select Kind of Your Dog',
                                                  ),
                                                  absorbing: false,
                                                  isRequired: true,
                                                  onValueChange:
                                                      (value) async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .dogBirthdateInputModel,
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
                                                    trText:
                                                        'Köpeğinizin Cinsiyeti',
                                                    enText:
                                                        'Sex of Your Dog',
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
                                                      FFAppState()
                                                          .DogGenders,
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
                                                  isRequired: true,
                                                  onValueChange:
                                                      (value) async {},
                                                ),
                                              ),

                                              // Dog avatar + merged info box
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 0.0),
                                                child: SizedBox(
                                                  width: square,
                                                  height: square,
                                                  child: Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -0.25),
                                                        child: ClipOval(
                                                          child: Container(
                                                            width: avatar,
                                                            height: avatar,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFFDEEE6),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xFFFABBA4),
                                                                width: 1.78,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Opacity(
                                                                  opacity:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    (_model.uploadedLocalFile2.bytes?.isEmpty ??
                                                                            true)
                                                                        ? 0.0
                                                                        : 1.0,
                                                                    1.0,
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100.0),
                                                                    child: Image
                                                                        .memory(
                                                                      _model.uploadedLocalFile2.bytes ??
                                                                          Uint8List(
                                                                              0),
                                                                      width:
                                                                          double.infinity,
                                                                      height:
                                                                          double.infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Opacity(
                                                                  opacity:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    (_model.uploadedLocalFile2.bytes?.isNotEmpty ??
                                                                            false)
                                                                        ? 0.0
                                                                        : 1.0,
                                                                    1.0,
                                                                  ),
                                                                  child:
                                                                      Center(
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                          context:
                                                                              context,
                                                                          allowPhoto:
                                                                              true,
                                                                        );
                                                                        if (selectedMedia != null &&
                                                                            selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                          safeSetState(() =>
                                                                              _model.isDataUploading2 = true);
                                                                          try {
                                                                            final files = selectedMedia
                                                                                .map((m) => FFUploadedFile(
                                                                                      name: m.storagePath.split('/').last,
                                                                                      bytes: m.bytes,
                                                                                      height: m.dimensions?.height,
                                                                                      width: m.dimensions?.width,
                                                                                      blurHash: m.blurHash,
                                                                                    ))
                                                                                .toList();
                                                                            if (files.length == selectedMedia.length) {
                                                                              _model.uploadedLocalFile2 = files.first;
                                                                            }
                                                                          } finally {
                                                                            safeSetState(() =>
                                                                                _model.isDataUploading2 = false);
                                                                          }
                                                                        }
                                                                      },
                                                                      text:
                                                                          '',
                                                                      icon: Icon(
                                                                          Icons
                                                                              .file_upload_outlined,
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                          size:
                                                                              76.0),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            double.infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        padding:
                                                                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                        color:
                                                                            const Color(0x00F25822),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      // MERGED bordered info box (Dog Name + Sex + Age)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.95),
                                                        child: LayoutBuilder(
                                                          builder:
                                                              (context, c) {
                                                            final cw =
                                                                c.maxWidth;
                                                            final boxW = (cw *
                                                                    0.62)
                                                                .clamp(
                                                                    180.0,
                                                                    300.0);
                                                            final boxH = (cw *
                                                                    0.34)
                                                                .clamp(
                                                                    110.0,
                                                                    150.0);
                                                            final isMale =
                                                                _model
                                                                        .dogGenderSelectDropdownModel
                                                                        .value
                                                                        ?.id ==
                                                                    1;
                                                            final ageText = ageYearsText(
                                                                functions.calculateAge(
                                                                    _model
                                                                        .dogBirthdateInputModel
                                                                        .value));
                                                            return Container(
                                                              width: boxW,
                                                              height: boxH,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          gapSm,
                                                                      vertical:
                                                                          gapSm),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xFFD8D8D8),
                                                                    width:
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                boxShadow:
                                                                    bottomLiftShadow(),
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  // Dog name
                                                                  Text(
                                                                    _model
                                                                        .dogNameInputModel
                                                                        .customInputTextController
                                                                        .text,
                                                                    maxLines:
                                                                        1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              GoogleFonts.manrope().fontFamily,
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              titleSize,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          gapSm),
                                                                  // Sex + Age row
                                                                  Wrap(
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .center,
                                                                    spacing:
                                                                        8,
                                                                    runSpacing:
                                                                        6,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Icon(
                                                                            isMale ? Icons.male : Icons.female_sharp,
                                                                            size: iconSize,
                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                          SizedBox(width: 4),
                                                                          Text(
                                                                            isMale ? 'Male' : 'Female',
                                                                            style: TextStyle(
                                                                              fontSize: smallSize,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: 1,
                                                                        height:
                                                                            iconSize - 2,
                                                                        color:
                                                                            const Color(0x7FF37C20),
                                                                      ),
                                                                      Text(
                                                                        ageText,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              smallSize,
                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              // Continue button
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0,
                                                            gapLg,
                                                            0.0,
                                                            0.0),
                                                child: Container(
                                                  width: buttonW,
                                                  height: buttonH,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.topLeft,
                                                      end: Alignment
                                                          .bottomRight,
                                                      colors: [
                                                        Color(0xFFF79E7F),
                                                        Color(0xFFF25822),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28.0),
                                                  ),
                                                  child: FFButtonWidget(
                                                    onPressed:
                                                        () async {
                                                      if ((_model
                                                                  .uploadedLocalFile2
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false)) {
                                                        // Store user info
                                                        FFAppState()
                                                                .RegisteringUser =
                                                            UserStruct(
                                                          firstName: _model
                                                              .nameInputModel
                                                              .customInputTextController
                                                              .text,
                                                          lastName: _model
                                                              .surnameInputModel
                                                              .customInputTextController
                                                              .text,
                                                          username: _model
                                                              .usernameWrapperModel
                                                              .customInputTextController
                                                              .text,
                                                          email: _model
                                                              .emailWrapperModel
                                                              .customInputTextController
                                                              .text,
                                                          phoneNumber: _model
                                                              .phoneInputModel
                                                              .customInputTextController
                                                              .text,
                                                          userGender: _model
                                                              .genderSelectDropdownModel
                                                              .value
                                                              ?.id
                                                              .toString(),
                                                          address: _model
                                                              .addressInputModel
                                                              .customInputTextController
                                                              .text,
                                                          city: _model
                                                              .citySelectDropdownModel
                                                              .value,
                                                          country: _model
                                                              .countrySelectDropdownModel
                                                              .value,
                                                          dateBirth: _model
                                                              .birthdateInputModel
                                                              .value,
                                                        );
                                                        FFAppState()
                                                                .RegisteringUserPrimaryDog =
                                                            DogRelationTypeStruct(
                                                          action: 'store',
                                                          key: 'dogs',
                                                          title: _model
                                                              .dogNameInputModel
                                                              .customInputTextController
                                                              .text,
                                                          dogType: _model
                                                              .dogKindSelectDropdownModel
                                                              .value,
                                                          gender: _model
                                                              .dogGenderSelectDropdownModel
                                                              .value
                                                              ?.id,
                                                          birthDate: _model
                                                              .dogBirthdateInputModel
                                                              .value,
                                                        );
                                                        FFAppState()
                                                            .update(() {});

                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder:
                                                              (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () {
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
                                                                      SizedBox(
                                                                    height: MediaQuery.sizeOf(context)
                                                                        .height,
                                                                    child:
                                                                        RegisterDoneSheetWidget(
                                                                      userAvatar:
                                                                          _model.uploadedLocalFile1,
                                                                      primaryDog:
                                                                          FFAppState().RegisteringUserPrimaryDog,
                                                                      primaryDogAvatar:
                                                                          _model.uploadedLocalFile2,
                                                                      password:
                                                                          _model.passwordInputModel.customInputTextController.text,
                                                                      passwordConfirmation:
                                                                          _model.repeatPasswordInputModel.customInputTextController.text,
                                                                      dogs:
                                                                          _model.dogs,
                                                                      dogAvatars:
                                                                          _model.dogAvatars,
                                                                      onAddDog:
                                                                          (dog, dogAvatar) async {
                                                                        _model.addToDogs(
                                                                            dog);
                                                                        _model.addToDogAvatars(
                                                                            dogAvatar);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((_) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                trText:
                                                                    'Köpek Profil Resmi Zorunludur',
                                                                enText:
                                                                    'Dog Profile Photo Is Required',
                                                              ),
                                                              style:
                                                                  const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    text:
                                                        FFLocalizations.of(context).getText('t4tawj7h' /* DEVAM ET */),
                                                    options:
                                                        FFButtonOptions(
                                                      width: buttonW,
                                                      height: buttonH,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  45.0,
                                                                  12.0,
                                                                  45.0,
                                                                  12.0),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  28.0),
                                                      color:
                                                          Colors.transparent,
                                                      textStyle:
                                                          const TextStyle(
                                                        fontFamily:
                                                            'Manrope',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                        letterSpacing: 1.8,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(
                                                height: gapMd)).addToEnd(
                                                const SizedBox(
                                                    height: 80.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: gapMd)),
                      ),
                    ),
                  ),
                ),
              ),
              if (_model.loading == true)
                wrapWithModel(
                  model: _model.loadingViewModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const LoadingViewWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
