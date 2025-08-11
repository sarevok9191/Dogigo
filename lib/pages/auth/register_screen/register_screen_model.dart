import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/components/inputs/password_input_wrapper/password_input_wrapper_widget.dart';
import '/components/inputs/phone_input_wrapper/phone_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_area_wrapper/text_area_wrapper_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'register_screen_widget.dart' show RegisterScreenWidget;
import 'package:flutter/material.dart';

class RegisterScreenModel extends FlutterFlowModel<RegisterScreenWidget> {
  ///  Local state fields for this page.

  SelectableOptionTypeStruct? gender;
  void updateGenderStruct(Function(SelectableOptionTypeStruct) updateFn) {
    updateFn(gender ??= SelectableOptionTypeStruct());
  }

  List<SelectableOptionTypeStruct> cities = [];
  void addToCities(SelectableOptionTypeStruct item) => cities.add(item);
  void removeFromCities(SelectableOptionTypeStruct item) => cities.remove(item);
  void removeAtIndexFromCities(int index) => cities.removeAt(index);
  void insertAtIndexInCities(int index, SelectableOptionTypeStruct item) =>
      cities.insert(index, item);
  void updateCitiesAtIndex(
          int index, Function(SelectableOptionTypeStruct) updateFn) =>
      cities[index] = updateFn(cities[index]);

  List<SelectableOptionTypeStruct> countries = [];
  void addToCountries(SelectableOptionTypeStruct item) => countries.add(item);
  void removeFromCountries(SelectableOptionTypeStruct item) =>
      countries.remove(item);
  void removeAtIndexFromCountries(int index) => countries.removeAt(index);
  void insertAtIndexInCountries(int index, SelectableOptionTypeStruct item) =>
      countries.insert(index, item);
  void updateCountriesAtIndex(
          int index, Function(SelectableOptionTypeStruct) updateFn) =>
      countries[index] = updateFn(countries[index]);

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

  List<DogRelationTypeStruct> dogs = [];
  void addToDogs(DogRelationTypeStruct item) => dogs.add(item);
  void removeFromDogs(DogRelationTypeStruct item) => dogs.remove(item);
  void removeAtIndexFromDogs(int index) => dogs.removeAt(index);
  void insertAtIndexInDogs(int index, DogRelationTypeStruct item) =>
      dogs.insert(index, item);
  void updateDogsAtIndex(int index, Function(DogRelationTypeStruct) updateFn) =>
      dogs[index] = updateFn(dogs[index]);

  List<FFUploadedFile> dogAvatars = [];
  void addToDogAvatars(FFUploadedFile item) => dogAvatars.add(item);
  void removeFromDogAvatars(FFUploadedFile item) => dogAvatars.remove(item);
  void removeAtIndexFromDogAvatars(int index) => dogAvatars.removeAt(index);
  void insertAtIndexInDogAvatars(int index, FFUploadedFile item) =>
      dogAvatars.insert(index, item);
  void updateDogAvatarsAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      dogAvatars[index] = updateFn(dogAvatars[index]);

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Countries)] action in RegisterScreen widget.
  ApiCallResponse? apiResult6vy;
  // Stores action output result for [Backend Call - API (Get Dog Types)] action in RegisterScreen widget.
  ApiCallResponse? apiResultpsi;
  // Stores action output result for [Backend Call - API (Get Genders)] action in RegisterScreen widget.
  ApiCallResponse? apiResultxdo;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for NameInput.
  late TextInputWrapperModel nameInputModel;
  // Model for SurnameInput.
  late TextInputWrapperModel surnameInputModel;
  // Model for PhoneInput.
  late PhoneInputWrapperModel phoneInputModel;
  // Model for EmailWrapper component.
  late EmailWrapperModel emailWrapperModel;
  // Model for UsernameWrapper.
  late EmailWrapperModel usernameWrapperModel;
  // Model for PasswordInput.
  late PasswordInputWrapperModel passwordInputModel;
  // Model for RepeatPasswordInput.
  late PasswordInputWrapperModel repeatPasswordInputModel;
  // Model for BirthdateInput.
  late DateInputWrapperModel birthdateInputModel;
  // Model for genderSelectDropdown.
  late SelectDropdownModel genderSelectDropdownModel;
  // Model for countrySelectDropdown.
  late SelectDropdownModel countrySelectDropdownModel;
  // Stores action output result for [Backend Call - API (Get Cities)] action in countrySelectDropdown widget.
  ApiCallResponse? citiesRepsonse;
  // Model for citySelectDropdown.
  late SelectDropdownModel citySelectDropdownModel;
  // Model for AddressInput.
  late TextAreaWrapperModel addressInputModel;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Stores action output result for [Backend Call - API (Check Register Unique)] action in Button widget.
  ApiCallResponse? checkRegisterResponse;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
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
  bool? form2Validate;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  /// Query cache managers for this widget.

  final _countriesListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> countriesList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _countriesListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCountriesListCache() => _countriesListManager.clear();
  void clearCountriesListCacheKey(String? uniqueKey) =>
      _countriesListManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    nameInputModel = createModel(context, () => TextInputWrapperModel());
    surnameInputModel = createModel(context, () => TextInputWrapperModel());
    phoneInputModel = createModel(context, () => PhoneInputWrapperModel());
    emailWrapperModel = createModel(context, () => EmailWrapperModel());
    usernameWrapperModel = createModel(context, () => EmailWrapperModel());
    passwordInputModel =
        createModel(context, () => PasswordInputWrapperModel());
    repeatPasswordInputModel =
        createModel(context, () => PasswordInputWrapperModel());
    birthdateInputModel = createModel(context, () => DateInputWrapperModel());
    genderSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    countrySelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    citySelectDropdownModel = createModel(context, () => SelectDropdownModel());
    addressInputModel = createModel(context, () => TextAreaWrapperModel());
    dogNameInputModel = createModel(context, () => TextInputWrapperModel());
    dogKindSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    dogBirthdateInputModel =
        createModel(context, () => DateInputWrapperModel());
    dogGenderSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
    nameInputModel.customInputTextControllerValidator =
        _formTextFieldValidator21;
    phoneInputModel.customInputTextControllerValidator =
        _formTextFieldValidator22;
    passwordInputModel.customInputTextControllerValidator =
        _formTextFieldValidator23;
    repeatPasswordInputModel.customInputTextControllerValidator =
        _formTextFieldValidator24;
    addressInputModel.customInputTextControllerValidator =
        _formTextFieldValidator25;
    dogNameInputModel.customInputTextControllerValidator =
        _formTextFieldValidator1;
  }

  @override
  void dispose() {
    nameInputModel.dispose();
    surnameInputModel.dispose();
    phoneInputModel.dispose();
    emailWrapperModel.dispose();
    usernameWrapperModel.dispose();
    passwordInputModel.dispose();
    repeatPasswordInputModel.dispose();
    birthdateInputModel.dispose();
    genderSelectDropdownModel.dispose();
    countrySelectDropdownModel.dispose();
    citySelectDropdownModel.dispose();
    addressInputModel.dispose();
    dogNameInputModel.dispose();
    dogKindSelectDropdownModel.dispose();
    dogBirthdateInputModel.dispose();
    dogGenderSelectDropdownModel.dispose();
    loadingViewModel.dispose();

    /// Dispose query cache managers for this widget.

    clearCountriesListCache();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator21(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eplqyy62' /* Bu alan zorunludur */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator22(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z3ow66co' /* Bu alan zorunludur */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator23(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5to9vj73' /* Güçlü bir parola gereklidir */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'mjy2bv89' /* Şifre en az 8 haneli olmalıdır */,
      );
    }

    if (!RegExp('').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'hckn1m89' /* En az bir sayı, bir küçük harf... */,
      );
    }
    return null;
  }

  String? _formTextFieldValidator24(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '1keqcz0r' /* Şifre en az 8 haneli olmalıdır */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator25(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm4grcpxn' /* Bu alan zorunludur */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8pybn55u' /* Bu alan zorunludur */,
      );
    }

    return null;
  }
}
