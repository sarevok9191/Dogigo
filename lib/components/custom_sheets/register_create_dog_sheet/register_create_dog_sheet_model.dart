import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_create_dog_sheet_widget.dart'
    show RegisterCreateDogSheetWidget;
import 'package:flutter/material.dart';

class RegisterCreateDogSheetModel
    extends FlutterFlowModel<RegisterCreateDogSheetWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for DogNameInput.
  late TextInputWrapperModel dogNameInputModel;
  // Model for dogKindSelectDropdown.
  late SelectDropdownModel dogKindSelectDropdownModel;
  // Model for DogBirthdateInput.
  late DateInputWrapperModel dogBirthdateInputModel;
  // Model for dogGenderSelectDropdown.
  late SelectDropdownModel dogGenderSelectDropdownModel;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation;

  @override
  void initState(BuildContext context) {
    dogNameInputModel = createModel(context, () => TextInputWrapperModel());
    dogKindSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    dogBirthdateInputModel =
        createModel(context, () => DateInputWrapperModel());
    dogGenderSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    dogNameInputModel.customInputTextControllerValidator =
        _formTextFieldValidator;
  }

  @override
  void dispose() {
    dogNameInputModel.dispose();
    dogKindSelectDropdownModel.dispose();
    dogBirthdateInputModel.dispose();
    dogGenderSelectDropdownModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7b2ewpsm' /* Bu alan zorunludur */,
      );
    }

    return null;
  }
}
