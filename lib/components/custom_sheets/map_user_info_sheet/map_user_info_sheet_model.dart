import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_sheets/image_view/image_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_user_info_sheet_widget.dart' show MapUserInfoSheetWidget;
import 'package:flutter/material.dart';

class MapUserInfoSheetModel extends FlutterFlowModel<MapUserInfoSheetWidget> {
  ///  Local state fields for this component.

  int photoIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (Touch)] action in IconButton widget.
  ApiCallResponse? apiResultq4s;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? createTouchMessage;
  // Model for imageView component.
  late ImageViewModel imageViewModel;

  @override
  void initState(BuildContext context) {
    imageViewModel = createModel(context, () => ImageViewModel());
  }

  @override
  void dispose() {
    imageViewModel.dispose();
  }
}
