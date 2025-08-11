import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_item_model.dart';
export 'notification_item_model.dart';

class NotificationItemWidget extends StatefulWidget {
  const NotificationItemWidget({
    super.key,
    required this.notification,
  });

  final NotificationTypeStruct? notification;

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  late NotificationItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationItemModel());
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
        if (() {
          if (widget.notification?.type == NotificationTypes.touch.name) {
            return true;
          } else if (widget.notification?.type == 'like') {
            return false;
          } else {
            return false;
          }
        }()) {
          context.pushNamed(
            MessageScreenWidget.routeName,
            queryParameters: {
              'token': serializeParam(
                widget.notification?.chatToken,
                ParamType.String,
              ),
              'receiverId': serializeParam(
                widget.notification?.touchedUser.id,
                ParamType.int,
              ),
              'receiverPhoto': serializeParam(
                widget.notification?.touchedUser.avatar.url,
                ParamType.String,
              ),
              'receiverName': serializeParam(
                widget.notification?.touchedUser.firstName,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        } else if (widget.notification?.type == 'like') {
          context.pushNamed(
            NotificationLikeScreenWidget.routeName,
            queryParameters: {
              'dog': serializeParam(
                widget.notification?.like.dog,
                ParamType.DataStruct,
              ),
              'user': serializeParam(
                widget.notification?.like.user,
                ParamType.DataStruct,
              ),
              'type': serializeParam(
                widget.notification?.type,
                ParamType.String,
              ),
              'userDog': serializeParam(
                widget.notification?.like.userDog,
                ParamType.DataStruct,
              ),
            }.withoutNulls,
          );
        } else {
          context.pushNamed(
            NotificationFriendScreenWidget.routeName,
            queryParameters: {
              'dog': serializeParam(
                widget.notification?.friendRequest.requestedDog,
                ParamType.DataStruct,
              ),
              'user': serializeParam(
                widget.notification?.friendRequest.user,
                ParamType.DataStruct,
              ),
              'type': serializeParam(
                'friend_request',
                ParamType.String,
              ),
              'userDog': serializeParam(
                widget.notification?.friendRequest.userDog,
                ParamType.DataStruct,
              ),
              'requestId': serializeParam(
                widget.notification?.friendRequest.id,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).info,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 32.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 23.0),
                      child: Container(
                        width: 68.0,
                        height: 68.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 1.0,
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: () {
                                  if (widget.notification?.type == 'like') {
                                    return widget.notification!.like.userDog
                                        .avatar.thumbUrl;
                                  } else if (widget.notification?.type ==
                                      'friend_request') {
                                    return widget.notification!.friendRequest
                                        .userDog.avatar.thumbUrl;
                                  } else if (widget.notification?.type ==
                                      'touch') {
                                    return widget.notification!.touchedUser
                                        .avatar.thumbUrl;
                                  } else {
                                    return 'https://via.placeholder.com/52x52';
                                  }
                                }(),
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.93, -1.14),
                              child: Container(
                                width: 23.0,
                                height: 23.0,
                                decoration: BoxDecoration(
                                  color: Color(0x0042FC46),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0x00508D4E),
                                    width: 1.0,
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (widget.notification?.type == 'like') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/hearth.svg',
                                          width: 23.0,
                                          height: 23.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else if (widget.notification?.type ==
                                        'touch') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/touched.svg',
                                          width: 23.0,
                                          height: 23.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/wantso-to-be-friend.svg',
                                          width: 23.0,
                                          height: 23.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (widget.notification?.type == 'like') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 24.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget.notification?.like.userDog
                                                .title,
                                            'Kopek',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'y30fsz5j' /*  köpeğinizi beğendi  ( */,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget
                                                .notification?.like.dog.title,
                                            'kopek',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFAEB3B3),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '9jm4854u' /* ) */,
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                );
                              } else if (widget.notification?.type ==
                                  'touch') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 24.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget.notification?.touchedUser
                                                .firstName,
                                            'Kişi',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'py11falg' /*  sizi dürttü */,
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                );
                              } else if (widget.notification?.type ==
                                  'friend_request') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 24.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget.notification?.friendRequest
                                                .user.firstName,
                                            'Kişi',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'bfcmzn16' /*  arkadaşlık isteği gönderdi */,
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 24.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ely4gcre' /* Tanımlanamayan bildirim */,
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.notification?.time,
                        '10:42',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ].divide(SizedBox(width: 21.0)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 1.0,
            decoration: BoxDecoration(
              color: Color(0x7FF7DED0),
            ),
          ),
        ],
      ),
    );
  }
}
