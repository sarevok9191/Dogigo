// lib/components/custom_sheets/register_done_sheet/register_done_sheet_widget.dart

import 'dart:typed_data';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/register_create_dog_sheet/register_create_dog_sheet_widget.dart';
import '/components/custom_sheets/warning_sheet/warning_sheet_widget.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'register_done_sheet_model.dart';
export 'register_done_sheet_model.dart';

class RegisterDoneSheetWidget extends StatefulWidget {
  const RegisterDoneSheetWidget({
    Key? key,
    required this.userAvatar,
    required this.primaryDog,
    required this.primaryDogAvatar,
    required this.password,
    required this.passwordConfirmation,
    this.onAddDog,
    this.dogs = const [],
    this.dogAvatars = const [],
  }) : super(key: key);

  final FFUploadedFile? userAvatar;
  final DogRelationTypeStruct primaryDog;
  final FFUploadedFile primaryDogAvatar;
  final String password;
  final String passwordConfirmation;
  final Future Function(DogRelationTypeStruct dog, FFUploadedFile dogAvatar)?
      onAddDog;
  final List<DogRelationTypeStruct> dogs;
  final List<FFUploadedFile> dogAvatars;

  @override
  State<RegisterDoneSheetWidget> createState() =>
      _RegisterDoneSheetWidgetState();
}

class _RegisterDoneSheetWidgetState extends State<RegisterDoneSheetWidget> {
  late RegisterDoneSheetModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterDoneSheetModel());
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final incomingDogs =
          widget.dogs.where((e) => e.dogType != null).toList();
      final incomingAvatars = widget.dogAvatars.toList();
      _model.dogs = [widget.primaryDog, ...incomingDogs];
      _model.dogAvatars = [widget.primaryDogAvatar, ...incomingAvatars];
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    const orangeColor = Color(0xFFFF7043);

    // ===== Responsive tokens =====
    final size = MediaQuery.sizeOf(context);
    final w = size.width;
    final h = size.height;

    // paddings
    final hPad = (w * 0.06).clamp(12.0, 48.0).toDouble();

    // headline & type scale
    final h1Size = (w * 0.060).clamp(20.0, 26.0).toDouble();
    final titleSize = (w * 0.052).clamp(16.0, 22.0).toDouble();
    final bodySize = (w * 0.040).clamp(13.0, 16.0).toDouble();
    final smallSize = (w * 0.032).clamp(12.0, 14.0).toDouble();

    // icons
    final backSize = (w * 0.08).clamp(28.0, 40.0).toDouble();
    final backIcon = (backSize * 0.65).clamp(18.0, 26.0).toDouble();
    final smallIcon = (w * 0.038).clamp(13.0, 16.0).toDouble();

    // card — lower & a bit taller
    final cardW = (w - (hPad * 2)).clamp(320.0, 420.0).toDouble();
    final cardH = (h * 0.60).clamp(560.0, 700.0).toDouble();
    final cardRadius = 24.0;

    // avatar
    final userAvatar = (cardW * 0.28).clamp(96.0, 140.0).toDouble();
    final dogAvatarR = (cardW * 0.070).clamp(18.0, 26.0).toDouble();

    // spacers
    final gapSm = (w * 0.020).clamp(6.0, 10.0).toDouble();
    final gapMd = (w * 0.038).clamp(12.0, 20.0).toDouble();
    final gapLg = (h * 0.060).clamp(36.0, 64.0).toDouble();

    // info row height
    final infoRowH = (w * 0.075).clamp(28.0, 34.0).toDouble();

    // header/card placement
    final safeTop = MediaQuery.of(context).padding.top;
    final backTopPad =
        math.min(math.max(math.max(hPad, safeTop) + gapMd, 55.0), 72.0);
    final headerTopExtra = (h * 0.075).clamp(48.0, 96.0).toDouble();
    const cardAlignY = -0.05;

    // buttons
    final buttonH = (w * 0.14).clamp(48.0, 56.0).toDouble();
    final buttonRadius = 28.0;

    // derived values
    final isMale = (FFAppState().RegisteringUser.userGender == '1') ||
        (FFAppState().RegisteringUser.userGender
                ?.toLowerCase()
                .contains('male') ==
            true);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFEEEE9), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.2],
                ),
              ),
            ),

            Column(
              children: [
                // Back button (kept a bit lower)
                Padding(
                  padding: EdgeInsets.fromLTRB(hPad, backTopPad, hPad, 0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: backSize,
                          height: backSize,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEEEE9),
                            borderRadius: BorderRadius.circular(backSize),
                            border: Border.all(
                              color: const Color.fromARGB(255, 134, 134, 134),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: const Color.fromARGB(255, 134, 134, 134),
                            size: backIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // “Almost done!” header
                Padding(
                  padding: EdgeInsets.fromLTRB(hPad, headerTopExtra, hPad, 0),
                  child: Text(
                    FFLocalizations.of(context)
                        .getText('k8s0sebx' /* Neredeyse Bitti */),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: h1Size,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),

                // White card & content
                Expanded(
                  child: Align(
                    alignment: const Alignment(0, cardAlignY),
                    child: SizedBox(
                      width: cardW,
                      height: cardH,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xFFEAEAEA), width: 2),
                          borderRadius: BorderRadius.circular(cardRadius),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 12),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: hPad * 0.25,
                            vertical: gapLg * 1.05,
                          ),
                          child: Column(
                            children: [
                              // Avatar
                              Container(
                                width: userAvatar,
                                height: userAvatar,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xFFFABBA4),
                                      width: 2),
                                  image: DecorationImage(
                                    image: Image.memory(widget.userAvatar?.bytes ??
                                            Uint8List.fromList([]))
                                        .image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: gapMd * 0.60),

                              // Name & Username
                              Text(
                                '${FFAppState().RegisteringUser.firstName} ${FFAppState().RegisteringUser.lastName}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                  fontSize:
                                      (titleSize + 2).clamp(18.0, 24.0),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '@${FFAppState().RegisteringUser.username}',
                                style: GoogleFonts.manrope(
                                  fontSize: smallSize,
                                  color: const Color(0xFF51504F),
                                ),
                              ),
                              SizedBox(height: gapMd * 0.50),

                              // Compact info row
                              SizedBox(
                                height: infoRowH,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      isMale ? Icons.male : Icons.female,
                                      size: smallIcon,
                                      color: orangeColor,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      isMale ? 'Male' : 'Female',
                                      style: TextStyle(
                                        color: orangeColor,
                                        fontSize: smallSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text('•',
                                        style: TextStyle(
                                            color: orangeColor,
                                            fontSize: smallSize + 2)),
                                    const SizedBox(width: 12),
                                    Text(
                                      '${functions.calculateAge(FFAppState().RegisteringUser.dateBirth)} years old',
                                      style: TextStyle(
                                        color: orangeColor,
                                        fontSize: smallSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text('•',
                                        style: TextStyle(
                                            color: orangeColor,
                                            fontSize: smallSize + 2)),
                                    const SizedBox(width: 12),
                                    Flexible(
                                      child: Text(
                                        '${FFAppState().RegisteringUser.city.title}, ${FFAppState().RegisteringUser.country.title}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: orangeColor,
                                          fontSize: smallSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Divider(
                                color: const Color.fromARGB(255, 155, 155, 155),
                                height: gapMd * 1.2,
                              ),

                              // Dogs header
                              Padding(
                                padding: EdgeInsets.only(bottom: gapSm),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.pets,
                                        color: orangeColor, size: smallIcon),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Dogs of ${FFAppState().RegisteringUser.firstName}',
                                      style: GoogleFonts.manrope(
                                        fontSize:
                                            (titleSize - 2).clamp(16.0, 20.0),
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Dog list
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    ..._model.dogs
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      final idx = entry.key;
                                      final dog = entry.value;
                                      return Container(
                                        margin:
                                            EdgeInsets.only(bottom: gapSm),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: gapSm,
                                          vertical: gapSm * 0.9,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFFEEEE9),
                                              Colors.white
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          border: Border.all(
                                              color:
                                                  const Color(0xFFFEEEE9)),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              blurRadius: 6,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: dogAvatarR,
                                              backgroundImage: MemoryImage(
                                                _model.dogAvatars[idx].bytes ??
                                                    Uint8List.fromList([]),
                                              ),
                                            ),
                                            SizedBox(width: gapSm),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    dog.title,
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    style:
                                                        GoogleFonts.manrope(
                                                      fontSize: (titleSize - 2)
                                                          .clamp(16.0, 20.0),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: gapSm * 0.5),
                                                  Wrap(
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    spacing: 10,
                                                    runSpacing: 4,
                                                    children: [
                                                      Text(
                                                        dog.dogType?.title ??
                                                            '',
                                                        style: GoogleFonts
                                                            .manrope(
                                                          fontSize: bodySize,
                                                          color: orangeColor,
                                                        ),
                                                      ),
                                                      Text('•',
                                                          style: TextStyle(
                                                              color:
                                                                  orangeColor,
                                                              fontSize:
                                                                  bodySize +
                                                                      2)),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Icon(
                                                              dog.gender == 1
                                                                  ? Icons.male
                                                                  : Icons
                                                                      .female,
                                                              size: bodySize,
                                                              color:
                                                                  orangeColor),
                                                          const SizedBox(
                                                              width: 4),
                                                          Text(
                                                            dog.gender == 1
                                                                ? 'Male'
                                                                : 'Female',
                                                            style: GoogleFonts
                                                                .manrope(
                                                              fontSize:
                                                                  bodySize,
                                                              color:
                                                                  orangeColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text('•',
                                                          style: TextStyle(
                                                              color:
                                                                  orangeColor,
                                                              fontSize:
                                                                  bodySize +
                                                                      2)),
                                                      Text(
                                                        '${functions.calculateAge(dog.birthDate)} years old',
                                                        style: GoogleFonts
                                                            .manrope(
                                                          fontSize: bodySize,
                                                          color: orangeColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ],
                                ),
                              ),

                              // + Add more dog profile (moved further down)
                              GestureDetector(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                           MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height:
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.9,
                                            child:
                                                RegisterCreateDogSheetWidget(
                                              onSuccessValidation:
                                                  (dog, avatar) async {
                                                _model.addToDogs(dog);
                                                _model.addToDogAvatars(
                                                    avatar);
                                                _model.addingNewDog = true;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((_) => setState(() {}));
                                  if (_model.addingNewDog == true) {
                                    await widget.onAddDog?.call(
                                      _model.dogs.last,
                                      _model.dogAvatars.last,
                                    );
                                    _model.addingNewDog = false;
                                  }
                                },
                                child: Padding(
                                  // changed from gapSm → gapMd to push it lower
                                  padding: EdgeInsets.only(top: gapMd),
                                  child: Text(
                                    '+ Add more dog profile',
                                    style: GoogleFonts.manrope(
                                      fontSize: bodySize,
                                      fontWeight: FontWeight.w600,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // CONTINUE button
                Padding(
                  padding: EdgeInsets.fromLTRB(hPad, gapSm, hPad, hPad),
                  child: Container(
                    width: double.infinity,
                    height: buttonH,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF79E7F), Color(0xFFF25822)],
                      ),
                      borderRadius: BorderRadius.circular(buttonRadius),
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.loading = true;
                        setState(() {});
                        _model.createdRegisterData =
                            await actions.createRegisterData(
                          FFAppState().RegisteringUser,
                          _model.dogs.toList(),
                          widget.userAvatar,
                          widget.primaryDogAvatar,
                          _model.dogAvatars.toList(),
                          widget.password,
                          widget.passwordConfirmation,
                        );
                        _model.registerSuccess =
                            await actions.customRegister(
                          _model.createdRegisterData!,
                        );
                        if (_model.registerSuccess == true) {
                          await action_blocks.getCurrentUser(context);
                          context.goNamed(
                            HomePageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                          await actions.storeDeviceToken();
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding:
                                      MediaQuery.viewInsetsOf(context),
                                  child: const SizedBox(
                                    height: 200.0,
                                    child: WarningSheetWidget(),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        _model.loading = false;
                        setState(() {});
                      },
                      text: 'ŞİMDİ BAŞLA',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: buttonH,
                        color: Colors.transparent,
                        textStyle: GoogleFonts.manrope(
                          fontSize: (titleSize).clamp(16.0, 20.0),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(buttonRadius),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            if (_model.loading == true)
              wrapWithModel(
                model: _model.loadingViewModel,
                updateCallback: () => setState(() {}),
                child: const LoadingViewWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
