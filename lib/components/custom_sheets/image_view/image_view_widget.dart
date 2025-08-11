import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'image_view_model.dart';
export 'image_view_model.dart';

class ImageViewWidget extends StatefulWidget {
  const ImageViewWidget({
    super.key,
    this.images,
    int? initialIndex,
  }) : this.initialIndex = initialIndex ?? 0;

  final List<ProfilePhotoTypeStruct>? images;
  final int initialIndex;

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> {
  late ImageViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.pageViewController?.animateToPage(
        widget.initialIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final images = (widget.images?.toList() ?? []).take(6).toList();

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: Stack(
            children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _model.pageViewController ??= PageController(
                    initialPage: max(0, min(0, images.length - 1))),
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, imagesIndex) {
                  final imagesItem = images[imagesIndex];
                  return GestureDetector(
                    onTapUp: (details) async {
                      if (details.globalPosition.dx >
                          (MediaQuery.sizeOf(context).width * 0.5)) {
                        if (functions.increaseInteger(
                                _model.pageViewCurrentIndex, 1) ==
                            widget.images?.length) {
                          await _model.pageViewController?.animateToPage(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          await _model.pageViewController?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      } else {
                        if (_model.pageViewCurrentIndex == 0) {
                          await _model.pageViewController?.animateToPage(
                            functions.increaseInteger(
                                widget.images!.length, -1),
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          await _model.pageViewController?.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imagesItem.url,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 19.0),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: _model.pageViewController ??= PageController(
                        initialPage: max(0, min(0, images.length - 1))),
                    count: images.length,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _model.pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      safeSetState(() {});
                    },
                    effect: smooth_page_indicator.SlideEffect(
                      spacing: 8.0,
                      radius: 20.0,
                      dotWidth: 102.0,
                      dotHeight: 4.0,
                      dotColor: Color(0x660A0A0A),
                      activeDotColor: FlutterFlowTheme.of(context).info,
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
}
