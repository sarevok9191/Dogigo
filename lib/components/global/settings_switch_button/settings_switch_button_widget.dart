import '/backend/api_requests/api_calls.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'settings_switch_button_model.dart';
export 'settings_switch_button_model.dart';

class SettingsSwitchButtonWidget extends StatefulWidget {
  const SettingsSwitchButtonWidget({
    super.key,
    bool? value,
    this.changedValue,
    this.onRequestStart,
    this.onRequestCompleteSuccess,
    this.onRequestCompleteError,
    this.onRequestComplete,
  }) : this.value = value ?? false;

  final bool value;
  final String? changedValue;
  final Future Function()? onRequestStart;
  final Future Function(dynamic response)? onRequestCompleteSuccess;
  final Future Function(dynamic response)? onRequestCompleteError;
  final Future Function()? onRequestComplete;

  @override
  State<SettingsSwitchButtonWidget> createState() =>
      _SettingsSwitchButtonWidgetState();
}

class _SettingsSwitchButtonWidgetState
    extends State<SettingsSwitchButtonWidget> {
  late SettingsSwitchButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsSwitchButtonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.value = widget.value;
      safeSetState(() {});
    });
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
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.onRequestStart?.call();
            _model.apiResultdcu =
                await ProfileGroup.updateUserSettingsCall.call(
              key: widget.changedValue,
              value: !_model.value,
            );

            if ((_model.apiResultdcu?.succeeded ?? true)) {
              _model.value = !_model.value;
              safeSetState(() {});
              await widget.onRequestCompleteSuccess?.call(
                (_model.apiResultdcu?.jsonBody ?? ''),
              );
            } else {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return WebViewAware(
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ErrorSheetWidget(
                        errorMessage: getJsonField(
                          (_model.apiResultdcu?.jsonBody ?? ''),
                          r'''$.message''',
                        ).toString(),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              await widget.onRequestCompleteError?.call(
                (_model.apiResultdcu?.jsonBody ?? ''),
              );
            }

            await widget.onRequestComplete?.call();

            safeSetState(() {});
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
              width: 69.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: _model.value
                    ? Color(0xFFB1E3B3)
                    : FlutterFlowTheme.of(context).info,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6.987,
                    color: Color(0x412E2E2E),
                    offset: Offset(
                      0.0,
                      -1.747,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(
                            valueOrDefault<double>(
                              _model.value == true ? 1.0 : -1.0,
                              0.0,
                            ),
                            0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Container(
                            width: 25.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.pause_rounded,
                              color: Color(0xFFD46E1F),
                              size: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
