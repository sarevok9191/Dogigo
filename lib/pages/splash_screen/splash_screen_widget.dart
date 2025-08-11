// lib/pages/auth/register_screen/register_screen_widget.dart

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({
    super.key,
    this.nextPageData,
    String? nextPage,
  }) : this.nextPage = nextPage ?? 'IntroductionScreen';

  final dynamic nextPageData;
  final String nextPage;

  static String routeName = 'SplashScreen';
  static String routePath = 'splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(() async {
        await action_blocks.getInAppPurchaseConfigurationBlock(context);
      }());
      unawaited(() async {
        await actions.syncAppStateFirebaseUser();
      }());
      unawaited(() async {
        await actions.listenUserLocation();
      }());
      unawaited(() async {
        await action_blocks.getStaticValues(context);
      }());
      await actions.splashCheck(
        widget.nextPage,
        widget.nextPageData,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent, // make scaffold itself transparent
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                 colors: [Color(0xFFFEEEE9), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 72.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/login-logo.svg',
                            width: 96.0,
                            height: 48.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ckssmlpp' /* Patido */,
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 45.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Lottie.asset(
                          'assets/jsons/lottieflow-cta-04-f25822-easey.json',
                          width: 110.0,
                          height: 110.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
