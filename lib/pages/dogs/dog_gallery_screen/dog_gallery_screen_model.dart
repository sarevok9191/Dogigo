import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dog_gallery_screen_widget.dart' show DogGalleryScreenWidget;
import 'package:flutter/material.dart';

class DogGalleryScreenModel extends FlutterFlowModel<DogGalleryScreenWidget> {
  ///  Local state fields for this page.

  DogTypeStruct? dog;
  void updateDogStruct(Function(DogTypeStruct) updateFn) {
    updateFn(dog ??= DogTypeStruct());
  }

  bool loading = false;

  int? draggingOrder;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Show Dog)] action in DogGalleryScreen widget.
  ApiCallResponse? apiResulta0k;
  // Stores action output result for [Backend Call - API (ReOrder Files)] action in DragTarget widget.
  ApiCallResponse? apiResultw28Dog;
  // Stores action output result for [Backend Call - API (Show Dog)] action in DragTarget widget.
  ApiCallResponse? updateDogImagesResponse;
  // Stores action output result for [Backend Call - API (Delete File)] action in Icon widget.
  ApiCallResponse? apiResultpvi;
  // Stores action output result for [Backend Call - API (Show Dog)] action in Icon widget.
  ApiCallResponse? apiResult5j5;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Upload Image For Dog)] action in Container widget.
  ApiCallResponse? apiResults3n;
  // Stores action output result for [Backend Call - API (Show Dog)] action in Container widget.
  ApiCallResponse? apiResult9zu;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
