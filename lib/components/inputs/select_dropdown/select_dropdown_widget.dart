import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/options_sheet/options_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_dropdown_model.dart';

export 'select_dropdown_model.dart';

class SelectDropdownWidget extends StatefulWidget {
  const SelectDropdownWidget({
    super.key,
    required this.labelTitle,
    required this.dropdownTitle,
    this.options,
    this.onValueChange,
    required this.sheetTitle,
    this.initialValue,
    bool? absorbing,
    bool? isRequired,
    Color? labelColor,
    Color? valueTextColor,
  })  : absorbing = absorbing ?? false,
        isRequired = isRequired ?? false,
        labelColor = labelColor ?? const Color(0xFF000000),
        valueTextColor = valueTextColor ?? const Color(0xFF000000);

  final String? labelTitle;
  final String? dropdownTitle;
  final List<SelectableOptionTypeStruct>? options;
  final Future Function(SelectableOptionTypeStruct? value)? onValueChange;
  final String? sheetTitle;
  final SelectableOptionTypeStruct? initialValue;
  final bool absorbing;
  final bool isRequired;
  final Color labelColor;
  final Color valueTextColor;

  @override
  State<SelectDropdownWidget> createState() => _SelectDropdownWidgetState();
}

class _SelectDropdownWidgetState extends State<SelectDropdownWidget> {
  late SelectDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDropdownModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.initialValue != null) {
        _model.value = widget.options
            ?.where((e) => e.id == widget.initialValue?.id)
            .toList()
            .firstOrNull;
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
    return Opacity(
      opacity: widget.absorbing ? 0.7 : 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelTitle != null && widget.labelTitle!.isNotEmpty)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 0.0, bottom: 10.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.labelTitle!,
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
          GestureDetector(
            onTap: () async {
              if (!widget.absorbing) {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: OptionsSheetWidget(
                          options: widget.options,
                          title: widget.sheetTitle!,
                          onChange: (value) async {
                            _model.value = widget.options
                                ?.where((e) => e.id == value.id)
                                .toList()
                                .firstOrNull;
                            _model.updatePage(() {});
                          },
                        ),
                      ),
                    );
                  },
                ).then((_) => safeSetState(() {}));

                await widget.onValueChange?.call(_model.value);
              }
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.list_alt_outlined,
                      size: 18,
                      color: Color(0xFFF25822),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _model.value != null
                          ? _model.value!.title
                          : widget.dropdownTitle ?? '',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: _model.value != null
                                ? widget.valueTextColor
                                : const Color.fromARGB(255, 123, 123, 123),
                            fontSize: 15,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: Color(0xFF888888),
                  ),
                ],
              ),
            ),
          ),
        ].divide(const SizedBox(height: 6.0)),
      ),
    );
  }
}
