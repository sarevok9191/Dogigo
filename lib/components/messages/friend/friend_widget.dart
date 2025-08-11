import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'friend_model.dart';
export 'friend_model.dart';

class FriendWidget extends StatefulWidget {
  const FriendWidget({
    super.key,
    required this.friend,
    this.onRunChangeAbleAction,
  });

  final FriendTypeStruct? friend;
  final Future Function()? onRunChangeAbleAction;

  @override
  State<FriendWidget> createState() => _FriendWidgetState();
}

class _FriendWidgetState extends State<FriendWidget> {
  late FriendModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(21.0, 19.0, 26.0, 18.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                FriendProfileScreenWidget.routeName,
                queryParameters: {
                  'id': serializeParam(
                    widget.friend?.id,
                    ParamType.int,
                  ),
                  'chatToken': serializeParam(
                    widget.friend?.chatToken,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
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
                        imageUrl: widget.friend!.avatar.url,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.friend?.firstName,
                          'FriendName',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                    ),
                    Builder(
                      builder: (context) {
                        if (!_model.loading) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.loading = true;
                                  safeSetState(() {});
                                  _model.apiResult0iz =
                                      await FriendsGroup.blockUserCall.call(
                                    id: widget.friend?.id,
                                  );

                                  if ((_model.apiResult0iz?.succeeded ??
                                      true)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.apiResult0iz?.jsonBody ??
                                                ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0xFF1D9567),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.apiResult0iz?.jsonBody ??
                                                ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    );
                                  }

                                  _model.loading = false;
                                  safeSetState(() {});
                                  await widget.onRunChangeAbleAction?.call();

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00F7DED0),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFFFCBD7B),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.block_sharp,
                                    color: Color(0xFFFCBD7B),
                                    size: 18.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    MessageScreenWidget.routeName,
                                    queryParameters: {
                                      'token': serializeParam(
                                        widget.friend?.chatToken,
                                        ParamType.String,
                                      ),
                                      'receiverId': serializeParam(
                                        widget.friend?.id,
                                        ParamType.int,
                                      ),
                                      'receiverPhoto': serializeParam(
                                        widget.friend?.avatar.url,
                                        ParamType.String,
                                      ),
                                      'receiverName': serializeParam(
                                        widget.friend?.firstName,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00F7DED0),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFFFCBD7B),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.chat_bubble_outline,
                                    color: Color(0xFFFCBD7B),
                                    size: 18.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.loading = true;
                                  safeSetState(() {});
                                  _model.touchResponse =
                                      await UserActionsGroup.touchCall.call(
                                    touchedUser: widget.friend?.id,
                                  );

                                  if ((_model.touchResponse?.succeeded ??
                                      true)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.touchResponse?.jsonBody ??
                                                ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0xFF1D9567),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.touchResponse?.jsonBody ??
                                                ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    );
                                  }

                                  _model.loading = false;
                                  safeSetState(() {});
                                  await widget.onRunChangeAbleAction?.call();

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00F7DED0),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFFFCBD7B),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.paw,
                                    color: Color(0xFFFCBD7B),
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          );
                        } else {
                          return Lottie.asset(
                            'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.contain,
                            animate: true,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ].divide(SizedBox(width: 20.0)),
      ),
    );
  }
}
