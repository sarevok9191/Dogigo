import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_gallery_screen_widget.dart' show ProfileGalleryScreenWidget;
import 'package:flutter/material.dart';

class ProfileGalleryScreenModel
    extends FlutterFlowModel<ProfileGalleryScreenWidget> {
  ///  Local state fields for this page.

  int? draggingOrder;

  UserStruct? profile;
  void updateProfileStruct(Function(UserStruct) updateFn) {
    updateFn(profile ??= UserStruct());
  }

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Profile Infos)] action in ProfileGalleryScreen widget.
  ApiCallResponse? profileResult;
  // Stores action output result for [Backend Call - API (ReOrder Files)] action in DragTarget widget.
  ApiCallResponse? apiResultw28;
  // Stores action output result for [Backend Call - API (Get Profile Infos)] action in DragTarget widget.
  ApiCallResponse? updateProfileResponse;
  // Stores action output result for [Backend Call - API (Delete File)] action in Icon widget.
  ApiCallResponse? apiResultpvi;
  // Stores action output result for [Backend Call - API (Get Profile Infos)] action in Icon widget.
  ApiCallResponse? apiResult5j5;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Upload Image For User)] action in Container widget.
  ApiCallResponse? apiResults3n;
  // Stores action output result for [Backend Call - API (Get Profile Infos)] action in Container widget.
  ApiCallResponse? apiResult9zu;
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
