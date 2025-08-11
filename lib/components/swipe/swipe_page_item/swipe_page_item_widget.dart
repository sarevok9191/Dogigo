import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'swipe_page_item_model.dart';
export 'swipe_page_item_model.dart';

class SwipePageItemWidget extends StatefulWidget {
  const SwipePageItemWidget({
    super.key,
    bool? isShowActive,
    this.initialPage,
    required this.item,
    this.onClickCenter,
  }) : this.isShowActive = isShowActive ?? true;

  final bool isShowActive;
  final int? initialPage;
  final SwipeItemStruct? item;
  final Future Function()? onClickCenter;

  @override
  State<SwipePageItemWidget> createState() => _SwipePageItemWidgetState();
}

class _SwipePageItemWidgetState extends State<SwipePageItemWidget> {
  late SwipePageItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipePageItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToDefaultUserImageList(ProfilePhotoTypeStruct(
        url: widget.item?.user.avatar.url,
      ));
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) async {
        if (details.globalPosition.dx <
            (MediaQuery.sizeOf(context).width * 0.2)) {
          if (_model.showPeople) {
            await _model.pageViewController1?.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          } else {
            await _model.pageViewController2?.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          }
        } else {
          if (details.globalPosition.dx >
              (MediaQuery.sizeOf(context).width * 0.8)) {
            if (_model.showPeople) {
              await _model.pageViewController1?.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            } else {
              await _model.pageViewController2?.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          } else {
            await widget.onClickCenter?.call();
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                if (_model.showPeople) {
                  return Builder(
                    builder: (context) {
                      final swipeItemImage =
                          (widget.item?.user.images.length == 0
                                      ? _model.defaultUserImageList
                                      : widget.item?.user.images)
                                  ?.toList() ??
                              [];

                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Stack(
                          children: [
                            PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _model.pageViewController1 ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(
                                              valueOrDefault<int>(
                                                widget.initialPage,
                                                0,
                                              ),
                                              swipeItemImage.length - 1))),
                              scrollDirection: Axis.horizontal,
                              itemCount: swipeItemImage.length,
                              itemBuilder: (context, swipeItemImageIndex) {
                                final swipeItemImageItem =
                                    swipeItemImage[swipeItemImageIndex];
                                return Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00F7DED0),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        child:
                                            custom_widgets.LoadingImageNetwork(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          url: swipeItemImageItem.url,
                                          fit: 'cover',
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x000A0A0A),
                                            Color(0xCC0A0A0A)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 9.0, 0.0, 0.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController1 ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  valueOrDefault<int>(
                                                    widget.initialPage,
                                                    0,
                                                  ),
                                                  swipeItemImage.length - 1))),
                                  count: swipeItemImage.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController1!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    safeSetState(() {});
                                  },
                                  effect: smooth_page_indicator.SlideEffect(
                                    spacing: 7.0,
                                    radius: 20.0,
                                    dotWidth: 117.0,
                                    dotHeight: 4.0,
                                    dotColor: Color(0x650A0A0A),
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
                  );
                } else {
                  return Builder(
                    builder: (context) {
                      final swipeItemImage =
                          widget.item?.dog.images.toList() ?? [];

                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Stack(
                          children: [
                            PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _model.pageViewController2 ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(
                                              valueOrDefault<int>(
                                                widget.initialPage,
                                                0,
                                              ),
                                              swipeItemImage.length - 1))),
                              scrollDirection: Axis.horizontal,
                              itemCount: swipeItemImage.length,
                              itemBuilder: (context, swipeItemImageIndex) {
                                final swipeItemImageItem =
                                    swipeItemImage[swipeItemImageIndex];
                                return Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00F7DED0),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        child:
                                            custom_widgets.LoadingImageNetwork(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          url: swipeItemImageItem.url,
                                          fit: 'cover',
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x000A0A0A),
                                            Color(0xCC0A0A0A)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 9.0, 0.0, 0.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController2 ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  valueOrDefault<int>(
                                                    widget.initialPage,
                                                    0,
                                                  ),
                                                  swipeItemImage.length - 1))),
                                  count: swipeItemImage.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController2!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    safeSetState(() {});
                                  },
                                  effect: smooth_page_indicator.SlideEffect(
                                    spacing: 7.0,
                                    radius: 20.0,
                                    dotWidth: 117.0,
                                    dotHeight: 4.0,
                                    dotColor: Color(0x650A0A0A),
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
                  );
                }
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                ),
                decoration: BoxDecoration(
                  color: Color(0x00F7DED0),
                ),
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 0.0, 19.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.item?.online == true)
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
                                  'zwvtx5gt' /* ÇEVRİMİÇİ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF1A5319),
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 9.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.showPeople
                                    ? widget.item?.user.firstName
                                    : widget.item?.dog.title,
                                'İsim',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.kumbhSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 35.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
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
                            valueOrDefault<String>(
                              functions.calculateAge(_model.showPeople == true
                                  ? widget.item?.user.dateBirth
                                  : widget.item?.dog.birthDate),
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.kumbhSans(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 35.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 11.0)),
                      ),
                      if ((widget.item?.dog.dogType != null) &&
                          (_model.showPeople != true))
                        Text(
                          valueOrDefault<String>(
                            widget.item?.dog.dogType.title,
                            'Cins',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: valueOrDefault<String>(
                                formatNumber(
                                  widget.item?.distance,
                                  formatType: FormatType.custom,
                                  format: '#,##0.00',
                                  locale: '',
                                ),
                                '0.0',
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
                                    color: Color(0xB2FFFFFF),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget.item?.distanceUnit,
                                'm',
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
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.showPeople = !_model.showPeople;
                                  safeSetState(() {});
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                    height: 79.0,
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
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/dots-green.svg',
                                                        width: 200.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                        child: Image.network(
                                                          _model.showPeople
                                                              ? widget
                                                                  .item!
                                                                  .dog
                                                                  .avatar
                                                                  .url
                                                              : widget
                                                                  .item!
                                                                  .user
                                                                  .avatar
                                                                  .url,
                                                          width: 48.0,
                                                          height: 48.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              _model.showPeople
                                                                  ? widget
                                                                      .item
                                                                      ?.dog
                                                                      .title
                                                                  : widget
                                                                      .item
                                                                      ?.user
                                                                      .firstName,
                                                              'Name',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .kumbhSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (functions.calcAgeInteger(
                                                          _model.showPeople
                                                              ? widget
                                                                  .item
                                                                  ?.dog
                                                                  .birthDate
                                                              : widget
                                                                  .item
                                                                  ?.user
                                                                  .dateBirth) >
                                                      0)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions.calculateAge(
                                                              _model.showPeople
                                                                  ? widget
                                                                      .item
                                                                      ?.dog
                                                                      .birthDate
                                                                  : widget
                                                                      .item
                                                                      ?.user
                                                                      .dateBirth),
                                                          'Age',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .kumbhSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xB2FFFFFF),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 3.0))
                                            .addToStart(SizedBox(width: 0.0))
                                            .addToEnd(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                      if (widget.isShowActive)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 28.0, 0.0, 12.0),
                          child: Text(
                            widget.item!.dog.description,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                    ].divide(SizedBox(height: 2.0)),
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
