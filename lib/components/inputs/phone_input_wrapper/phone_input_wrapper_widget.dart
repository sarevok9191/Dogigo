import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'phone_input_wrapper_model.dart';

export 'phone_input_wrapper_model.dart';

class PhoneInputWrapperWidget extends StatefulWidget {
  const PhoneInputWrapperWidget({
    super.key,
    String? labelText,
    bool? isRequired,
    bool? isAutoFocus,
    String? initialValue,
    Color? labelColor,
    bool? readOnly,
  })  : labelText = labelText ?? ' ',
        isRequired = isRequired ?? true,
        isAutoFocus = isAutoFocus ?? false,
        initialValue = initialValue ?? '',
        labelColor = labelColor ?? const Color(0xFF000000),
        readOnly = readOnly ?? false;

  final String labelText;
  final bool isRequired;
  final bool isAutoFocus;
  final String initialValue;
  final Color labelColor;
  final bool readOnly;

  @override
  State<PhoneInputWrapperWidget> createState() =>
      _PhoneInputWrapperWidgetState();
}

class _PhoneInputWrapperWidgetState extends State<PhoneInputWrapperWidget> {
  late PhoneInputWrapperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneInputWrapperModel());

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
      opacity: widget.readOnly ? 0.8 : 1.0,
      duration: 300.ms,
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText.isNotEmpty)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 0.0, bottom: 10.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.labelText,
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
                    if (widget.isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                  ],
                ),
              ),
            ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 60.0,
            padding: const EdgeInsets.symmetric(horizontal: 0),
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
            alignment: Alignment.centerLeft,
            child: TextFormField(
              controller: _model.customInputTextController,
              focusNode: _model.customInputFocusNode,
              autofocus: widget.isAutoFocus,
              readOnly: widget.readOnly,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: Colors.black,
                    fontSize: 15,
                  ),
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: Color(0xFFF25822),
                ),
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              ),
              cursorColor: Colors.black,
              validator: _model.customInputTextControllerValidator
                  .asValidator(context),
            ),
          ),
        ].divide(const SizedBox(height: 6.0)),
      ),
    );
  }
}
