import '/backend/api_requests/api_calls.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/components/modals/password_changed_modal/password_changed_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'change_password_screen_model.dart';
export 'change_password_screen_model.dart';

class ChangePasswordScreenWidget extends StatefulWidget {
  const ChangePasswordScreenWidget({super.key});

  static String routeName = 'ChangePasswordScreen';
  static String routePath = 'changePasswordScreen';

  @override
  State<ChangePasswordScreenWidget> createState() =>
      _ChangePasswordScreenWidgetState();
}

class _ChangePasswordScreenWidgetState
    extends State<ChangePasswordScreenWidget> {
  late ChangePasswordScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF7DED0),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(39.0, 48.0, 39.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).secondary,
                    borderRadius: 14.0,
                    buttonSize: 49.0,
                    fillColor: Color(0x00F25822),
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 32.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
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
                  Container(
                    width: 49.0,
                    height: 49.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              FFLocalizations.of(context).getVariableText(
                trText: 'Şifre Değiştir',
                enText: 'Change Password',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFBE98),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                37.0, 0.0, 24.0, 0.0),
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
                                    FFLocalizations.of(context).getVariableText(
                                      trText:
                                          'Eğer şifrenizi hatırlamıyorsanız, Şifremi Unuttum kısmını deneyin',
                                      enText:
                                          'If you don\'t remember your current password, Try Forgot Password',
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
                                              .primary,
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
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.currentPasswordModel,
                                updateCallback: () => safeSetState(() {}),
                                child: EmailWrapperWidget(
                                  labelText: FFLocalizations.of(context)
                                      .getVariableText(
                                    trText: 'Mevcut Şifre',
                                    enText: 'Current Password',
                                  ),
                                  isRequired: true,
                                  isAutoFocus: true,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.newPasswordModel,
                                updateCallback: () => safeSetState(() {}),
                                child: EmailWrapperWidget(
                                  labelText: FFLocalizations.of(context)
                                      .getVariableText(
                                    trText: 'Yeni Şifre',
                                    enText: 'New Password',
                                  ),
                                  isRequired: true,
                                  isAutoFocus: false,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.repeatPasswordModel,
                                updateCallback: () => safeSetState(() {}),
                                child: EmailWrapperWidget(
                                  labelText: FFLocalizations.of(context)
                                      .getVariableText(
                                    trText: 'Yeni Şifre Tekrarı',
                                    enText: 'Repeat New Password',
                                  ),
                                  isRequired: true,
                                  isAutoFocus: false,
                                ),
                              ),
                            ].divide(SizedBox(height: 19.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                                ForgotPasswordSettingsScreenWidget.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/forgot-password.svg',
                                  width: 19.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'c6jfxy60' /* Şifremi Unuttum */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.newPasswordModel
                                          .customInputTextController.text ==
                                      _model.repeatPasswordModel
                                          .customInputTextController.text
                                  ? true
                                  : false) {
                                _model.apiResultwuw =
                                    await ProfileGroup.changePasswordCall.call(
                                  oldPassword: _model.currentPasswordModel
                                      .customInputTextController.text,
                                  password: _model.newPasswordModel
                                      .customInputTextController.text,
                                  passwordConfirmation: _model
                                      .repeatPasswordModel
                                      .customInputTextController
                                      .text,
                                );

                                if ((_model.apiResultwuw?.succeeded ?? true)) {
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
                                            child: PasswordChangedModalWidget(
                                              userName: '',
                                              action: '',
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
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
                                            child: ErrorSheetWidget(
                                              errorMessage: getJsonField(
                                                (_model.apiResultwuw
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
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
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ErrorSheetWidget(
                                            errorMessage:
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              trText:
                                                  'Yeni Şifre ve Yeni Şifre Tekrarı uyuşmalıdır',
                                              enText:
                                                  'New Password and New Password Repeat must match',
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
                            text: FFLocalizations.of(context).getVariableText(
                              trText: 'DEVAM ET',
                              enText: 'CONTINUE',
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  60.0, 12.0, 60.0, 12.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 38.0))
                          .around(SizedBox(height: 38.0)),
                    ),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 34.0)),
        ),
      ),
    );
  }
}
