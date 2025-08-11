import '/backend/api_requests/api_calls.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/inputs/password_input_wrapper/password_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'forgot_password_recreate_password_screen_model.dart';
export 'forgot_password_recreate_password_screen_model.dart';

class ForgotPasswordRecreatePasswordScreenWidget extends StatefulWidget {
  const ForgotPasswordRecreatePasswordScreenWidget({
    super.key,
    required this.token,
    required this.code,
  });

  final String? token;
  final String? code;

  static String routeName = 'ForgotPasswordRecreatePasswordScreen';
  static String routePath = 'forgotPasswordRecreatePasswordScreen';

  @override
  State<ForgotPasswordRecreatePasswordScreenWidget> createState() =>
      _ForgotPasswordRecreatePasswordScreenWidgetState();
}

class _ForgotPasswordRecreatePasswordScreenWidgetState
    extends State<ForgotPasswordRecreatePasswordScreenWidget> {
  late ForgotPasswordRecreatePasswordScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ForgotPasswordRecreatePasswordScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Full-width gradient pill button (no shadow), same style as Verify page
  Widget _gradientSubmitButton({
    required String label,
    required VoidCallback? onPressed,
  }) {
    final theme = FlutterFlowTheme.of(context);
    final bool enabled = onPressed != null;

    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: enabled
                ? [theme.primary, theme.secondary]
                : [theme.alternate, theme.alternate],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: theme.titleSmall.override(
            fontFamily: theme.titleSmallFamily,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.2,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    // Helper text base style (mirrors Verify page helper text)
    final helperStyle = theme.bodyMedium.override(
      fontFamily: theme.bodyMediumFamily,
      color: const Color(0xFF858584),
      letterSpacing: 0,
      fontSize: 15,
      lineHeight: 1.4,
      fontWeight: FontWeight.w500,
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            // Background gradient (exact same as you requested)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: [
                    Color.fromARGB(255, 245, 212, 199), // top
                    Color.fromARGB(255, 255, 255, 255), // bottom
                  ],
                  stops: [0.0, 0.2],
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 40,
                    bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
                  ),
                  child: Form(
                    key: _model.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Title (same size and color as Verify page title)
                        Text(
                          'Reset Password',
                          textAlign: TextAlign.center,
                          style: theme.headlineMedium.override(
                            fontFamily: theme.headlineMediumFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 32,
                            color: const Color.fromARGB(255, 0, 0, 0), // 100% black
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Helper text split with '\n' (like Verify page)
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: helperStyle,
                            children: const [
                              TextSpan(
                                text:
                                    'You are going to take a code to recreate a new brand password of you.',
                              ),
                              // If you want a manual forced line-break for two lines instead:
                              // TextSpan(text: 'You are going to take a code to recreate a new brand'),
                              // TextSpan(text: '\npassword of you.'),
                            ],
                          ),
                        ),

                        const SizedBox(height: 48),

                        // Input: New Password
                        wrapWithModel(
                          model: _model.passwordInputWrapperModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: PasswordInputWrapperWidget(
                            labelText: 'New Password',
                            isRequired: true,
                            isAutoFocus: true,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Input: Confirm New Password (updated label)
                        wrapWithModel(
                          model: _model.passwordInputWrapperModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: PasswordInputWrapperWidget(
                            labelText: 'Confirm New Password',
                            isRequired: true,
                            isAutoFocus: false,
                          ),
                        ),

                        const SizedBox(height: 36),

                        // Save Password button (gradient pill)
                        _gradientSubmitButton(
                          label: 'Save Password',
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            final pass1 = _model.passwordInputWrapperModel1
                                .customInputTextController.text;
                            final pass2 = _model.passwordInputWrapperModel2
                                .customInputTextController.text;

                            if (pass1 == pass2) {
                              setState(() => _model.loading = true);
                              final result =
                                  await AuthenticationGroup.resetPasswordCall
                                      .call(
                                code: widget.code,
                                token: widget.token,
                                password: pass1,
                                passwordConfirmation: pass2,
                              );
                              setState(() => _model.loading = false);

                              if ((result.succeeded)) {
                                context.pushNamed(LoginScreenWidget.routeName);
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
                                            errorMessage: getJsonField(
                                              (result.jsonBody ?? ''),
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
                                                'Şifre ile şifre tekrarı uyuşmuyor',
                                            enText:
                                                'Passwords doesn\'t match',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Loading overlay (unchanged)
            if (_model.loading == true)
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                color: const Color(0x63FFBE98),
                child: Center(
                  child: Lottie.asset(
                    'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                    width: 110.0,
                    height: 110.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
