import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'prefered_dog_screen_model.dart';
export 'prefered_dog_screen_model.dart';

class PreferedDogScreenWidget extends StatefulWidget {
  const PreferedDogScreenWidget({super.key});

  static String routeName = 'PreferedDogScreen';
  static String routePath = 'preferedDogScreen';

  @override
  State<PreferedDogScreenWidget> createState() =>
      _PreferedDogScreenWidgetState();
}

class _PreferedDogScreenWidgetState extends State<PreferedDogScreenWidget> {
  late PreferedDogScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreferedDogScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult0uo = await DogsGroup.dogsIndexCall.call();

      if ((_model.apiResult0uo?.succeeded ?? true)) {
        _model.myDogs = (getJsonField(
          (_model.apiResult0uo?.jsonBody ?? ''),
          r'''$.records''',
          true,
        )!
                .toList()
                .map<DogTypeStruct?>(DogTypeStruct.maybeFromMap)
                .toList() as Iterable<DogTypeStruct?>)
            .withoutNulls
            .toList()
            .cast<DogTypeStruct>();
        safeSetState(() {});
        _model.selectedDog = (getJsonField(
          (_model.apiResult0uo?.jsonBody ?? ''),
          r'''$.records''',
        ).toList().map<DogTypeStruct?>(DogTypeStruct.maybeFromMap).toList()
                as Iterable<DogTypeStruct?>)
            .withoutNulls
            .where((e) => e.isActive)
            .toList()
            .firstOrNull;
        safeSetState(() {});
      } else {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: ErrorSheetWidget(
                    errorMessage: getJsonField(
                      (_model.apiResult0uo?.jsonBody ?? ''),
                      r'''$.message''',
                    ).toString().toString(),
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(39.0, 48.0, 39.0, 20.0),
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
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 49.0,
                          height: 49.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.chevron_left_sharp,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/login-logo.svg',
                          width: 96.0,
                          height: 48.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: Container(
                          width: 49.0,
                          height: 49.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getVariableText(
                    trText: 'Aktif Köpeği Seçin',
                    enText: 'Select Prefered Dog',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(41.0, 32.0, 41.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/register-dog-icon.svg',
                            width: 26.0,
                            height: 38.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getVariableText(
                              trText:
                                  'Seçilen köpek kaydırma ekranında görünür.',
                              enText: 'The selected dog appears in swipes.',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 13.0,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final myDogsList = _model.myDogs.toList();

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(myDogsList.length,
                                  (myDogsListIndex) {
                            final myDogsListItem = myDogsList[myDogsListIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.selectedDog = myDogsListItem;
                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 298.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          myDogsListItem == _model.selectedDog
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : Color(0xFFFCBD7B),
                                          myDogsListItem == _model.selectedDog
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondary
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 233.0,
                                                  height: 233.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00F7DED0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/dots-on-image.svg',
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: ClipOval(
                                                  child: Container(
                                                    width: 162.0,
                                                    height: 162.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      child: Image.network(
                                                        myDogsListItem
                                                            .avatar.url,
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 43.0),
                                          child: Text(
                                            myDogsListItem.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montaguSlab(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFFCBD7B),
                                                  fontSize: 30.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
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
                                  Container(
                                    width: 68.0,
                                    height: 68.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Visibility(
                                      visible:
                                          myDogsListItem == _model.selectedDog,
                                      child: Opacity(
                                        opacity: 0.6,
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF79E67B),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.check_rounded,
                                            color: Color(0xFF508D4E),
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 34.0)),
                              ),
                            );
                          })
                              .divide(SizedBox(width: 21.0))
                              .addToStart(SizedBox(width: 30.0))
                              .addToEnd(SizedBox(width: 30.0)),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.apiResultzlvCopy =
                          await DogsGroup.selectActiveDogCall.call(
                        dogId: _model.selectedDog?.id,
                      );

                      if ((_model.apiResultzlvCopy?.succeeded ?? true)) {
                        FFAppState().updateCurrentUserStruct(
                          (e) => e
                            ..activeDog = UserStruct.maybeFromMap(getJsonField(
                              (_model.apiResultzlvCopy?.jsonBody ?? ''),
                              r'''$.user''',
                            ))?.activeDog,
                        );
                        safeSetState(() {});
                        Navigator.pop(context);
                      } else {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ErrorSheetWidget(
                                    errorMessage: getJsonField(
                                      (_model.apiResultzlvCopy?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getVariableText(
                      trText: 'KAYDET & DEVAM ET',
                      enText: 'SAVE & CONTINUE',
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          45.0, 12.0, 45.0, 12.0),
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
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 48.0)),
            ),
          ),
        ),
      ),
    );
  }
}
