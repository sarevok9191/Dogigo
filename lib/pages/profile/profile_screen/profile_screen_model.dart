import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/inputs/date_input_wrapper/date_input_wrapper_widget.dart';
import '/components/inputs/email_wrapper/email_wrapper_widget.dart';
import '/components/inputs/phone_input_wrapper/phone_input_wrapper_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/components/inputs/text_area_wrapper/text_area_wrapper_widget.dart';
import '/components/inputs/text_input_wrapper/text_input_wrapper_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_screen_widget.dart' show ProfileScreenWidget;
import 'package:flutter/material.dart';

class ProfileScreenModel extends FlutterFlowModel<ProfileScreenWidget> {
  ///  Local state fields for this page.

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

  UserStruct? userInfos;
  void updateUserInfosStruct(Function(UserStruct) updateFn) {
    updateFn(userInfos ??= UserStruct());
  }

  bool isLoaded = false;

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
  // Stores action output result for [Backend Call - API (Get Countries)] action in ProfileScreen widget.
  ApiCallResponse? apiResult2vj;
  // Stores action output result for [Backend Call - API (Get Profile Infos)] action in ProfileScreen widget.
  ApiCallResponse? profileInfos;
  // Stores action output result for [Backend Call - API (Get Cities)] action in ProfileScreen widget.
  ApiCallResponse? apiResultx6k;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Update User Avatar)] action in IconButton widget.
  ApiCallResponse? uploadProfileImageResponse;
  // Model for AboutMe.
  late TextAreaWrapperModel aboutMeModel;
  // Model for FirstName.
  late TextInputWrapperModel firstNameModel;
  // Model for LastName.
  late TextInputWrapperModel lastNameModel;
  // Model for PhoneNumber.
  late PhoneInputWrapperModel phoneNumberModel;
  // Model for Username.
  late EmailWrapperModel usernameModel;
  // Model for EmailWrapper component.
  late EmailWrapperModel emailWrapperModel;
  // Model for BirthDate.
  late DateInputWrapperModel birthDateModel;
  // Model for genderSelectDropdown.
  late SelectDropdownModel genderSelectDropdownModel;
  // Model for countrySelectDropdown.
  late SelectDropdownModel countrySelectDropdownModel;
  // Stores action output result for [Backend Call - API (Get Cities)] action in countrySelectDropdown widget.
  ApiCallResponse? citiesRepsonse;
  // Model for citySelectDropdown.
  late SelectDropdownModel citySelectDropdownModel;
  // Model for Address.
  late TextAreaWrapperModel addressModel;
  // Stores action output result for [Backend Call - API (Update Profile Infos)] action in Button widget.
  ApiCallResponse? apiResult9ln;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    aboutMeModel = createModel(context, () => TextAreaWrapperModel());
    firstNameModel = createModel(context, () => TextInputWrapperModel());
    lastNameModel = createModel(context, () => TextInputWrapperModel());
    phoneNumberModel = createModel(context, () => PhoneInputWrapperModel());
    usernameModel = createModel(context, () => EmailWrapperModel());
    emailWrapperModel = createModel(context, () => EmailWrapperModel());
    birthDateModel = createModel(context, () => DateInputWrapperModel());
    genderSelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    countrySelectDropdownModel =
        createModel(context, () => SelectDropdownModel());
    citySelectDropdownModel = createModel(context, () => SelectDropdownModel());
    addressModel = createModel(context, () => TextAreaWrapperModel());
    navbarModel = createModel(context, () => NavbarModel());
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    aboutMeModel.dispose();
    firstNameModel.dispose();
    lastNameModel.dispose();
    phoneNumberModel.dispose();
    usernameModel.dispose();
    emailWrapperModel.dispose();
    birthDateModel.dispose();
    genderSelectDropdownModel.dispose();
    countrySelectDropdownModel.dispose();
    citySelectDropdownModel.dispose();
    addressModel.dispose();
    navbarModel.dispose();
    sidebarModel.dispose();
  }
}
