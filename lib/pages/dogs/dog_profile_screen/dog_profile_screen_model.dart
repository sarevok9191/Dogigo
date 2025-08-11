import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_area_wrapper/text_area_wrapper_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dog_profile_screen_widget.dart' show DogProfileScreenWidget;
import 'package:flutter/material.dart';

class DogProfileScreenModel extends FlutterFlowModel<DogProfileScreenWidget> {
  ///  Local state fields for this page.

  DogTypeStruct? dogInfos;
  void updateDogInfosStruct(Function(DogTypeStruct) updateFn) {
    updateFn(dogInfos ??= DogTypeStruct());
  }

  bool isLoaded = false;

  List<SelectableOptionTypeStruct> dogTypes = [];
  void addToDogTypes(SelectableOptionTypeStruct item) => dogTypes.add(item);
  void removeFromDogTypes(SelectableOptionTypeStruct item) =>
      dogTypes.remove(item);
  void removeAtIndexFromDogTypes(int index) => dogTypes.removeAt(index);
  void insertAtIndexInDogTypes(int index, SelectableOptionTypeStruct item) =>
      dogTypes.insert(index, item);
  void updateDogTypesAtIndex(
          int index, Function(SelectableOptionTypeStruct) updateFn) =>
      dogTypes[index] = updateFn(dogTypes[index]);

  bool loading = false;

  List<SelectableOptionTypeStruct> genders = [];
  void addToGenders(SelectableOptionTypeStruct item) => genders.add(item);
  void removeFromGenders(SelectableOptionTypeStruct item) =>
      genders.remove(item);
  void removeAtIndexFromGenders(int index) => genders.removeAt(index);
  void insertAtIndexInGenders(int index, SelectableOptionTypeStruct item) =>
      genders.insert(index, item);
  void updateGendersAtIndex(
          int index, Function(SelectableOptionTypeStruct) updateFn) =>
      genders[index] = updateFn(genders[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Dog Genders)] action in DogProfileScreen widget.
  ApiCallResponse? dogGendersResp;
  // Stores action output result for [Backend Call - API (Get Dog Types)] action in DogProfileScreen widget.
  ApiCallResponse? dogTypeResult;
  // Stores action output result for [Backend Call - API (Show Dog)] action in DogProfileScreen widget.
  ApiCallResponse? apiResult8p3;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Update Avatar)] action in IconButton widget.
  ApiCallResponse? uploadImageResponse;
  // Model for TextAreaWrapper component.
  late TextAreaWrapperModel textAreaWrapperModel;
  // Model for TextInputWrapper component.
  late TextInputWrapperModel textInputWrapperModel;
  // Model for dogKindSelectDropdown.
  late SelectDropdownModel dogKindSelectDropdownModel;
  // Model for DateInputWrapper component.
  late DateInputWrapperModel dateInputWrapperModel;
  // Model for dogGenderSelectDropdown.
  late SelectDropdownModel dogGenderSelectDropdownModel;
  // Stores action output result for [Backend Call - API (Update Dog)] action in Button widget.
  ApiCallResponse? apiResultg3d;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    textAreaWrapperModel = createModel(context, () => TextAreaWrapperModel());
    textInputWrapperModel = createModel(context, () => TextInputWrapperModel());
    dogKindSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    dateInputWrapperModel = createModel(context, () => DateInputWrapperModel());
    dogGenderSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    textAreaWrapperModel.dispose();
    textInputWrapperModel.dispose();
    dogKindSelectDropdownModel.dispose();
    dateInputWrapperModel.dispose();
    dogGenderSelectDropdownModel.dispose();
    sidebarModel.dispose();
  }
}
