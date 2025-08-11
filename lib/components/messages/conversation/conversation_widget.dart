import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/message_count_badge_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'conversation_model.dart';
export 'conversation_model.dart';

class ConversationWidget extends StatefulWidget {
  const ConversationWidget({
    super.key,
    required this.messageInfo,
    this.onBackDetail,
  });

  final FriendTypeStruct? messageInfo;
  final Future Function()? onBackDetail;

  @override
  State<ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  late ConversationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(21.0, 19.0, 26.0, 18.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            child: Stack(
              alignment: AlignmentDirectional(1.0, 0.0),
              children: [
                ClipOval(
                  child: Container(
                    width: 68.0,
                    height: 68.0,
                    decoration: BoxDecoration(
                      color: Color(0x01F7DED0),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondary,
                        width: 1.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 0),
                        fadeOutDuration: Duration(milliseconds: 0),
                        imageUrl: widget.messageInfo!.avatar.url,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (widget.messageInfo?.isOnline ?? true)
                  Align(
                    alignment: AlignmentDirectional(0.87, -0.69),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF42FC46),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF508D4E),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: StreamBuilder<List<MessagesRecord>>(
              stream: queryMessagesRecord(
                queryBuilder: (messagesRecord) => messagesRecord
                    .where(
                      'token',
                      isEqualTo: widget.messageInfo?.chatToken,
                    )
                    .orderBy('timestamp', descending: true),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Container(
                    width: 0.0,
                    height: 0.0,
                    child: MessageCountBadgeWidget(
                      messageCount: 0,
                      size: 0.0,
                    ),
                  );
                }
                List<MessagesRecord> columnMessagesRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnMessagesRecord = columnMessagesRecordList.isNotEmpty
                    ? columnMessagesRecordList.first
                    : null;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.messageInfo!.firstName,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          dateTimeFormat(
                            "Hm",
                            columnMessagesRecord!.timestamp!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.9,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Builder(
                              builder: (context) {
                                if (columnMessagesRecord.messageType ==
                                    MessageTypes.text) {
                                  return Text(
                                    columnMessagesRecord.message,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFAEB3B3),
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  );
                                } else if (columnMessagesRecord.messageType ==
                                    MessageTypes.image) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      columnMessagesRecord.messageImage,
                                      width: 34.0,
                                      height: 34.0,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else if (columnMessagesRecord.messageType ==
                                    MessageTypes.touch) {
                                  return Text(
                                    columnMessagesRecord.senderId ==
                                            FFAppState().CurrentUser.id
                                        ? FFLocalizations.of(context)
                                            .getVariableText(
                                            trText: 'Dürttünüz',
                                            enText: 'Poked by you',
                                          )
                                        : FFLocalizations.of(context)
                                            .getVariableText(
                                            trText: 'Sizi dürttü',
                                            enText: 'You have been poked',
                                          ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFAEB3B3),
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  );
                                } else {
                                  return Text(
                                    FFLocalizations.of(context).getText(
                                      'sb2q222w' /* Sohbet edin */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFAEB3B3),
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            width: 22.0,
                            height: 22.0,
                            child: custom_widgets.LiveMessageCounterWidget(
                              width: 22.0,
                              height: 22.0,
                              token: widget.messageInfo!.chatToken,
                            ),
                          ),
                        ].divide(SizedBox(width: 19.0)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ].divide(SizedBox(width: 20.0)),
      ),
    );
  }
}
