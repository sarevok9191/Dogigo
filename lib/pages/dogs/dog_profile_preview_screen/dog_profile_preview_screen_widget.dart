import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dog_profile_preview_screen_model.dart';
export 'dog_profile_preview_screen_model.dart';

class DogProfilePreviewScreenWidget extends StatefulWidget {
  const DogProfilePreviewScreenWidget({
    super.key,
    required this.id,
    required this.dogInfos,
  });

  final int? id;
  final DogTypeStruct? dogInfos;

  static String routeName = 'DogProfilePreviewScreen';
  static String routePath = 'dogProfilePreviewScreen';

  @override
  State<DogProfilePreviewScreenWidget> createState() =>
      _DogProfilePreviewScreenWidgetState();
}

class _DogProfilePreviewScreenWidgetState
    extends State<DogProfilePreviewScreenWidget> {
  late DogProfilePreviewScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DogProfilePreviewScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  custom_widgets.TopSafePaddingWidget(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/dogs_white.svg',
                        width: 96.0,
                        height: 48.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: Builder(
                        builder: (context) {
                          final dogImages =
                              widget.dogInfos?.images.toList() ?? [];

                          return Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0, min(0, dogImages.length - 1))),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: dogImages.length,
                                  itemBuilder: (context, dogImagesIndex) {
                                    final dogImagesItem =
                                        dogImages[dogImagesIndex];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 579.0,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              dogImagesItem.url,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.01),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 278.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0x000A0A0A),
                                                    Color(0xCB0A0A0A)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(
                                                  0,
                                                  min(0,
                                                      dogImages.length - 1))),
                                      count: dogImages.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        safeSetState(() {});
                                      },
                                      effect: smooth_page_indicator.SlideEffect(
                                        spacing: 8.0,
                                        radius: 20.0,
                                        dotWidth: 70.0,
                                        dotHeight: 4.0,
                                        dotColor: Color(0x670A0A0A),
                                        activeDotColor:
                                            FlutterFlowTheme.of(context).info,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            19.0, 0.0, 19.0, 8.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0x00F7DED0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Container(
                                  width: 100.0,
                                  height: 27.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF51F854),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 18.0,
                                        color: Color(0xFF79E67B),
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3uobw8j2' /* ÇEVRİMİÇİ */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF1A5319),
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.dogInfos?.title,
                                      'Leslie',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'jsMath',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 35.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Container(
                                    width: 1.0,
                                    height: 38.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  Text(
                                    functions.calculateAge(
                                        widget.dogInfos?.birthDate),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'jsMath',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 35.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 11.0)),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'axd4cv2w' /* 1,2 km */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xB3FFFFFF),
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.65,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFB073),
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 69.0,
                                              height: 69.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00F7DED0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/dots-on-image-white.svg',
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 72.0,
                                                    height: 72.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.network(
                                                          FFAppState()
                                                              .CurrentUser
                                                              .avatar
                                                              .url,
                                                        ).image,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFAppState().CurrentUser.firstName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'jsMath',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  functions.calculateAge(
                                                      FFAppState()
                                                          .CurrentUser
                                                          .dateBirth),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'jsMath',
                                                        color:
                                                            Color(0xB2FFFFFF),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ],
                                      ),
                                    ]
                                        .divide(SizedBox(width: 10.0))
                                        .addToStart(SizedBox(width: 12.0))
                                        .addToEnd(SizedBox(width: 24.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              constraints: BoxConstraints(
                maxHeight: 130.0,
              ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'rt3ebpr6' /* PROFİLE GERİ DÖN */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          60.0, 12.0, 60.0, 12.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
