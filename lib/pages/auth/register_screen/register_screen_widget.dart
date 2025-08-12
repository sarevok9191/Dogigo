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

  // local page index (we don’t mutate the model for this)
  int _pageIndex = 0;

  // helper so every clamp returns a double
  double clampD(num v, double min, double max) => v.clamp(min, max).toDouble();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterScreenModel());

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

  // bottom-lift shadow instead of elevation
  List<BoxShadow> bottomLiftShadow(BuildContext context) => [
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

  String _sexLabelFromGenderId(int? id) => (id == 1) ? 'Male' : 'Female';
  String _userSexLabel() {
    final g = FFAppState().RegisteringUser.userGender;
    if (g == '1') return 'Male';
    if (g == '0') return 'Female';
    if ((g ?? '').toLowerCase().contains('male')) return 'Male';
    if ((g ?? '').toLowerCase().contains('female')) return 'Female';
    final id = _model.genderSelectDropdownModel.value?.id;
    return _sexLabelFromGenderId(id);
  }

  String _yearsOld(String? years) {
    if (years == null || years.isEmpty) return '';
    return '$years years old';
  }

  String _pageHeader(BuildContext context) {
    switch (_pageIndex) {
      case 0:
        return FFLocalizations.of(context)
            .getVariableText(trText: 'Hesap Oluştur', enText: 'Sign Up');
      case 1:
        return FFLocalizations.of(context)
            .getVariableText(trText: 'Fotoğrafını Yükle', enText: 'Upload Your Picture');
      case 2:
        return FFLocalizations.of(context)
            .getVariableText(trText: 'Bize Köpeğini Anlat', enText: 'Tell Us About Your Dog');
      case 3:
        return FFLocalizations.of(context)
            .getVariableText(trText: 'Köpeğinin Fotoğrafını Yükle', enText: 'Upload Your Dog Picture');
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final size = MediaQuery.sizeOf(context);
    final w = size.width;
    final h = size.height;

    // spacing & type
    final double hPad = clampD(w * 0.06, 16, 28);
    final double avatar = clampD(w * 0.38, 140, 190);
    final double buttonW = clampD(w - 2 * hPad, 280, 560);
    final double buttonH = clampD(w * 0.14, 52, 56);
    final double indicatorH = clampD(w * 0.08, 22, 30);

    final double gapXs = clampD(w * 0.02, 8, 12);
    final double gapSm = clampD(w * 0.03, 12, 16);
    final double gapMd = clampD(w * 0.05, 20, 28);
    final double gapLg = clampD(h * 0.06, 36, 56);

    final double h1Size = clampD(w * 0.065, 22, 28);
    final double titleSize = clampD(w * 0.06, 18, 24);
    final double bodySize = clampD(w * 0.04, 13, 16);
    final double smallSize = clampD(w * 0.035, 12, 14);
    final double iconSize = clampD(w * 0.05, 18, 22);

    // info card width (grows until max)
    final double infoMinW = clampD(w * 0.58, 220, 300);
    final double infoMaxW = clampD(w * 0.82, 280, 360);

    // NEW: consistent min height & vertical padding for info cards
    final double infoCardMinH = clampD(h * 0.08, 120, 180);
    final double infoCardPadV = clampD(w * 0.05, 18, 24);

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
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(hPad, 48.0, hPad, 0.0),
                  child: Column(
                    children: [
                      // progress indicator
                      SizedBox(
                        height: indicatorH,
                        child: Center(
                          child: SizedBox(
                            width: w,
                            height: indicatorH,
                            child: custom_widgets.CustomRegisterIndicator(
                              width: w,
                              height: indicatorH,
                              index: _pageIndex,
                              pageCount: 4,
                            ),
                          ),
                        ),
                      ),

                      // dynamic page header
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          _pageHeader(context),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                color: Colors.black,
                                fontSize: h1Size,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),

                      // ======= Pages =======
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (p) => setState(() => _pageIndex = p),
                          children: [
                            // ================= PAGE 1: USER INFO FORM =================
                            Form(
                              key: _model.formKey2,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, gapXs, 0, gapSm),
                                      child: Text(
                                        FFLocalizations.of(context).getText('i7wkq3ob'),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: GoogleFonts.manrope().fontFamily,
                                              color: const Color(0xFF858584),
                                              fontSize: bodySize,
                                              letterSpacing: 0.2,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.nameInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TextInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'İsim',
                                          enText: 'Name',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: true,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.surnameInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TextInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Soyisim',
                                          enText: 'Surname',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.phoneInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: PhoneInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Telefon Numarası',
                                          enText: 'Phone Number',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.emailWrapperModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: EmailWrapperWidget(
                                        labelText:
                                            FFLocalizations.of(context).getText('65s7t44h' /* E-posta */),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.usernameWrapperModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: EmailWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Kullanıcı Adı',
                                          enText: 'Username',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.passwordInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: PasswordInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Şifre',
                                          enText: 'Password',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.repeatPasswordInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: PasswordInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Şifre Tekrarı',
                                          enText: 'Repeat Password',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.birthdateInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: DateInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
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
                                      model: _model.genderSelectDropdownModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SelectDropdownWidget(
                                        labelTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Cinsiyet',
                                          enText: 'Sex',
                                        ),
                                        dropdownTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Cinsiyetinizi Seçin',
                                          enText: 'Select Your Sex',
                                        ),
                                        options: FFAppState().Genders,
                                        sheetTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Cinsiyetinizi Seçin',
                                          enText: 'Select Your Sex',
                                        ),
                                        absorbing: false,
                                        isRequired: true,
                                        onValueChange: (value) async {},
                                      ),
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: _model.countriesList(
                                        requestFn: () => StaticValuesGroup.getCountriesCall.call(),
                                      ),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: SpinKitPumpingHeart(
                                                color: FlutterFlowTheme.of(context).primary,
                                                size: 20,
                                              ),
                                            ),
                                          );
                                        }
                                        return wrapWithModel(
                                          model: _model.countrySelectDropdownModel,
                                          updateCallback: () => safeSetState(() {}),
                                          child: SelectDropdownWidget(
                                            labelTitle: FFLocalizations.of(context).getVariableText(
                                              trText: 'Ülke',
                                              enText: 'Country',
                                            ),
                                            dropdownTitle: FFLocalizations.of(context).getVariableText(
                                              trText: 'Ülke Seçin',
                                              enText: 'Select Country',
                                            ),
                                            options: _model.countries,
                                            sheetTitle: FFLocalizations.of(context).getVariableText(
                                              trText: 'Ülke Seçin',
                                              enText: 'Select Country',
                                            ),
                                            absorbing: false,
                                            isRequired: true,
                                            onValueChange: (value) async {
                                              _model.citiesRepsonse =
                                                  await StaticValuesGroup.getCitiesCall.call(
                                                countryId: value?.id,
                                              );
                                              if ((_model.citiesRepsonse?.succeeded ?? true)) {
                                                _model.cities = (getJsonField(
                                                  (_model.citiesRepsonse?.jsonBody ?? ''),
                                                  r'''$.records''',
                                                  true,
                                                )!
                                                        .toList()
                                                        .map<SelectableOptionTypeStruct?>(
                                                            SelectableOptionTypeStruct.maybeFromMap)
                                                        .toList()
                                                    as Iterable<SelectableOptionTypeStruct?>)
                                                    .withoutNulls
                                                    .toList()
                                                    .cast<SelectableOptionTypeStruct>();
                                                safeSetState(() {});
                                              }
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    wrapWithModel(
                                      model: _model.citySelectDropdownModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SelectDropdownWidget(
                                        labelTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Şehir',
                                          enText: 'City',
                                        ),
                                        dropdownTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Şehir Seçin',
                                          enText: 'Select City',
                                        ),
                                        options: _model.cities,
                                        sheetTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Şehir Seçin',
                                          enText: 'Select City',
                                        ),
                                        absorbing: _model.countrySelectDropdownModel.value == null,
                                        isRequired: true,
                                        onValueChange: (value) async {},
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.addressInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TextAreaWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Adres',
                                          enText: 'Address',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    // agreement
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: const CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context).alternate,
                                      ),
                                      child: CheckboxListTile(
                                        value: _model.checkboxListTileValue ?? false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model.checkboxListTileValue = newValue ?? false);
                                          if (newValue == true) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return const WebViewAware(
                                                  child: WebViewModalWidget(),
                                                );
                                              },
                                            );
                                          }
                                        },
                                        title: RichText(
                                          text: TextSpan(
                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                  fontFamily: GoogleFonts.manrope().fontFamily,
                                                  letterSpacing: 0.0,
                                                  fontSize: bodySize,
                                                  color: Colors.black,
                                                ),
                                            children: const [
                                              TextSpan(text: 'Kullanıcı Sözleşmesi ve'),
                                              TextSpan(
                                                text: ' Gizlilik',
                                                style: TextStyle(color: Color(0xFFF79E7F)),
                                              ),
                                              TextSpan(text: '  metnini okudum ve kabul ediyorum.'),
                                            ],
                                          ),
                                        ),
                                        activeColor: FlutterFlowTheme.of(context).primary,
                                        checkColor: FlutterFlowTheme.of(context).info,
                                        controlAffinity: ListTileControlAffinity.leading,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    // Continue
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, gapSm, 0, 0),
                                      child: Container(
                                        width: buttonW,
                                        height: buttonH,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xFFF79E7F),
                                              Color(0xFFF25822),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(28),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.checkboxListTileValue == false) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFLocalizations.of(context).getVariableText(
                                                      trText:
                                                          'Kullanıcı Sözleşmesini kabul etmeniz gerekmektedir.',
                                                      enText: 'You must accept the User Agreement.',
                                                    ),
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            if ((_model.birthdateInputModel.value == null) ||
                                                (_model.nameInputModel.customInputTextController.text == '') ||
                                                (_model.surnameInputModel.customInputTextController.text == '') ||
                                                (_model.phoneInputModel.customInputTextController.text == '') ||
                                                (_model.emailWrapperModel.customInputTextController.text == '') ||
                                                (_model.usernameWrapperModel.customInputTextController.text == '') ||
                                                (_model.passwordInputModel.customInputTextController.text == '') ||
                                                (_model.repeatPasswordInputModel.customInputTextController.text == '')) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFLocalizations.of(context).getVariableText(
                                                      trText: 'Lütfen zorunlu alanları doldurunuz.',
                                                      enText: 'Please fill the required fields',
                                                    ),
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            if (_model.birthdateInputModel.value! >= getCurrentTimestamp) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFLocalizations.of(context).getVariableText(
                                                      trText: 'Lütfen zorunlu alanları doldurunuz.',
                                                      enText: 'Please fill the required fields',
                                                    ),
                                                  ),
                                                ),
                                              );
                                              return;
                                            }

                                            _model.checkRegisterResponse =
                                                await AuthenticationGroup.checkRegisterUniqueCall.call(
                                              email: _model.emailWrapperModel.customInputTextController.text,
                                              username:
                                                  _model.usernameWrapperModel.customInputTextController.text,
                                              dateBirth:
                                                  _model.birthdateInputModel.value?.toString(),
                                              password:
                                                  _model.passwordInputModel.customInputTextController.text,
                                              passwordConfirmation: _model
                                                  .repeatPasswordInputModel.customInputTextController.text,
                                            );

                                            if (!(_model.checkRegisterResponse?.succeeded ?? true)) {
                                              if ((_model.checkRegisterResponse?.statusCode ?? 200) == 422) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      functions.getValidationErrorMessages(
                                                        (_model.checkRegisterResponse?.jsonBody ?? ''),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      FFLocalizations.of(context).getVariableText(
                                                        trText:
                                                            'Bir Hata Oluştu! Lütfen daha sonra tekrar deneyin',
                                                        enText:
                                                            'An Error Occurred! Please try again later.',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              return;
                                            }

                                            if (_model.formKey2.currentState == null ||
                                                !_model.formKey2.currentState!.validate()) {
                                              return;
                                            }
                                            if (_model.passwordInputModel.customInputTextController.text !=
                                                _model.repeatPasswordInputModel.customInputTextController.text) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFLocalizations.of(context).getVariableText(
                                                      trText: 'Şifre tekrarı eşleşmiyor',
                                                      enText: 'Password Confirmation Doesnt Match',
                                                    ),
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            await _model.pageViewController?.nextPage(
                                              duration: const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: FFLocalizations.of(context).getText('5gsud5z1' /* DEVAM ET */),
                                          options: FFButtonOptions(
                                            height: buttonH,
                                            color: Colors.transparent,
                                            textStyle: const TextStyle(
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              letterSpacing: 1.8,
                                              color: Colors.white,
                                            ),
                                            elevation: 0,
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: gapSm)).addToEnd(const SizedBox(height: 80)),
                                ),
                              ),
                            ),

                            // ================= PAGE 2: USER AVATAR + INFO CARD =================
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: gapMd),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getVariableText(
                                        trText:
                                            'Buraya bir fotoğraf yükleyin. İnsanlar bu sevimliliği görecek.',
                                        enText:
                                            'Upload a picture here. People will see this cuteness.',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.manrope(
                                        fontSize: bodySize,
                                        fontWeight: FontWeight.w500,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: gapMd),

                                  // Avatar circle
                                  ClipOval(
                                    child: Container(
                                      width: avatar,
                                      height: avatar,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFDEEE6),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFFFABBA4),
                                          width: 1.78,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Opacity(
                                            opacity: valueOrDefault<double>(
                                              (_model.uploadedLocalFile1.bytes?.isEmpty ?? true) ? 0.0 : 1.0,
                                              0.0,
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.memory(
                                                _model.uploadedLocalFile1.bytes ?? Uint8List(0),
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Opacity(
                                            opacity: valueOrDefault<double>(
                                              (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false) ? 0.0 : 1.0,
                                              1.0,
                                            ),
                                            child: Center(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(m.storagePath, context))) {
                                                    safeSetState(
                                                        () => _model.isDataUploading1 = true);
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
                                                        _model.uploadedLocalFile1 = files.first;
                                                      }
                                                    } finally {
                                                      safeSetState(
                                                          () => _model.isDataUploading1 = false);
                                                    }
                                                  }
                                                },
                                                text: '',
                                                icon: const Icon(
                                                  Icons.person_outline_sharp,
                                                  color: Color(0xFFFFA573),
                                                  size: 76,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  color: const Color(0x03F25822),
                                                  elevation: 0,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // caption under avatar
                                  SizedBox(height: gapSm),
                                  Text(
                                    FFLocalizations.of(context).getVariableText(
                                      trText: 'Profil fotoğrafınızı yükleyin',
                                      enText: 'Upload your profile picture',
                                    ),
                                    style: GoogleFonts.manrope(
                                      fontSize: smallSize + 2,
                                      fontWeight: FontWeight.w700,
                                      color: FlutterFlowTheme.of(context).secondary,
                                    ),
                                  ),

                                  // USER INFO CARD (taller + centered)
                                  SizedBox(height: gapLg),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minWidth: infoMinW,
                                        maxWidth: infoMaxW,
                                      ),
                                      child: IntrinsicWidth(
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: infoCardMinH,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: gapSm,
                                            vertical: infoCardPadV,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color(0xFFEAEAEA),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: bottomLiftShadow(context),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                _model
                                                    .nameInputModel
                                                    .customInputTextController
                                                    .text,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.manrope(
                                                  fontSize: titleSize,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: gapXs),
                                              Wrap(
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                alignment: WrapAlignment.center,
                                                spacing: 10,
                                                runSpacing: 6,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        (_model.genderSelectDropdownModel.value?.id == 1)
                                                            ? Icons.male
                                                            : Icons.female_sharp,
                                                        size: iconSize,
                                                        color:
                                                            FlutterFlowTheme.of(context).secondary,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        _userSexLabel(),
                                                        style: GoogleFonts.manrope(
                                                          fontSize: smallSize,
                                                          fontWeight: FontWeight.w600,
                                                          color: FlutterFlowTheme.of(context).secondary,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: iconSize - 2,
                                                    color: const Color(0x7FF37C20),
                                                  ),
                                                  Text(
                                                    _yearsOld(functions
                                                        .calculateAge(_model.birthdateInputModel.value)),
                                                    style: GoogleFonts.manrope(
                                                      fontSize: smallSize,
                                                      fontWeight: FontWeight.w600,
                                                      color:
                                                          FlutterFlowTheme.of(context).secondary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Continue
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, gapLg, 0, 0),
                                    child: Container(
                                      width: buttonW,
                                      height: buttonH,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFF79E7F),
                                            Color(0xFFF25822),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if ((_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false)) {
                                            await _model.pageViewController?.nextPage(
                                              duration: const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  FFLocalizations.of(context).getVariableText(
                                                    trText: 'Profil fotoğrafı zorunludur..!',
                                                    enText: 'Profile Photo Is Required!',
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        text: FFLocalizations.of(context).getText('6b1a299c' /* DEVAM ET */),
                                        options: FFButtonOptions(
                                          width: buttonW,
                                          height: buttonH,
                                          color: Colors.transparent,
                                          textStyle: const TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 1.8,
                                            color: Colors.white,
                                          ),
                                          elevation: 0,
                                          borderRadius: BorderRadius.circular(28),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 80),
                                ],
                              ),
                            ),

                            // ================= PAGE 3: DOG INFO FORM =================
                            Form(
                              key: _model.formKey1,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, gapXs, 0, gapSm),
                                      child: Text(
                                        FFLocalizations.of(context).getText('0hfahpzw'),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              fontFamily: GoogleFonts.manrope().fontFamily,
                                              color: const Color(0xFF858584),
                                              fontSize: bodySize,
                                              letterSpacing: 0.2,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.dogNameInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TextInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Köpeğinizin İsmi',
                                          enText: 'Name of Your Dog',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: true,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.dogKindSelectDropdownModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SelectDropdownWidget(
                                        labelTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Köpeğinizin Cinsi',
                                          enText: 'Breed of Your Dog',
                                        ),
                                        dropdownTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Köpeğinizin Cinsini Seçin',
                                          enText: 'Select Breed of Your Dog',
                                        ),
                                        options: FFAppState().DogTypes,
                                        sheetTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Köpeğinizin Cinsini Seçin',
                                          enText: 'Select Kind of Your Dog',
                                        ),
                                        absorbing: false,
                                        isRequired: true,
                                        onValueChange: (value) async {},
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.dogBirthdateInputModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: DateInputWrapperWidget(
                                        labelText: FFLocalizations.of(context).getVariableText(
                                          trText: 'Doğum Tarihi',
                                          enText: 'Birth Date',
                                        ),
                                        isRequired: true,
                                        isAutoFocus: false,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.dogGenderSelectDropdownModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SelectDropdownWidget(
                                        labelTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Köpeğinizin Cinsiyeti',
                                          enText: 'Sex of Your Dog',
                                        ),
                                        dropdownTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Köpeğinizin Cinsiyetini Seçin',
                                          enText: 'Select Sex of Your Dog',
                                        ),
                                        options: FFAppState().DogGenders,
                                        sheetTitle: FFLocalizations.of(context).getVariableText(
                                          trText: 'Köpeğinizin Cinsiyetini Seçin',
                                          enText: 'Select Sex of Your Dog',
                                        ),
                                        absorbing: false,
                                        isRequired: true,
                                        onValueChange: (value) async {},
                                      ),
                                    ),

                                    // Continue to dog photo page
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, gapLg, 0, 0),
                                      child: Container(
                                        width: buttonW,
                                        height: buttonH,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFF79E7F),
                                              Color(0xFFF25822),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(28),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if ((_model.dogNameInputModel
                                                        .customInputTextController.text ==
                                                    '') ||
                                                (_model.dogBirthdateInputModel.value == null) ||
                                                (_model.dogGenderSelectDropdownModel.value == null) ||
                                                (_model.dogKindSelectDropdownModel.value == null)) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFLocalizations.of(context).getVariableText(
                                                      trText: 'Lütfen Zorunlu Alanları Doldurunuz',
                                                      enText: 'Please fill the required fields',
                                                    ),
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            if (_model.formKey1.currentState == null ||
                                                !_model.formKey1.currentState!.validate()) {
                                              return;
                                            }
                                            await _model.pageViewController?.nextPage(
                                              duration: const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: FFLocalizations.of(context).getText('tk3h5rh2' /* DEVAM ET */),
                                          options: FFButtonOptions(
                                            width: buttonW,
                                            height: buttonH,
                                            color: Colors.transparent,
                                            textStyle: const TextStyle(
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              letterSpacing: 1.8,
                                              color: Colors.white,
                                            ),
                                            elevation: 0,
                                            borderRadius: BorderRadius.circular(28),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 80),
                                  ].divide(SizedBox(height: gapSm)),
                                ),
                              ),
                            ),

                            // ================= PAGE 4: DOG AVATAR + INFO CARD =================
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: gapMd),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      FFLocalizations.of(context).getVariableText(
                                        trText:
                                            'Köpeğinizin fotoğrafını buraya yükleyin. İnsanlar bu sevimliliği görecek.',
                                        enText:
                                            'Upload a picture of your dog here. People will see this cuteness.',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.manrope(
                                        fontSize: bodySize,
                                        fontWeight: FontWeight.w500,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: gapMd),

                                  // Dog avatar circle
                                  ClipOval(
                                    child: Container(
                                      width: avatar,
                                      height: avatar,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFDEEE6),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFFFABBA4),
                                          width: 1.78,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Opacity(
                                            opacity: valueOrDefault<double>(
                                              (_model.uploadedLocalFile2.bytes?.isEmpty ?? true) ? 0.0 : 1.0,
                                              1.0,
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.memory(
                                                _model.uploadedLocalFile2.bytes ?? Uint8List(0),
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Opacity(
                                            opacity: valueOrDefault<double>(
                                              (_model.uploadedLocalFile2.bytes?.isNotEmpty ?? false) ? 0.0 : 1.0,
                                              1.0,
                                            ),
                                            child: Center(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(m.storagePath, context))) {
                                                    safeSetState(
                                                        () => _model.isDataUploading2 = true);
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
                                                      safeSetState(
                                                          () => _model.isDataUploading2 = false);
                                                    }
                                                  }
                                                },
                                                text: '',
                                                icon: Icon(
                                                  Icons.pets_outlined,
                                                  color: FlutterFlowTheme.of(context).primary,
                                                  size: 76,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  color: const Color(0x00F25822),
                                                  elevation: 0,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // caption under avatar
                                  SizedBox(height: gapSm),
                                  Text(
                                    FFLocalizations.of(context).getVariableText(
                                      trText: 'Köpeğinizin profil fotoğrafını yükleyin',
                                      enText: 'Upload your dog profile picture',
                                    ),
                                    style: GoogleFonts.manrope(
                                      fontSize: smallSize + 2,
                                      fontWeight: FontWeight.w700,
                                      color: FlutterFlowTheme.of(context).secondary,
                                    ),
                                  ),

                                  // DOG INFO CARD (taller + centered)
                                  SizedBox(height: gapLg),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minWidth: infoMinW,
                                        maxWidth: infoMaxW,
                                      ),
                                      child: IntrinsicWidth(
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: infoCardMinH,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: gapSm,
                                            vertical: infoCardPadV,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color(0xFFEAEAEA),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: bottomLiftShadow(context),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                _model
                                                    .dogNameInputModel
                                                    .customInputTextController
                                                    .text,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.manrope(
                                                  fontSize: titleSize,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: gapXs),
                                              Wrap(
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                alignment: WrapAlignment.center,
                                                spacing: 10,
                                                runSpacing: 6,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        (_model.dogGenderSelectDropdownModel.value?.id == 1)
                                                            ? Icons.male
                                                            : Icons.female_sharp,
                                                        size: iconSize,
                                                        color:
                                                            FlutterFlowTheme.of(context).secondary,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        (_model.dogGenderSelectDropdownModel.value?.id == 1)
                                                            ? 'Male'
                                                            : 'Female',
                                                        style: GoogleFonts.manrope(
                                                          fontSize: smallSize,
                                                          fontWeight: FontWeight.w600,
                                                          color: FlutterFlowTheme.of(context).secondary,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: iconSize - 2,
                                                    color: const Color(0x7FF37C20),
                                                  ),
                                                  Text(
                                                    _yearsOld(functions
                                                        .calculateAge(_model.dogBirthdateInputModel.value)),
                                                    style: GoogleFonts.manrope(
                                                      fontSize: smallSize,
                                                      fontWeight: FontWeight.w600,
                                                      color:
                                                          FlutterFlowTheme.of(context).secondary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Continue → Done sheet
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, gapLg, 0, 0),
                                    child: Container(
                                      width: buttonW,
                                      height: buttonH,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFF79E7F),
                                            Color(0xFFF25822),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (!(_model.uploadedLocalFile2.bytes?.isNotEmpty ?? false)) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  FFLocalizations.of(context).getVariableText(
                                                    trText: 'Köpek Profil Resmi Zorunludur',
                                                    enText: 'Dog Profile Photo Is Required',
                                                  ),
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          // Persist state
                                          FFAppState().RegisteringUser = UserStruct(
                                            firstName: _model
                                                .nameInputModel.customInputTextController.text,
                                            lastName: _model
                                                .surnameInputModel.customInputTextController.text,
                                            username: _model
                                                .usernameWrapperModel.customInputTextController.text,
                                            email: _model
                                                .emailWrapperModel.customInputTextController.text,
                                            phoneNumber: _model
                                                .phoneInputModel.customInputTextController.text,
                                            userGender: _model
                                                .genderSelectDropdownModel.value?.id
                                                .toString(),
                                            address: _model
                                                .addressInputModel.customInputTextController.text,
                                            city: _model.citySelectDropdownModel.value,
                                            country: _model.countrySelectDropdownModel.value,
                                            dateBirth: _model.birthdateInputModel.value,
                                          );

                                          FFAppState().RegisteringUserPrimaryDog =
                                              DogRelationTypeStruct(
                                            action: 'store',
                                            key: 'dogs',
                                            title: _model
                                                .dogNameInputModel.customInputTextController.text,
                                            dogType: _model
                                                .dogKindSelectDropdownModel.value,
                                            gender: _model
                                                .dogGenderSelectDropdownModel.value?.id,
                                            birthDate:
                                                _model.dogBirthdateInputModel.value,
                                          );

                                          FFAppState().update(() {});

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
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(context).height,
                                                      child: RegisterDoneSheetWidget(
                                                        userAvatar:
                                                            _model.uploadedLocalFile1,
                                                        primaryDog: FFAppState()
                                                            .RegisteringUserPrimaryDog,
                                                        primaryDogAvatar:
                                                            _model.uploadedLocalFile2,
                                                        password: _model
                                                            .passwordInputModel
                                                            .customInputTextController.text,
                                                        passwordConfirmation: _model
                                                            .repeatPasswordInputModel
                                                            .customInputTextController.text,
                                                        dogs: _model.dogs,
                                                        dogAvatars: _model.dogAvatars,
                                                        onAddDog: (dog, dogAvatar) async {
                                                          _model.addToDogs(dog);
                                                          _model.addToDogAvatars(dogAvatar);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((_) => safeSetState(() {}));
                                        },
                                        text: FFLocalizations.of(context).getText('t4tawj7h' /* DEVAM ET */),
                                        options: FFButtonOptions(
                                          width: buttonW,
                                          height: buttonH,
                                          color: Colors.transparent,
                                          textStyle: const TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 1.8,
                                            color: Colors.white,
                                          ),
                                          elevation: 0,
                                          borderRadius: BorderRadius.circular(28),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 80),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: gapSm)),
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
