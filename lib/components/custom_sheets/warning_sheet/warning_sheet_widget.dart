import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'warning_sheet_model.dart';
export 'warning_sheet_model.dart';

class WarningSheetWidget extends StatefulWidget {
  const WarningSheetWidget({
    super.key,
    this.message,
  });

  final String? message;

  @override
  State<WarningSheetWidget> createState() => _WarningSheetWidgetState();
}

class _WarningSheetWidgetState extends State<WarningSheetWidget> {
  late WarningSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WarningSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 200.0,
      decoration: BoxDecoration(
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
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.error_sharp,
              color: FlutterFlowTheme.of(context).info,
              size: 64.0,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'qfuomynh' /* Bir Hata Oluştu */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.montaguSlab(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 27.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.message != null && widget.message != ''
                                    ? widget.message!
                                    : FFLocalizations.of(context)
                                        .getVariableText(
                                        trText:
                                            'Lütfen girdiğiniz bilgileri kontrol ediniz.',
                                        enText:
                                            'Please check the information you entered.',
                                      ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      font: GoogleFonts.montaguSlab(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xF4FFFFFF),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
