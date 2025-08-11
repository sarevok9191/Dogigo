import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'section_title_model.dart';
export 'section_title_model.dart';

class SectionTitleWidget extends StatefulWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<SectionTitleWidget> createState() => _SectionTitleWidgetState();
}

class _SectionTitleWidgetState extends State<SectionTitleWidget> {
  late SectionTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionTitleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).secondary,
            borderRadius: 15.0,
            borderWidth: 1.0,
            buttonSize: 49.0,
            fillColor: Color(0x00F25822),
            icon: Icon(
              Icons.menu,
              color: FlutterFlowTheme.of(context).secondary,
              size: 24.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          Text(
            valueOrDefault<String>(
              widget.title,
              'Title',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Opacity(
            opacity: 0.0,
            child: Container(
              width: 49.0,
              height: 49.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
