import '/backend/api_requests/api_calls.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'forgot_password_enter_code_screen_model.dart';
export 'forgot_password_enter_code_screen_model.dart';

class ForgotPasswordEnterCodeScreenWidget extends StatefulWidget {
  const ForgotPasswordEnterCodeScreenWidget({
    super.key,
    required this.token,
  });

  final String? token;

  static String routeName = 'ForgotPasswordEnterCodeScreen';
  static String routePath = 'forgotPasswordEnterCodeScreen';

  @override
  State<ForgotPasswordEnterCodeScreenWidget> createState() =>
      _ForgotPasswordEnterCodeScreenWidgetState();
}

class _ForgotPasswordEnterCodeScreenWidgetState
    extends State<ForgotPasswordEnterCodeScreenWidget> {
  late ForgotPasswordEnterCodeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // === 6-DIGIT OTP: controllers & focus nodes ===============================
  final _c1 = TextEditingController();
  final _c2 = TextEditingController();
  final _c3 = TextEditingController();
  final _c4 = TextEditingController();
  final _c5 = TextEditingController();
  final _c6 = TextEditingController();

  final _f1 = FocusNode();
  final _f2 = FocusNode();
  final _f3 = FocusNode();
  final _f4 = FocusNode();
  final _f5 = FocusNode();
  final _f6 = FocusNode();

  // Resend timer
  Timer? _resendTimer;
  int _secondsLeft = 30;

  bool get _canSubmit =>
      _c1.text.isNotEmpty &&
      _c2.text.isNotEmpty &&
      _c3.text.isNotEmpty &&
      _c4.text.isNotEmpty &&
      _c5.text.isNotEmpty &&
      _c6.text.isNotEmpty;

  String get _code =>
      '${_c1.text}${_c2.text}${_c3.text}${_c4.text}${_c5.text}${_c6.text}';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordEnterCodeScreenModel());
    _startResendCountdown();
  }

  void _startResendCountdown() {
    _secondsLeft = 30;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 1) {
        t.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();

    _c1.dispose();
    _c2.dispose();
    _c3.dispose();
    _c4.dispose();
    _c5.dispose();
    _c6.dispose();

    _f1.dispose();
    _f2.dispose();
    _f3.dispose();
    _f4.dispose();
    _f5.dispose();
    _f6.dispose();

    _model.dispose();
    super.dispose();
  }

  void _onChanged(TextEditingController current, FocusNode? next, String v) {
    if (v.isNotEmpty) {
      // Keep only the first character if user pastes/auto-fill
      if (v.length > 1) current.text = v.characters.first;
      if (next != null) next.requestFocus();
    }
    setState(() {}); // refresh _canSubmit
  }

  void _onBackspace(
    FocusNode? prev,
    TextEditingController current,
    RawKeyEvent e,
  ) {
    if (e is RawKeyDownEvent &&
        e.logicalKey == LogicalKeyboardKey.backspace &&
        current.text.isEmpty) {
      prev?.requestFocus();
    }
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    if (_model.formKey.currentState?.validate() == false) return;

    setState(() => _model.loading = true);

    final result = await AuthenticationGroup.checkResetCodeCall.call(
      token: widget.token,
      code: _code,
    );

    setState(() => _model.loading = false);

    if (result.succeeded) {
      context.pushNamed(
        ForgotPasswordRecreatePasswordScreenWidget.routeName,
        queryParameters: {
          'token': serializeParam(widget.token, ParamType.String),
          'code': serializeParam(_code, ParamType.String),
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
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: ErrorSheetWidget(
                  errorMessage: AuthenticationGroup.checkResetCodeCall
                      .message((result.jsonBody ?? ''))
                      .toString(),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  // === UI HELPERS ============================================================

  // Transparent background always; grey border when idle; orange-ish border when focused.
  // Nested layout so thicker borders don't shrink the inner typing area.
  Widget _otpCircle({
    required TextEditingController controller,
    required FocusNode focusNode,
    FocusNode? prev,
    FocusNode? next,
  }) {
    final theme = FlutterFlowTheme.of(context);

    // Adjust these if you need tighter layout for six circles:
    const double innerSize = 50;           // typing area diameter (constant). Try 64 if too wide.
    const double borderWidthIdle = 2.0;    // idle thickness (grey)
    const double borderWidthFocused = 4.0; // focused thickness (orange-ish)

    final Color inactiveBorder = theme.alternate;  // grey outline
    final Color activeBorder   = theme.secondary;  // orange-ish outline

    return RawKeyboardListener(
      focusNode: FocusNode(), // for backspace detection
      onKey: (e) => _onBackspace(prev, controller, e),
      child: StatefulBuilder(
        builder: (context, setLocal) {
          // Rebuild when focus changes to update border color & width
          focusNode.addListener(() => setLocal(() {}));

          final double currentBorder =
              focusNode.hasFocus ? borderWidthFocused : borderWidthIdle;
          final double outerSize = innerSize + (currentBorder * 2);

          return AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOut,
            width: outerSize,
            height: outerSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: focusNode.hasFocus ? activeBorder : inactiveBorder,
                width: currentBorder,
              ),
            ),
            alignment: Alignment.center,
            // Inner circle keeps typing area size constant
            child: Container(
              width: innerSize,
              height: innerSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                style: theme.titleLarge.override(
                  fontFamily: theme.titleLargeFamily,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: theme.primaryText,
                ),
                decoration: const InputDecoration(
                  isCollapsed: true,
                  counterText: '',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (v) => _onChanged(controller, next, v),
              ),
            ),
          );
        },
      ),
    );
  }

  // Full-width gradient pill button without shadow
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
            colors: [Color(0xFFF79E7F), Color(0xFFF25822)],
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

  String _formatSeconds(int s) {
    final mm = (s ~/ 60).toString().padLeft(2, '0');
    final ss = (s % 60).toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  // === BUILD ================================================================

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    // Helper text base style (we'll reuse in spans)
    final helperStyle = theme.bodyMedium.override(
      fontFamily: theme.bodyMediumFamily,
      color: theme.secondaryText,
      letterSpacing: 0,
      fontSize: 15,
      lineHeight: 1.4,
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
            // Background gradient + content
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: [Color(0xFFFEEEE9), Colors.white],
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
                        // Title (colored)
                        Text(
                          'Verify Your Email',
                          textAlign: TextAlign.center,
                          style: theme.headlineMedium.override(
                            fontFamily: theme.headlineMediumFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 32,
                            color: const Color.fromARGB(255, 0, 0, 0), // 100% black
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Helper text with spans + newline
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: helperStyle.override(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF858584),
                            ),
                            children: const [
                              TextSpan(text: 'Enter the code you received via your e‑mail to'),
                              TextSpan(text: '\nrenew the password.'),
                            ],
                          ),
                        ),

                        const SizedBox(height: 64),

                        // OTP Row (6 circles, small gaps)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _otpCircle(controller: _c1, focusNode: _f1, next: _f2),
                            const SizedBox(width: 10),
                            _otpCircle(controller: _c2, focusNode: _f2, prev: _f1, next: _f3),
                            const SizedBox(width: 10),
                            _otpCircle(controller: _c3, focusNode: _f3, prev: _f2, next: _f4),
                            const SizedBox(width: 10),
                            _otpCircle(controller: _c4, focusNode: _f4, prev: _f3, next: _f5),
                            const SizedBox(width: 10),
                            _otpCircle(controller: _c5, focusNode: _f5, prev: _f4, next: _f6),
                            const SizedBox(width: 10),
                            _otpCircle(controller: _c6, focusNode: _f6, prev: _f5),
                          ],
                        ),

                        const SizedBox(height: 72),

                        // Submit (full-width gradient, no shadow)
                        _gradientSubmitButton(
                          label: 'Submit',
                          onPressed: _canSubmit ? _submit : null,
                        ),

                        const SizedBox(height: 36),

                        // Resend line
                        GestureDetector(
                          onTap: _secondsLeft == 0
                              ? () {
                                  // TODO: Hook your resend endpoint here if available.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('If available, a new code has been sent.'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  _startResendCountdown();
                                }
                              : null,
                          child: RichText(
                            text: TextSpan(
                              style: theme.bodyMedium.override(
                                fontFamily: theme.bodyMediumFamily,
                                color: theme.secondaryText,
                                letterSpacing: 0,
                                fontSize: 20,
                              ),
                              children: [
                                const TextSpan(text: 'Resend code '),
                                TextSpan(
                                  text: _formatSeconds(_secondsLeft),
                                  style: theme.bodyMedium.override(
                                    fontFamily: theme.bodyMediumFamily,
                                    color: theme.primary,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
