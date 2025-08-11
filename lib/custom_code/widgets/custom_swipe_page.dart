// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import '/pages/swipe/swipe_screen/swipe_screen_model.dart';
import '/backend/api_requests/api_calls.dart';

import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;

import '/components/custom_sheets/report_sheet/report_sheet_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/swipe/swipe_page_item/swipe_page_item_widget.dart';
import '/components/swipe_done_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../pages/home_page/home_page_widget.dart';
import '../../pages/settings/prefered_dog_screen/prefered_dog_screen_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSwipePage extends StatefulWidget {
  const CustomSwipePage({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;

  @override
  State<CustomSwipePage> createState() => _CustomSwipePageState();
}

class _CustomSwipePageState extends State<CustomSwipePage> {
  late SwipeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var shakeActionInProgress = false;
  var swipeableStackController = CardSwiperController();
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.getCurrentUser(context);
      _model.loading = true;
      safeSetState(() {});
      _model.packageDetailsResponse =
          await StaticValuesGroup.packageDetailsCall.call();

      if ((_model.packageDetailsResponse?.succeeded ?? true)) {
        FFAppState().PackageDetails =
            PackageDetailsStruct.maybeFromMap(getJsonField(
          (_model.packageDetailsResponse?.jsonBody ?? ''),
          r'''$.record''',
        ))!;
      }
      await _model.getswipelist(context);
      safeSetState(() {});
      _model.loading = false;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
                children: [
                  custom_widgets.TopSafePaddingWidget(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 1.0,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 15.0,
                            borderWidth: 1.0,
                            buttonSize: 49.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.menu,
                              color: FlutterFlowTheme.of(context).secondary,
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
                          Builder(
                            builder: (context) {
                              if ((_model.swipes.length > 0) &&
                                  (_model.loading != true) &&
                                  !_model.isNotRemainingSwipe &&
                                  (_model.showSwipe == 1)) {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        ApiCallResponse apiResultwb3 =
                                            await UserActionsGroup
                                                .sendFriendRequestCall
                                                .call(
                                          userId: _model
                                              .swipes[_model.swipeIndex]
                                              .user
                                              .id,
                                        );

                                        if ((apiResultwb3?.succeeded ?? true)) {
                                          if (getJsonField(
                                                (apiResultwb3?.jsonBody ?? ''),
                                                r'''$.message''',
                                              ) !=
                                              null) {
                                            ScaffoldMessenger.of(appNavigatorKey
                                                    .currentContext!)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (apiResultwb3?.jsonBody ??
                                                        ''),
                                                    r'''$.message''',
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .info,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .success,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(appNavigatorKey
                                                    .currentContext!)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  FFLocalizations.of(
                                                          appNavigatorKey
                                                              .currentContext!)
                                                      .getVariableText(
                                                    trText:
                                                        'Arkadaşlık isteği gönderildi',
                                                    enText:
                                                        'Friend Request Sent',
                                                  ),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .info,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .success,
                                              ),
                                            );
                                          }
                                        } else {
                                          if (getJsonField(
                                                (apiResultwb3?.jsonBody ?? ''),
                                                r'''$.message''',
                                              ) !=
                                              null) {
                                            ScaffoldMessenger.of(appNavigatorKey
                                                    .currentContext!)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (apiResultwb3?.jsonBody ??
                                                        ''),
                                                    r'''$.message''',
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .info,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .error,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(appNavigatorKey
                                                    .currentContext!)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  FFLocalizations.of(
                                                          appNavigatorKey
                                                              .currentContext!)
                                                      .getVariableText(
                                                    trText:
                                                        'Bir hata oluştu lütfen tekrar deneyin.',
                                                    enText:
                                                        'An error occured please try again.',
                                                  ),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .info,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(
                                                            appNavigatorKey
                                                                .currentContext!)
                                                        .error,
                                              ),
                                            );
                                          }
                                        }

                                        //safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 49.0,
                                        height: 49.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 12.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/add_friend_orange.svg',
                                                width: 200.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                );
                              } else {
                                return Visibility(
                                  visible: _model.showSwipe != 1,
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).info,
                                    borderRadius: 15.0,
                                    borderWidth: 1.0,
                                    buttonSize: 49.0,
                                    fillColor: Color(0x00F25822),
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 28.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Builder(
                            builder: (context) {
                              if (FFAppState().CurrentUser.activeDog.title !=
                                  '') {
                                return Builder(
                                  builder: (context) {
                                    if ((_model.swipes.length > 0) &&
                                        (_model.loading != true) &&
                                        !_model.isNotRemainingSwipe) {
                                      return Builder(
                                        builder: (context) {
                                          final swipeItem =
                                              _model.swipes.toList();
                                          return CardSwiper(
                                            controller:
                                                swipeableStackController,
                                            onSwipe: (previousIndex,
                                                currentIndex, direction) async {
                                              _model.swipeIndex = previousIndex;

                                              final swipeItemItem =
                                                  swipeItem[previousIndex];
                                              if (direction ==
                                                  CardSwiperDirection.left) {
                                                _model.onSwipe(
                                                  context,
                                                  swipedId:
                                                      swipeItemItem.dog.id,
                                                  swipeType: 'reject',
                                                );
                                                _model.declineLottieVisible =
                                                    true;
                                                safeSetState(() {});
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1009),
                                                    () {
                                                  _model.declineLottieVisible =
                                                      false;
                                                  safeSetState(() {});
                                                });
                                              } else if (direction ==
                                                  CardSwiperDirection.right) {
                                                _model.onSwipe(
                                                  context,
                                                  swipedId:
                                                      swipeItemItem.dog.id,
                                                  swipeType: 'like',
                                                );
                                                _model.harthLottieVisible =
                                                    true;
                                                safeSetState(() {});
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1280),
                                                    () {
                                                  _model.harthLottieVisible =
                                                      false;
                                                  safeSetState(() {});
                                                });
                                              } else if (direction ==
                                                  CardSwiperDirection.bottom) {
                                                _model.onSwipe(
                                                  context,
                                                  swipedId:
                                                      swipeItemItem.dog.id,
                                                  swipeType: 'slide',
                                                );
                                              }

                                              await _model
                                                  .checkRemainingSwipe(context);

                                              if (previousIndex ==
                                                  _model.swipes.length - 1) {
                                                _model.loading = true;
                                                safeSetState(() {});
                                                await _model
                                                    .getswipelist(context);
                                                safeSetState(() {});
                                                _model.loading = false;
                                                safeSetState(() {});
                                              }
                                              safeSetState(() {});
                                              return true;
                                            },
                                            cardsCount: swipeItem.length,
                                            cardBuilder: (context,
                                                index,
                                                percentThresholdX,
                                                percentThresholdY) {
                                              final swipeItemItem =
                                                  swipeItem[index];
                                              int alpha = (percentThresholdX < 0
                                                      ? ((percentThresholdX) *
                                                                  (-1) >
                                                              255
                                                          ? 150
                                                          : ((percentThresholdX) *
                                                              (-1) /
                                                              3))
                                                      : ((percentThresholdX) >
                                                              255
                                                          ? 150
                                                          : percentThresholdX /
                                                              3))
                                                  .ceil();
                                              return Stack(
                                                children: [
                                                  SwipePageItemWidget(
                                                    key: Key(
                                                        'Key4py_${index}_of_${swipeItem.length}'),
                                                    isShowActive:
                                                        _model.isFullView,
                                                    initialPage: 0,
                                                    item: swipeItemItem,
                                                    onClickCenter: () async {
                                                      _model.isFullView =
                                                          !_model.isFullView;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  if (percentThresholdX != 0.0)
                                                    Container(
                                                      color: percentThresholdX <
                                                              0
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .error
                                                              .withAlpha(alpha)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .success
                                                              .withAlpha(alpha),
                                                      width: MediaQuery.sizeOf(
                                                              context)
                                                          .width,
                                                      height: MediaQuery.sizeOf(
                                                              context)
                                                          .height,
                                                      alignment:
                                                          Alignment.center,
                                                      child: FaIcon(
                                                        percentThresholdX < 0
                                                            ? FontAwesomeIcons
                                                                .solidThumbsDown
                                                            : FontAwesomeIcons
                                                                .solidThumbsUp,
                                                        color: Colors.white,
                                                        size: percentThresholdX < 0
                                                            ? (percentThresholdX *
                                                                    (-1)) /
                                                                2
                                                            : percentThresholdX
                                                                    .toDouble() /
                                                                2,
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.91, -0.97),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 64.0,
                                                      icon: Icon(
                                                        Icons.report_problem,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 48.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.8,
                                                                  child:
                                                                      ReportSheetWidget(
                                                                    reportType:
                                                                        'dog',
                                                                    reportingId:
                                                                        swipeItemItem
                                                                            .dog
                                                                            .id,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                            isLoop: false,
                                            maxAngle: 60,
                                            threshold: 50,
                                            scale: 1.0,
                                            padding: EdgeInsets.zero,
                                            backCardOffset: const Offset(0, 0),
                                            numberOfCardsDisplayed: 1,
                                            allowedSwipeDirection:
                                                AllowedSwipeDirection.only(
                                                    left: true, right: true),
                                          );
                                        },
                                      );
                                    } else if ((_model.swipes.length == 0) &&
                                        (_model.isNotRemainingSwipe != true) &&
                                        (!_model.loading)) {
                                      return SwipeDoneCardWidget();
                                    } else if (_model.loading) {
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondary
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, 1.0),
                                            end: AlignmentDirectional(0, -1.0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Lottie.asset(
                                              'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/not_remaining.svg',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.31),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/info_box.svg',
                                                      width: 259.0,
                                                      height: 83.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.3, 0.3),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 75.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                                  trText:
                                                                      'Endişelenme, günlük  ücretsiz kaydırma hakkına sahipsin',
                                                                  enText:
                                                                      'Don’t forget, you have \nfree 25 swipes per day'),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFFDDB08A),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -0.5),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                        trText:
                                                            'Ücretsiz Kaydırma Hakkını Bitirdin',
                                                        enText:
                                                            "You finished your free swipes"),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.01),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.6,
                                                decoration: BoxDecoration(),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'feh430yl' /* Satın Al  */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Manrope',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: "\$0.99 \n",
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: FFLocalizations
                                                                .of(context)
                                                            .getVariableText(
                                                                trText:
                                                                    "100 Kaydırma için",
                                                                enText:
                                                                    "For 100 Swipes"),
                                                        style: TextStyle(),
                                                      ),
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/backswipe-bg-area.svg',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -0.5),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                trText:
                                                    'henüz bir aktif köpek seçmediniz',
                                                enText:
                                                    'you haven\'t selected an active dog',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        lineHeight: 1.11,
                                                      ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/havent-active-dog.png',
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          74.0, 0.0, 74.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            trText: 'Lütfen ',
                                                            enText: 'Please ',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.0,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            trText:
                                                                'aktif köpeğinizi seçin',
                                                            enText:
                                                                'select your active dog on Patido',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      if (_model.isFullView == false)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
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
                          child: Builder(
                            builder: (context) {
                              if (FFAppState().CurrentUser.activeDog.title !=
                                  '') {
                                return Builder(
                                  builder: (context) {
                                    if (!_model.isFullView &&
                                        (_model.swipes.length > 0) &&
                                        !_model.isNotRemainingSwipe) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 27.0, 0.0, 32.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                swipeableStackController
                                                    .swipeLeft();
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 15.0,
                                                shape: const CircleBorder(),
                                                child: Container(
                                                  width: 94.0,
                                                  height: 94.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.close_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 36.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                swipeableStackController
                                                    .swipeRight();
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 15.0,
                                                shape: const CircleBorder(),
                                                child: Container(
                                                  width: 94.0,
                                                  height: 94.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/solar_heart-bold.svg',
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 24.0)),
                                        ),
                                      );
                                    } else if (_model.isNotRemainingSwipe) {
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 53.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                bool revenuecatOutput =
                                                    await actions
                                                        .purchasePackage(
                                                  FFAppState()
                                                      .InAppPurchaseConfiguration
                                                      .packageIdenfitier,
                                                );
                                                if (revenuecatOutput) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          trText:
                                                              'Satın Alma Başarılı',
                                                          enText:
                                                              'Purchase Successfull',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0xFF19AD85),
                                                    ),
                                                  );
                                                  Future.delayed(
                                                      Duration(seconds: 6),
                                                      () async {
                                                    _model.loading = true;
                                                    safeSetState(() {});
                                                    await _model
                                                        .getswipelist(context);
                                                    safeSetState(() {});
                                                    _model.loading = false;
                                                    safeSetState(() {});
                                                  });
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          trText:
                                                              'Satın Alma Başarısız',
                                                          enText:
                                                              'Purchase Unsuccessfull',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getVariableText(
                                                trText: 'ŞİMDİ SATIN AL',
                                                enText: 'BUY NOW',
                                              ),
                                              options: FFButtonOptions(
                                                height: 52.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        45.0, 12.0, 45.0, 12.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          letterSpacing: 1.8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 5.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 53.0, 0.0, 53.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                    HomePageWidget.routeName);
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getVariableText(
                                                trText: 'HARİTAYA DÖN',
                                                enText: 'BACK TO MAP',
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        45.0, 12.0, 45.0, 12.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          letterSpacing: 1.8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 5.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 53.0, 0.0, 53.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                          PreferedDogScreenWidget.routeName);
                                    },
                                    text: FFLocalizations.of(context)
                                        .getVariableText(
                                      trText: 'KÖPEK SEÇ',
                                      enText: 'SELECT DOG',
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          45.0, 12.0, 45.0, 12.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 1.8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                  if (_model.loading == true)
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).secondary
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/jsons/loading_white.json',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        if (_model.harthLottieVisible)
          Lottie.asset(
            'assets/jsons/Animation_-_1741764568119.json',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            fit: BoxFit.contain,
            frameRate: FrameRate(24.0),
            repeat: false,
            animate: true,
          ),
        if (_model.declineLottieVisible)
          Lottie.asset(
            'assets/jsons/Animation_-_1741764597350.json',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            fit: BoxFit.contain,
            frameRate: FrameRate(24.0),
            repeat: false,
            animate: true,
          ),
      ],
    );
  }
}
