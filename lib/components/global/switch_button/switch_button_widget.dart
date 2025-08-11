import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'switch_button_model.dart';
export 'switch_button_model.dart';

class SwitchButtonWidget extends StatefulWidget {
  const SwitchButtonWidget({
    super.key,
    bool? value,
    this.changedKey,
  }) : this.value = value ?? false;

  final bool value;
  final String? changedKey;

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  late SwitchButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchButtonModel());

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
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (_model.value == true) {
          _model.value = false;
          safeSetState(() {});
        } else {
          _model.value = true;
          safeSetState(() {});
        }
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
    );
  }
}
