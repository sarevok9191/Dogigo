import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'date_input_wrapper_model.dart';

export 'date_input_wrapper_model.dart';

class DateInputWrapperWidget extends StatefulWidget {
  const DateInputWrapperWidget({
    super.key,
    String? labelText,
    bool? isRequired,
    bool? isAutoFocus,
    String? initialValue,
    Color? labelColor,
    this.minDate,
    this.maxDate,
    this.defaultDate,
    Color? pickerTextColor,
    bool? readonly,
  })  : labelText = labelText ?? ' ',
        isRequired = isRequired ?? true,
        isAutoFocus = isAutoFocus ?? false,
        initialValue = initialValue ?? '',
        labelColor = labelColor ?? const Color.fromARGB(255, 0, 0, 0),
        pickerTextColor = pickerTextColor ?? const Color.fromARGB(255, 255, 255, 255),
        readonly = readonly ?? false;

  final String labelText;
  final bool isRequired;
  final bool isAutoFocus;
  final String initialValue;
  final Color labelColor;
  final DateTime? minDate;
  final DateTime? maxDate;
  final DateTime? defaultDate;
  final Color pickerTextColor;
  final bool readonly;

  @override
  State<DateInputWrapperWidget> createState() => _DateInputWrapperWidgetState();
}

class _DateInputWrapperWidgetState extends State<DateInputWrapperWidget> {
  late DateInputWrapperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateInputWrapperModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.defaultDate != null) {
        _model.value = widget.defaultDate;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.readonly ? 0.8 : 1.0,
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
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                  ],
                ),
              ),
            ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 60.0,
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xFFF25822),
                    size: 18,
                  ),
                ),
                Expanded(
                  child: custom_widgets.DatePicker(
                    width: double.infinity,
                    height: 60.0,
                    labelText: widget.labelText,
                    labelColor: widget.labelColor,
                    defaultDate: _model.value ?? widget.defaultDate,
                    maxDate: widget.maxDate,
                    minDate: widget.minDate,
                    pickerTextColor: FlutterFlowTheme.of(context).primaryText,
                    readOnly: widget.readonly,
                    onChange: (value) async {
                      _model.value = value;
                      safeSetState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ].divide(const SizedBox(height: 6.0)),
      ),
    );
  }
}
