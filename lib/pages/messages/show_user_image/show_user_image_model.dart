import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'show_user_image_widget.dart' show ShowUserImageWidget;
import 'package:flutter/material.dart';

class ShowUserImageModel extends FlutterFlowModel<ShowUserImageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
  }
}
