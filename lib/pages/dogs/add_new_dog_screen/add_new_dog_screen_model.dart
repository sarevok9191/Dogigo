import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_dog_screen_widget.dart' show AddNewDogScreenWidget;
import 'package:flutter/material.dart';

class AddNewDogScreenModel extends FlutterFlowModel<AddNewDogScreenWidget> {
  ///  Local state fields for this page.

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Dog Types)] action in AddNewDogScreen widget.
  ApiCallResponse? apiResultz7g;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for TextInputWrapper component.
  late TextInputWrapperModel textInputWrapperModel;
  // Model for dogKindSelectDropdown.
  late SelectDropdownModel dogKindSelectDropdownModel;
  // Model for DateInputWrapper component.
  late DateInputWrapperModel dateInputWrapperModel;
  // Model for dogGenderSelectDropdown.
  late SelectDropdownModel dogGenderSelectDropdownModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Create Dog)] action in Button widget.
  ApiCallResponse? apiResultiig;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    textInputWrapperModel = createModel(context, () => TextInputWrapperModel());
    dogKindSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    dateInputWrapperModel = createModel(context, () => DateInputWrapperModel());
    dogGenderSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    textInputWrapperModel.dispose();
    dogKindSelectDropdownModel.dispose();
    dateInputWrapperModel.dispose();
    dogGenderSelectDropdownModel.dispose();
    loadingViewModel.dispose();
  }
}
