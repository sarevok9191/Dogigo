import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'password_input_wrapper_model.dart';

export 'password_input_wrapper_model.dart';

class PasswordInputWrapperWidget extends StatefulWidget {
  const PasswordInputWrapperWidget({
    super.key,
    String? labelText,
    bool? isRequired,
    bool? isAutoFocus,
    Color? labelColor,
  })  : labelText = labelText ?? ' ',
        isRequired = isRequired ?? true,
        isAutoFocus = isAutoFocus ?? false,
        labelColor = labelColor ?? const Color.fromARGB(255, 0, 0, 0);

  final String labelText;
  final bool isRequired;
  final bool isAutoFocus;
  final Color labelColor;

  @override
  State<PasswordInputWrapperWidget> createState() =>
      _PasswordInputWrapperWidgetState();
}

class _PasswordInputWrapperWidgetState
    extends State<PasswordInputWrapperWidget> {
  late PasswordInputWrapperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordInputWrapperModel());

    _model.customInputTextController ??= TextEditingController();
    _model.customInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: valueOrDefault<String>(
                        widget.labelText,
                        'Password',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: widget.labelColor,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    TextSpan(
                      text: widget.isRequired ? '' : ' ',
                      style: const TextStyle(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: widget.labelColor,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(27.0),
                border: Border.all(
                  color: const Color(0xFFE0E0E0),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: TextFormField(
                controller: _model.customInputTextController,
                focusNode: _model.customInputFocusNode,
                autofocus: widget.isAutoFocus,
                obscureText: !_model.customInputVisibility,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFFF25822),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => safeSetState(() =>
                        _model.customInputVisibility =
                            !_model.customInputVisibility),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _model.customInputVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 23.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFF4141),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFFF4141),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Colors.black,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.customInputTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ].divide(const SizedBox(height: 6.0)),
        ),
      ],
    );
  }
}
