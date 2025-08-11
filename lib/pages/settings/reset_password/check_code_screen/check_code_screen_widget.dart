import '/backend/api_requests/api_calls.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'check_code_screen_model.dart';
export 'check_code_screen_model.dart';

class CheckCodeScreenWidget extends StatefulWidget {
  const CheckCodeScreenWidget({
    super.key,
    required this.token,
  });

  final String? token;

  static String routeName = 'CheckCodeScreen';
  static String routePath = 'checkCodeScreen';

  @override
  State<CheckCodeScreenWidget> createState() => _CheckCodeScreenWidgetState();
}

class _CheckCodeScreenWidgetState extends State<CheckCodeScreenWidget> {
  late CheckCodeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckCodeScreenModel());
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
          mainAxisAlignment: MainAxisAlignment.start,
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
                trText: 'Şifremi Unuttum',
                enText: 'Forgot Password',
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
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7DED0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/settings-bottom-bg.svg',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x42F37C20),
                            Color(0x68F37C20),
                            Color(0x96F37C20),
                            Color(0xBCF37C20),
                            Color(0xECF44336)
                          ],
                          stops: [1.0, 1.0, 1.0, 1.0, 1.0],
                          begin: AlignmentDirectional(0.0, 1.0),
                          end: AlignmentDirectional(0, -1.0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            35.0, 0.0, 35.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 39.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          37.0, 0.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/register-dog-icon.svg',
                                              width: 26.0,
                                              height: 38.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                trText:
                                                    'Mailinize gelen kodu giriniz',
                                                enText:
                                                    'Enter the code you recieved via your e-mail to renew the password.',
                                              ),
                                              textAlign: TextAlign.start,
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
                                                        .primary,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.2,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
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
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.newPasswordModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: EmailWrapperWidget(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              trText: 'Kod',
                                              enText: 'Code',
                                            ),
                                            isRequired: true,
                                            isAutoFocus: true,
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 19.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 38.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 42.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  _model.apiResultksb =
                                      await AuthenticationGroup
                                          .checkResetCodeCall
                                          .call(
                                    token: widget.token,
                                    code: _model.newPasswordModel
                                        .customInputTextController.text,
                                  );

                                  if ((_model.apiResultksb?.succeeded ??
                                      true)) {
                                    context.pushNamed(
                                      NewPasswordSettingsScreenWidget.routeName,
                                      queryParameters: {
                                        'token': serializeParam(
                                          widget.token,
                                          ParamType.String,
                                        ),
                                        'code': serializeParam(
                                          _model.newPasswordModel
                                              .customInputTextController.text,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
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
                                                errorMessage:
                                                    AuthenticationGroup
                                                        .checkResetCodeCall
                                                        .message(
                                                          (_model.apiResultksb
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }

                                  safeSetState(() {});
                                },
                                text:
                                    FFLocalizations.of(context).getVariableText(
                                  trText: 'LİNK GÖNDER',
                                  enText: 'SEND LINK',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 34.0)),
        ),
      ),
    );
  }
}
