import '/flutter_flow/flutter_flow_util.dart';
import 'dog_profile_preview_screen_widget.dart'
    show DogProfilePreviewScreenWidget;
import 'package:flutter/material.dart';

class DogProfilePreviewScreenModel
    extends FlutterFlowModel<DogProfilePreviewScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
