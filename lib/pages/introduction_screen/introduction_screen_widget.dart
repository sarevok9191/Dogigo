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

  // Headline controls (color-split + adjustable size)
  double heroFontSize = 32.0;
  Color heroBaseColor = Colors.black;                // "Where Dogs Make"
  Color heroAccentColor = const Color(0xFFF25822);   // "Best Friends."

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

    // Spacing controls INSIDE build for hot-reload friendliness
    final double headlineGap = 8.0;        // gap between "Where Dogs Make" and "Best Friends."
    final double subtitleTopGap = 32.0;    // gap between headline and subtitle
    final double subtitleLineHeight = 1.5; // subtitle internal line-height

    final size = MediaQuery.of(context).size;
    final imageHeight = size.width * 0.78;
    final pullUpFactor = 0.40;
    final pullUp = size.width * pullUpFactor;

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
                  // ============ LANGUAGE SELECTOR (restyled to match left design) ============
                  Positioned(
                    top: 12,
                    right: 16,
                    child: _LanguageChip(
                      currentLang: (_model.currentLanguage ?? (FFLocalizations.of(context).languageCode == 'tr' ? 'TR' : 'EN')),
                      onSelected: (value) async {
                        // keep side effects as before
                        if (value == 'EN') {
                          setAppLanguage(context, 'en');
                        } else {
                          setAppLanguage(context, 'tr');
                        }
                        _model.currentLanguage = value;
                        setState(() {});
                        await action_blocks.getStaticValues(context);
                      },
                    ),
                  ),

                  // ===================== MAIN CONTENT =====================
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Top logo + app name
                        Padding(
                          padding: const EdgeInsets.only(top: 75.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/images/login-logo.svg',
                                width: 96.0,
                                height: 48.0,
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                FFLocalizations.of(context).getText('hkf2u7xg' /* Patido */),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.kumbhSans(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 45.0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Image + Headline stack
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
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
                                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                        child: SizedBox(
                                          height: imageHeight,
                                          child: Image.asset(
                                            'assets/images/introscreendogs.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      // Headline + subtitle pulled up
                                      Positioned(
                                        bottom: -pullUp,
                                        left: 20,
                                        right: 20,
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
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                height: subtitleLineHeight,
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: pullUp + 24),

                                  // Orange separator line
                                  Center(
                                    child: Container(
                                      width: 64,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: heroAccentColor,
                                        borderRadius: BorderRadius.circular(999),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                ],
                              );
                            },
                          ),
                        ),

                        const Spacer(),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),

                  // Buttons
                  Positioned(
                    bottom: 32.0,
                    left: 32.0,
                    right: 32.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              border: Border.all(color: const Color(0xFFF25822), width: 2.0),
                              color: Colors.transparent,
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.clearNavigate('LoginScreen', <String, dynamic>{});
                              },
                              text: FFLocalizations.of(context).getText('7se73sei' /* GİRİŞ YAP */),
                              options: FFButtonOptions(
                                height: 54.0,
                                color: Colors.transparent,
                                textStyle: GoogleFonts.manrope(
                                  color: const Color(0xFFF25822),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF79E7F), Color(0xFFF25822)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 6.0),
                              ],
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  RegisterScreenWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: const Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText('akokz5se' /* KAYIT OL */),
                              options: FFButtonOptions(
                                height: 54.0,
                                color: Colors.transparent,
                                textStyle: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(32.0),
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

/// Small reusable widget for the white language chip + dropdown.
class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.currentLang,
    required this.onSelected,
  });

  final String currentLang;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return PopupMenuButton<String>(
      onSelected: onSelected,
      elevation: 8,
      offset: const Offset(0, 33),
      color: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: const BoxConstraints(minWidth: 130),
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
                  fontSize: 14,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          
          
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.public_outlined, size: 16, color: Colors.black.withOpacity(0.75)),
            const SizedBox(width: 6),
            Text(
              currentLang,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.85),
              ),
            ),
            const SizedBox(width: 2),
            Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: Colors.black.withOpacity(0.65)),
          ],
        ),
      ),
    );
  }
}
