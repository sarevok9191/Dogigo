import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'success_sheet_model.dart';
export 'success_sheet_model.dart';

class SuccessSheetWidget extends StatefulWidget {
  const SuccessSheetWidget({
    super.key,
    required this.successMessage,
  });

  final String? successMessage;

  @override
  State<SuccessSheetWidget> createState() => _SuccessSheetWidgetState();
}

class _SuccessSheetWidgetState extends State<SuccessSheetWidget> {
  late SuccessSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessSheetModel());
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
      constraints: BoxConstraints(
        maxHeight: 203.0,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              -6.0,
            ),
            spreadRadius: 2.0,
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
          begin: AlignmentDirectional(0.87, -1.0),
          end: AlignmentDirectional(-0.87, 1.0),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 13.0, 32.0, 41.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 5.0,
                constraints: BoxConstraints(
                  maxWidth: 148.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFC6F3E),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).info,
                        size: 48.0,
                      ),
                      Container(
                        width: 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        constraints: BoxConstraints(
                          maxHeight: 113.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xABFFFFFF),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.successMessage!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.8,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 20.0)),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
