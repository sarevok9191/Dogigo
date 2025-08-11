import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_area_wrapper_model.dart';

export 'text_area_wrapper_model.dart';

class TextAreaWrapperWidget extends StatefulWidget {
  const TextAreaWrapperWidget({
    super.key,
    String? labelText,
    bool? isRequired,
    bool? isAutoFocus,
    String? initialValue,
    Color? labelColor,
  })  : labelText = labelText ?? ' ',
        isRequired = isRequired ?? true,
        isAutoFocus = isAutoFocus ?? false,
        initialValue = initialValue ?? '',
        labelColor = labelColor ?? const Color.fromARGB(255, 0, 0, 0);

  final String labelText;
  final bool isRequired;
  final bool isAutoFocus;
  final String initialValue;
  final Color labelColor;

  @override
  State<TextAreaWrapperWidget> createState() => _TextAreaWrapperWidgetState();
}

class _TextAreaWrapperWidgetState extends State<TextAreaWrapperWidget> {
  late TextAreaWrapperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextAreaWrapperModel());

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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 19.0, bottom: 6.0),
          child: RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: valueOrDefault<String>(widget.labelText, 'Name'),
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
                TextSpan(
                  text: widget.isRequired ? ' *' : '',
                  style: const TextStyle(color: Color(0xFF000000)),
                )
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          child: TextFormField(
            controller: _model.customInputTextController,
            focusNode: _model.customInputFocusNode,
            autofocus: widget.isAutoFocus,
            textCapitalization: TextCapitalization.sentences,
            obscureText: false,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white, // White background
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 26.0, 20.0),
              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(start: 20.0, end: 10.0),
                child: Icon(
                  Icons.location_city, // Change this icon as needed
                  color: Color.fromARGB(255, 255, 140, 114),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFE0E0E0), // Grey border
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFFF4141),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFFF4141),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
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
            maxLines: 6,
            minLines: 4,
            cursorColor: FlutterFlowTheme.of(context).primaryText,
            validator:
                _model.customInputTextControllerValidator.asValidator(context),
            inputFormatters: [
              if (!isAndroid && !isiOS)
                TextInputFormatter.withFunction((oldValue, newValue) {
                  return TextEditingValue(
                    selection: newValue.selection,
                    text: newValue.text
                        .toCapitalization(TextCapitalization.sentences),
                  );
                }),
            ],
          ),
        ),
      ],
    );
  }
}
