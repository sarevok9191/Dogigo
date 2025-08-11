import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_model.dart';
export 'message_model.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    super.key,
    required this.messageInfos,
    this.receiverName,
  });

  final MessagesRecord? messageInfos;
  final String? receiverName;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  late MessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(
          valueOrDefault<double>(
            widget.messageInfos?.senderId == FFAppState().CurrentUser.id
                ? 1.0
                : -1.0,
            0.0,
          ),
          0.0),
      child: Builder(
        builder: (context) {
          if (widget.messageInfos?.messageType == MessageTypes.touch) {
            return Align(
              alignment: AlignmentDirectional(
                  valueOrDefault<double>(
                    widget.messageInfos?.senderId ==
                            FFAppState().CurrentUser.id
                        ? 1.0
                        : -1.0,
                    0.0,
                  ),
                  0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.55,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).secondary,
                      Color(0xFFFFB073)
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(23.0, 19.0, 18.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.paw,
                        color: FlutterFlowTheme.of(context).info,
                        size: 29.0,
                      ),
                      Expanded(
                        child: Text(
                          widget.messageInfos?.senderId ==
                                  FFAppState().CurrentUser.id
                              ? '${widget.receiverName}${FFLocalizations.of(context).getVariableText(
                                  trText: ' kişisini dürttün',
                                  enText: ' poked',
                                )}'
                              : '${widget.receiverName}${FFLocalizations.of(context).getVariableText(
                                  trText: ' sizi dürttü',
                                  enText: ' poked  you',
                                )}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 13.0)),
                  ),
                ),
              ),
            );
          } else {
            return AuthUserStreamWidget(
              builder: (context) => Container(
                width: MediaQuery.sizeOf(context).width * 0.55,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                ),
                decoration: BoxDecoration(
                  color: widget.messageInfos?.senderId ==
                          valueOrDefault(currentUserDocument?.id, 0)
                      ? Color(0xFFF7DED0)
                      : Color(0xFFEDEDED),
                  borderRadius: BorderRadius.circular(10.0),
                  shape: BoxShape.rectangle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Builder(
                    builder: (context) {
                      if (widget.messageInfos?.messageType ==
                          MessageTypes.text) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 10.0, 17.0, 10.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.messageInfos?.message,
                              ' qweqwr',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: widget.messageInfos?.senderId ==
                                          FFAppState().CurrentUser.id
                                      ? Color(0xFFF37C20)
                                      : Color(0xFF6A6F6F),
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.23,
                                ),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(
                              valueOrDefault<double>(
                                widget.messageInfos?.senderId ==
                                        FFAppState().CurrentUser.id
                                    ? 1.0
                                    : -1.0,
                                0.0,
                              ),
                              0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 400),
                                      fadeOutDuration:
                                          Duration(milliseconds: 400),
                                      imageUrl:
                                          widget.messageInfos!.messageImage,
                                      fit: BoxFit.contain,
                                      errorWidget:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    allowRotation: false,
                                    tag: widget.messageInfos!.messageImage,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.messageInfos!.messageImage,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 400),
                                  fadeOutDuration: Duration(milliseconds: 400),
                                  imageUrl: widget.messageInfos!.messageImage,
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.png',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 300.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
