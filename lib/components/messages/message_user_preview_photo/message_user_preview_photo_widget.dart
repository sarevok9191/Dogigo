import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message_user_preview_photo_model.dart';
export 'message_user_preview_photo_model.dart';

class MessageUserPreviewPhotoWidget extends StatefulWidget {
  const MessageUserPreviewPhotoWidget({
    super.key,
    this.image,
  });

  final String? image;

  @override
  State<MessageUserPreviewPhotoWidget> createState() =>
      _MessageUserPreviewPhotoWidgetState();
}

class _MessageUserPreviewPhotoWidgetState
    extends State<MessageUserPreviewPhotoWidget> {
  late MessageUserPreviewPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageUserPreviewPhotoModel());
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
        Container(
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 65.0, 24.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).info,
                      borderRadius: 15.0,
                      borderWidth: 1.0,
                      buttonSize: 49.0,
                      fillColor: Color(0x00F25822),
                      icon: Icon(
                        Icons.menu,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/dogs_white.svg',
                        width: 96.0,
                        height: 48.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network(
              widget.image!,
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 115.0,
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'l908815h' /* Geri */,
                  ),
                  icon: Icon(
                    Icons.subdirectory_arrow_left_sharp,
                    size: 18.0,
                  ),
                  options: FFButtonOptions(
                    width: 200.0,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.manrope(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Color(0x28FFD7C0),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
