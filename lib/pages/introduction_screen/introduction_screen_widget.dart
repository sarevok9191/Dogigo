import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'introduction_screen_model.dart';
export 'introduction_screen_model.dart';

class IntroductionScreenWidget extends StatefulWidget {
  const IntroductionScreenWidget({super.key});

  static String routeName = 'IntroductionScreen';
  static String routePath = 'introductionScreen';

  @override
  State<IntroductionScreenWidget> createState() =>
      _IntroductionScreenWidgetState();
}

class _IntroductionScreenWidgetState extends State<IntroductionScreenWidget> {
  late IntroductionScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Headline colors
  Color heroBaseColor = Colors.black;              // "Where Dogs Make"
  Color heroAccentColor = const Color(0xFFF25822); // "Best Friends."

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroductionScreenModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.requestTrackingPermission();
      FFAppState().AppMounted = true;
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    // =================== Responsive tokens ===================
    final size = MediaQuery.sizeOf(context);
    final w = size.width;
    final h = size.height;
    final minSide = math.min(w, h);

    // Spacing
    final sidePad = (w * 0.08).clamp(16.0, 32.0);
    final topLogoPad = (h * 0.09).clamp(56.0, 100.0);
    final gapXs = (w * 0.02).clamp(4.0, 10.0);
    final gapSm = (w * 0.03).clamp(8.0, 14.0);
    final gapMd = (w * 0.05).clamp(16.0, 28.0);

    // Logo
    final logoW = (w * 0.26).clamp(88.0, 140.0);
    final logoH = (logoW * 0.5).clamp(36.0, 64.0);

    // App name
    final appNameSize = (w * 0.11).clamp(28.0, 48.0);

    // Hero text
    final heroFontSize = (w * 0.085).clamp(24.0, 40.0);
    final headlineGap = (w * 0.02).clamp(6.0, 12.0);
    final subtitleTopGap = (w * 0.06).clamp(20.0, 36.0);
    final subtitleFont = (w * 0.04).clamp(13.0, 16.0);
    const subtitleLineHeight = 1.5;

    // Artwork
    final imageHeight = math.min(w * 0.72, h * 0.42);
    // IMPORTANT: no overlap now
    final pullUp = 0.0;

    // Buttons
    final buttonHeight = (w * 0.14).clamp(48.0, 56.0);
    final buttonRadius = (w * 0.085).clamp(24.0, 36.0);
    final buttonText = (w * 0.04).clamp(14.0, 16.0);
    final bottomButtonsPad =
        (h * 0.04 + MediaQuery.of(context).padding.bottom).clamp(24.0, 48.0);

    // Reserve space inside the content so it never sits under fixed buttons
    final contentBottomReserve = bottomButtonsPad + buttonHeight + gapSm + 8.0;

    List<BoxShadow> bottomLiftShadow() => [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 24,
            spreadRadius: 0,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFEEEE9), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.2],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  // ============ LANGUAGE SELECTOR ============
                  Positioned(
                    top: (h * 0.015).clamp(8.0, 16.0),
                    right: (w * 0.04).clamp(12.0, 20.0),
                    child: const _LanguageChip(),
                  ),

                  // ===================== MAIN CONTENT =====================
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: contentBottomReserve),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Top logo + app name
                            Padding(
                              padding: EdgeInsets.only(top: topLogoPad),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/login-logo.svg',
                                    width: logoW,
                                    height: logoH,
                                  ),
                                  SizedBox(height: gapXs),
                                  Text(
                                    FFLocalizations.of(context)
                                        .getText('hkf2u7xg' /* Patido */),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: GoogleFonts.kumbhSans(
                                            fontWeight: FontWeight.bold,
                                          ).fontFamily,
                                          color:
                                              FlutterFlowTheme.of(context).primary,
                                          fontSize: appNameSize,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),

                            // Image + Headline stack
                            Padding(
                              padding: EdgeInsets.only(top: gapSm),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.topCenter,
                                        children: [
                                          // Image
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: sidePad),
                                            child: SizedBox(
                                              height: imageHeight,
                                              child: Image.asset(
                                                'assets/images/introscreendogs.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          // Headline + subtitle (no overlap)
                                          Positioned(
                                            bottom: -pullUp, // == 0
                                            left: sidePad,
                                            right: sidePad,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Where Dogs Make',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: heroFontSize,
                                                    height: 1.1,
                                                    color: heroBaseColor,
                                                  ),
                                                ),
                                                SizedBox(height: headlineGap),
                                                Text(
                                                  'Best Friends.',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: heroFontSize,
                                                    height: 1.1,
                                                    color: heroAccentColor,
                                                  ),
                                                ),
                                                SizedBox(height: subtitleTopGap),
                                                Text(
                                                  'Connect with local dog owners, plan playdates,\nand find furry friends nearby!',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.manrope(
                                                    fontSize: subtitleFont,
                                                    fontWeight: FontWeight.w500,
                                                    height: subtitleLineHeight,
                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // With no overlap, just a normal gap below the stack
                                      SizedBox(height: gapMd),

                                      // Orange separator line
                                      Center(
                                        child: Container(
                                          width: (w * 0.18).clamp(48.0, 80.0),
                                          height:
                                              (minSide * 0.012).clamp(4.0, 8.0),
                                          decoration: BoxDecoration(
                                            color: heroAccentColor,
                                            borderRadius:
                                                BorderRadius.circular(999),
                                            boxShadow: bottomLiftShadow(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: gapSm),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Buttons (fixed to bottom)
                  Positioned(
                    bottom: bottomButtonsPad,
                    left: sidePad,
                    right: sidePad,
                    child: Row(
                      children: [
                        // Login (outlined)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(buttonRadius),
                              border: Border.all(
                                color: const Color(0xFFF25822),
                                width: 2.0,
                              ),
                              color: Colors.transparent,
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.clearNavigate(
                                  'LoginScreen',
                                  <String, dynamic>{},
                                );
                              },
                              text: FFLocalizations.of(context)
                                  .getText('7se73sei' /* GİRİŞ YAP */),
                              options: FFButtonOptions(
                                height: buttonHeight,
                                color: Colors.transparent,
                                textStyle: GoogleFonts.manrope(
                                  color: const Color(0xFFF25822),
                                  fontSize: buttonText,
                                  fontWeight: FontWeight.bold,
                                ),
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.circular(buttonRadius),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: gapSm),
                        // Register (gradient + bottom-lift shadow)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(buttonRadius),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF79E7F), Color(0xFFF25822)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: bottomLiftShadow(),
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  RegisterScreenWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: const Duration(
                                        milliseconds: 0,
                                      ),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context)
                                  .getText('akokz5se' /* KAYIT OL */),
                              options: FFButtonOptions(
                                height: buttonHeight,
                                color: Colors.transparent,
                                textStyle: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontSize: buttonText,
                                  fontWeight: FontWeight.bold,
                                ),
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.circular(buttonRadius),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Language chip with responsive sizing; decides EN/TR from current locale.
class _LanguageChip extends StatelessWidget {
  const _LanguageChip();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final chipH = (w * 0.09).clamp(32.0, 40.0);
    final padH = (w * 0.03).clamp(10.0, 14.0);
    final iconSize = (chipH * 0.45).clamp(14.0, 18.0);
    final textSize = (w * 0.036).clamp(12.0, 14.0);
    final menuMinW = (w * 0.36).clamp(120.0, 180.0);

    final isTR = FFLocalizations.of(context).languageCode == 'tr';
    final currentLang = isTR ? 'TR' : 'EN';

    return PopupMenuButton<String>(
      onSelected: (value) async {
        if (value == 'EN') {
          setAppLanguage(context, 'en');
        } else {
          setAppLanguage(context, 'tr');
        }
        await action_blocks.getStaticValues(context);
      },
      elevation: 8,
      offset: Offset(0, chipH),
      color: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: BoxConstraints(minWidth: menuMinW),
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          value: 'EN',
          child: Row(
            children: [
              const Text('🇬🇧', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 10),
              Text(
                'EN',
                style: GoogleFonts.manrope(
                  fontSize: textSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'TR',
          child: Row(
            children: [
              const Text('🇹🇷', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 10),
              Text(
                'TR',
                style: GoogleFonts.manrope(
                  fontSize: textSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
      child: Container(
        height: chipH,
        padding: EdgeInsets.symmetric(horizontal: padH),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(chipH / 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.public_outlined,
                size: iconSize, color: Colors.black.withOpacity(0.75)),
            const SizedBox(width: 6),
            Text(
              currentLang,
              style: GoogleFonts.manrope(
                fontSize: textSize,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.85),
              ),
            ),
            const SizedBox(width: 2),
            Icon(Icons.keyboard_arrow_down_rounded,
                size: iconSize, color: Colors.black.withOpacity(0.65)),
          ],
        ),
      ),
    );
  }
}
