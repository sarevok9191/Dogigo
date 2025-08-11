import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/components/inputs/password_input_wrapper/password_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen_model.dart';

export 'login_screen_model.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  static String routeName = 'LoginScreen';
  static String routePath = 'loginScreen';

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  late LoginScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginScreenModel());

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFEEEE9), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2], // Gradient ends at 30% of the height
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 100.0),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/login-logo.svg',
                            width: 96.0,
                            height: 48.0,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Patido',
                            style: GoogleFonts.kumbhSans(
                              fontSize: 52.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          const SizedBox(height: 48.0),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              children: [
                                wrapWithModel(
                                  model: _model.emailWrapperModel,
                                  updateCallback: () => setState(() {}),
                                  child: const EmailWrapperWidget(
                                    labelText: 'Email',
                                    isRequired: true,
                                    isAutoFocus: true,
                                  ),
                                ),
                                const SizedBox(height: 24.0),
                                wrapWithModel(
                                  model: _model.passwordInputWrapperModel,
                                  updateCallback: () => setState(() {}),
                                  child: const PasswordInputWrapperWidget(
                                    labelText: 'Password',
                                    isRequired: true,
                                    isAutoFocus: false,
                                  ),
                                ),
                                const SizedBox(height: 24.0),
                                Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28.0),
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFFF79E7F), Color(0xFFF25822)],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 4),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.loginFormValidate = true;
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        _model.loginFormValidate = false;
                                      }
                                      if (_model.loginFormValidate == true) {
                                        _model.loading = true;
                                        setState(() {});
                                        _model.apiResultjdu =
                                            await AuthenticationGroup.loginCall
                                                .call(
                                          email: _model.emailWrapperModel
                                              .customInputTextController.text,
                                          password: _model
                                              .passwordInputWrapperModel
                                              .customInputTextController
                                              .text,
                                        );

                                        if ((_model.apiResultjdu?.succeeded ??
                                            true)) {
                                          FFAppState().CurrentUser =
                                              UserStruct.maybeFromMap(
                                            AuthenticationGroup.loginCall.user(
                                              (_model.apiResultjdu?.jsonBody ??
                                                  ''),
                                            ),
                                          )!;
                                          await actions.writeLocalStorage(
                                            'refresh_token',
                                            getJsonField(
                                              (_model.apiResultjdu?.jsonBody ??
                                                  ''),
                                              r'''$.refresh_token''',
                                            ).toString(),
                                          );
                                          await actions.writeLocalStorage(
                                            'access_token',
                                            getJsonField(
                                              (_model.apiResultjdu?.jsonBody ??
                                                  ''),
                                              r'''$.access_token''',
                                            ).toString(),
                                          );
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          final user = await authManager
                                              .signInWithJwtToken(
                                            context,
                                            AuthenticationGroup.loginCall
                                                .token(
                                              (_model.apiResultjdu?.jsonBody ??
                                                  ''),
                                            )!,
                                          );
                                          if (user == null) return;
                                          await actions.storeDeviceToken();
                                          context.goNamedAuth(
                                              HomePageWidget.routeName,
                                              context.mounted);
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return ErrorSheetWidget(
                                                errorMessage: getJsonField(
                                                  (_model.apiResultjdu
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                              );
                                            },
                                          );
                                        }
                                      }
                                      _model.loading = false;
                                      setState(() {});
                                    },
                                    text: 'Sign In',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      color: Colors.transparent,
                                      textStyle: GoogleFonts.manrope(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                TextButton(
                                  onPressed: () {
                                    context.pushNamed(
                                        ForgotPasswordScreenWidget.routeName);
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(RegisterScreenWidget.routeName);
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
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
