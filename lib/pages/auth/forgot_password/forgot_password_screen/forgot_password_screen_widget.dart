import '/backend/api_requests/api_calls.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgot_password_screen_model.dart';
export 'forgot_password_screen_model.dart';

class ForgotPasswordScreenWidget extends StatefulWidget {
  const ForgotPasswordScreenWidget({super.key});

  static String routeName = 'ForgotPasswordScreen';
  static String routePath = 'forgotPasswordScreen';

  @override
  State<ForgotPasswordScreenWidget> createState() =>
      _ForgotPasswordScreenWidgetState();
}

class _ForgotPasswordScreenWidgetState
    extends State<ForgotPasswordScreenWidget> {
  late ForgotPasswordScreenModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordScreenModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
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
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 245, 212, 199), // Light peach at top
                Colors.white, // Fade to white at bottom
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                /// 🔝 Top section with title + description
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 24.0),
                  child: Column(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: FlutterFlowTheme.of(context)
                            .titleLarge
                            .override(
                              fontFamily: 'Manrope',
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'You are going to take a code to recreate a new brand password of you.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF858584),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// 🔽 Middle section: Form
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                  child: Form(
                    key: _model.formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        wrapWithModel(
                          model: _model.emailWrapperModel,
                          updateCallback: () => setState(() {}),
                          child: const EmailWrapperWidget(
                            labelText: 'Email',
                            isRequired: true,
                            isAutoFocus: true,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27.0),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF79E7F),
                                Color(0xFFF25822),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.apiResult58a = await AuthenticationGroup
                                  .forgotPasswordCall
                                  .call(
                                email: _model.emailWrapperModel
                                    .customInputTextController.text,
                              );

                              if ((_model.apiResult58a?.succeeded ?? false)) {
                                context.pushNamed(
                                  ForgotPasswordEnterCodeScreenWidget
                                      .routeName,
                                  queryParameters: {
                                    'token': serializeParam(
                                      AuthenticationGroup
                                          .forgotPasswordCall
                                          .token(
                                        (_model.apiResult58a?.jsonBody ?? ''),
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: ErrorSheetWidget(
                                        errorMessage: AuthenticationGroup
                                            .forgotPasswordCall
                                            .message((_model.apiResult58a
                                                    ?.jsonBody ??
                                                ''))!,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            text: 'Send Code',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60.0,
                              color: Colors.transparent,
                              textStyle: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(27.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// 🧭 Push "Back to Log In" to bottom
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: TextButton(
                    onPressed: () {
                      context.pushNamed('LoginScreen');
                    },
                    child: Text(
                      'Back to Log In',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 16,
                            color: const Color(0xFFF25822),
                            fontWeight: FontWeight.bold,
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
