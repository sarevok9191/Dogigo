import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message_count_badge_model.dart';
export 'message_count_badge_model.dart';

class MessageCountBadgeWidget extends StatefulWidget {
  const MessageCountBadgeWidget({
    super.key,
    int? messageCount,
    double? size,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
  })  : this.messageCount = messageCount ?? 0,
        this.size = size ?? 20.0,
        this.backgroundColor = backgroundColor ?? const Color(0xFFFF5963),
        this.textColor = textColor ?? Colors.white,
        this.borderColor = borderColor ?? const Color(0xFFFF5963);

  final int messageCount;
  final double size;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  @override
  State<MessageCountBadgeWidget> createState() =>
      _MessageCountBadgeWidgetState();
}

class _MessageCountBadgeWidgetState extends State<MessageCountBadgeWidget> {
  late MessageCountBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageCountBadgeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.messageCount > 0,
      child: Align(
        alignment: AlignmentDirectional(1.0, -1.0),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.borderColor,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.messageCount > 9
                    ? '9+'
                    : widget.messageCount.toString(),
                '0',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.readexPro(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: widget.textColor,
                    fontSize: 11.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
