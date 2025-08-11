import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fake_snackbar_model.dart';
export 'fake_snackbar_model.dart';

class FakeSnackbarWidget extends StatefulWidget {
  const FakeSnackbarWidget({
    super.key,
    required this.text,
    this.icon,
    Color? textColor,
    Color? iconColor,
  })  : this.textColor = textColor ?? Colors.white,
        this.iconColor = iconColor ?? Colors.white;

  final String? text;
  final Widget? icon;
  final Color textColor;
  final Color iconColor;

  @override
  State<FakeSnackbarWidget> createState() => _FakeSnackbarWidgetState();
}

class _FakeSnackbarWidgetState extends State<FakeSnackbarWidget> {
  late FakeSnackbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FakeSnackbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).secondary,
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).secondary,
            FlutterFlowTheme.of(context).primary
          ],
          stops: [0.0, 0.25, 0.575, 0.76875, 1.0],
          begin: AlignmentDirectional(1.0, -0.87),
          end: AlignmentDirectional(-1.0, 0.87),
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.info_rounded,
              color: valueOrDefault<Color>(
                widget.iconColor,
                FlutterFlowTheme.of(context).info,
              ),
              size: 35.0,
            ),
            Expanded(
              child: Text(
                widget.text!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        widget.textColor,
                        FlutterFlowTheme.of(context).info,
                      ),
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.cancel,
                color: valueOrDefault<Color>(
                  widget.iconColor,
                  FlutterFlowTheme.of(context).info,
                ),
                size: 18.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
