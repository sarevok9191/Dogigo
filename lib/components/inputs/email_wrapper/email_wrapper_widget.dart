import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'email_wrapper_model.dart';

export 'email_wrapper_model.dart';

class EmailWrapperWidget extends StatefulWidget {
  const EmailWrapperWidget({
    super.key,
    String? labelText,
    bool? isRequired,
    bool? isAutoFocus,
    String? initialValue,
    Color? labelColor,
    bool? readOnly,
  })  : labelText = labelText ?? '',
        isRequired = isRequired ?? true,
        isAutoFocus = isAutoFocus ?? false,
        initialValue = initialValue ?? '',
        labelColor = labelColor ?? const Color.fromARGB(255, 0, 0, 0),
        readOnly = readOnly ?? false;

  final String labelText;
  final bool isRequired;
  final bool isAutoFocus;
  final String initialValue;
  final Color labelColor;
  final bool readOnly;

  @override
  State<EmailWrapperWidget> createState() => _EmailWrapperWidgetState();
}

class _EmailWrapperWidgetState extends State<EmailWrapperWidget> {
  late EmailWrapperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailWrapperModel());

    _model.customInputTextController ??=
        TextEditingController(text: widget.initialValue);
    _model.customInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: valueOrDefault<double>(
        widget.readOnly ? 0.8 : 1.0,
        1.0,
      ),
      duration: 300.ms,
      curve: Curves.easeInOut,
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
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
                        'Email',
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
                      text: widget.isRequired ? ' ' : ' ',
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
                borderRadius: BorderRadius.circular(27.0),
                color: Colors.white,
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
                textCapitalization: TextCapitalization.none,
                readOnly: widget.readOnly,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFFF25822),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
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
                cursorColor: Colors.black,
                validator: _model.customInputTextControllerValidator
                    .asValidator(context),
                inputFormatters: [
                  if (!isAndroid && !isiOS)
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return TextEditingValue(
                        selection: newValue.selection,
                        text: newValue.text
                            .toCapitalization(TextCapitalization.none),
                      );
                    }),
                ],
              ),
            ),
          ].divide(const SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
