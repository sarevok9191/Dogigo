import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dog_gallery_screen_model.dart';
export 'dog_gallery_screen_model.dart';

class DogGalleryScreenWidget extends StatefulWidget {
  const DogGalleryScreenWidget({
    super.key,
    required this.id,
  });

  final int? id;

  static String routeName = 'DogGalleryScreen';
  static String routePath = 'dogGalleryScreen';

  @override
  State<DogGalleryScreenWidget> createState() => _DogGalleryScreenWidgetState();
}

class _DogGalleryScreenWidgetState extends State<DogGalleryScreenWidget> {
  late DogGalleryScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DogGalleryScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      safeSetState(() {});
      _model.apiResulta0k = await DogsGroup.showDogCall.call(
        id: widget.id,
      );

      if ((_model.apiResulta0k?.succeeded ?? true)) {
        _model.dog = DogTypeStruct.maybeFromMap(getJsonField(
          (_model.apiResulta0k?.jsonBody ?? ''),
          r'''$.record''',
        ));
      }
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
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
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(39.0, 14.0, 39.0, 14.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).secondary,
                        borderRadius: 15.0,
                        borderWidth: 1.0,
                        buttonSize: 49.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 28.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'l9luxup7' /* Resim Galerisi */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.manrope(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
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
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          39.0, 48.0, 39.0, 40.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  31.0, 0.0, 31.0, 0.0),
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
                                  Expanded(
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'uhbcenqv' /* Resimlerin sıralamalarını   */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.2,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '8clf9afz' /* kaydırarak değiştirebilirsiniz... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.2,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
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
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 40.0)),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if ((_model.loading == false) &&
                            (_model.dog?.hasImages() == true)) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    39.0, 0.0, 39.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final profilePhoto = functions
                                        .sortListByOrder(
                                            _model.dog!.images.toList(), true)
                                        .toList()
                                        .take(6)
                                        .toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 8.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: profilePhoto.length,
                                      itemBuilder:
                                          (context, profilePhotoIndex) {
                                        final profilePhotoItem =
                                            profilePhoto[profilePhotoIndex];
                                        return Builder(
                                          builder: (context) {
                                            if (profilePhotoItem.url != '') {
                                              return DragTarget<
                                                  ProfilePhotoTypeStruct>(
                                                onAcceptWithDetails:
                                                    (details) async {
                                                  _model.loading = true;
                                                  safeSetState(() {});
                                                  _model.draggingOrder =
                                                      profilePhotoItem
                                                          .sortOrder;
                                                  _model.updateDogStruct(
                                                    (e) => e
                                                      ..updateImages(
                                                        (e) => e[functions
                                                            .profilePhotofindIndexByProperty(
                                                                _model
                                                                    .dog!.images
                                                                    .toList(),
                                                                profilePhotoItem
                                                                    .id)]
                                                          ..sortOrder = details
                                                              .data.sortOrder,
                                                      ),
                                                  );
                                                  _model.updateDogStruct(
                                                    (e) => e
                                                      ..updateImages(
                                                        (e) => e[functions
                                                            .profilePhotofindIndexByProperty(
                                                                _model
                                                                    .dog!.images
                                                                    .toList(),
                                                                details
                                                                    .data.id)]
                                                          ..sortOrder = _model
                                                              .draggingOrder,
                                                      ),
                                                  );
                                                  _model.apiResultw28Dog =
                                                      await FilesGroup
                                                          .reOrderFilesCall
                                                          .call(
                                                    filesJson: _model
                                                        .dog?.images
                                                        .map((e) => e.toMap())
                                                        .toList(),
                                                  );

                                                  if ((_model.apiResultw28Dog
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.updateDogImagesResponse =
                                                        await DogsGroup
                                                            .showDogCall
                                                            .call(
                                                      id: widget.id,
                                                    );

                                                    if ((_model
                                                            .updateDogImagesResponse
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.dog = DogTypeStruct
                                                          .maybeFromMap(
                                                              getJsonField(
                                                        (_model.updateDogImagesResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.record''',
                                                      ));
                                                    }
                                                  }
                                                  _model.loading = false;
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                                builder: (context, _, __) {
                                                  return Draggable<
                                                      ProfilePhotoTypeStruct>(
                                                    data: profilePhotoItem,
                                                    feedback: Material(
                                                      type: MaterialType
                                                          .transparency,
                                                      child: Container(
                                                        width: 154.0,
                                                        height: 154.0,
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x33000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            profilePhotoItem.url,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.81,
                                                                      -0.77),
                                                              child: Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00F7DED0),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.loading =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.apiResultpvi =
                                                                        await FilesGroup
                                                                            .deleteFileCall
                                                                            .call(
                                                                      fileId:
                                                                          profilePhotoItem
                                                                              .id,
                                                                    );

                                                                    if ((_model
                                                                            .apiResultpvi
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.apiResult5j5 = await DogsGroup
                                                                          .showDogCall
                                                                          .call(
                                                                        id: widget
                                                                            .id,
                                                                      );

                                                                      if ((_model
                                                                              .apiResult5j5
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        _model.dog =
                                                                            DogTypeStruct.maybeFromMap(getJsonField(
                                                                          (_model.apiResult5j5?.jsonBody ??
                                                                              ''),
                                                                          r'''$.record''',
                                                                        ));
                                                                      }
                                                                    }
                                                                    _model.loading =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 30.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 154.0,
                                                      height: 154.0,
                                                      child: Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x33000000),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          profilePhotoItem
                                                                              .url,
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.81,
                                                                    -0.77),
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00F7DED0),
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  _model.loading =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.apiResultpvi =
                                                                      await FilesGroup
                                                                          .deleteFileCall
                                                                          .call(
                                                                    fileId:
                                                                        profilePhotoItem
                                                                            .id,
                                                                  );

                                                                  if ((_model
                                                                          .apiResultpvi
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    _model.apiResult5j5 =
                                                                        await DogsGroup
                                                                            .showDogCall
                                                                            .call(
                                                                      id: widget
                                                                          .id,
                                                                    );

                                                                    if ((_model
                                                                            .apiResult5j5
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.dog =
                                                                          DogTypeStruct.maybeFromMap(
                                                                              getJsonField(
                                                                        (_model.apiResult5j5?.jsonBody ??
                                                                            ''),
                                                                        r'''$.record''',
                                                                      ));
                                                                    }
                                                                  }
                                                                  _model.loading =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.close,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    imageQuality: 90,
                                                    allowPhoto: true,
                                                    pickerFontFamily:
                                                        'Readex Pro',
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() =>
                                                        _model.isDataUploading =
                                                            true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if ((_model
                                                              .uploadedLocalFile
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    _model.loading = true;
                                                    safeSetState(() {});
                                                    _model.apiResults3n =
                                                        await DogsGroup
                                                            .uploadImageForDogCall
                                                            .call(
                                                      id: widget.id,
                                                      image: _model
                                                          .uploadedLocalFile,
                                                    );

                                                    if ((_model.apiResults3n
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.apiResult9zu =
                                                          await DogsGroup
                                                              .showDogCall
                                                              .call(
                                                        id: widget.id,
                                                      );

                                                      if ((_model.apiResult9zu
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.dog =
                                                            DogTypeStruct
                                                                .maybeFromMap(
                                                                    getJsonField(
                                                          (_model.apiResult9zu
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.record''',
                                                        ));
                                                      }
                                                    }
                                                    _model.loading = false;
                                                    safeSetState(() {});
                                                  }
                                                  safeSetState(() {
                                                    _model.isDataUploading =
                                                        false;
                                                    _model.uploadedLocalFile =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]));
                                                  });

                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.add_photo_alternate,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 52.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          DogProfilePreviewScreenWidget
                                              .routeName,
                                          queryParameters: {
                                            'id': serializeParam(
                                              widget.id,
                                              ParamType.int,
                                            ),
                                            'dogInfos': serializeParam(
                                              _model.dog,
                                              ParamType.DataStruct,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '7qrt2st3' /* ÖNİZLE */,
                                      ),
                                      icon: Icon(
                                        Icons.play_arrow,
                                        size: 24.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            48.0, 0.0, 48.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFF5AD78),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 1.8,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ].divide(SizedBox(height: 19.0)),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            height: 500.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/jsons/Animation_-_1732613829909.json',
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.contain,
                                  animate: true,
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
