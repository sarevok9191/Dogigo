import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/settings_switch_button/settings_switch_button_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/inputs/select_dropdown/select_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_screen_widget.dart' show SettingsScreenWidget;
import 'package:flutter/material.dart';

class SettingsScreenModel extends FlutterFlowModel<SettingsScreenWidget> {
  ///  Local state fields for this page.

  SettingsTypeStruct? settings;
  void updateSettingsStruct(Function(SettingsTypeStruct) updateFn) {
    updateFn(settings ??= SettingsTypeStruct());
  }

  bool isLoaded = false;

  List<BlockedUserStruct> blockedUsers = [];
  void addToBlockedUsers(BlockedUserStruct item) => blockedUsers.add(item);
  void removeFromBlockedUsers(BlockedUserStruct item) =>
      blockedUsers.remove(item);
  void removeAtIndexFromBlockedUsers(int index) => blockedUsers.removeAt(index);
  void insertAtIndexInBlockedUsers(int index, BlockedUserStruct item) =>
      blockedUsers.insert(index, item);
  void updateBlockedUsersAtIndex(
          int index, Function(BlockedUserStruct) updateFn) =>
      blockedUsers[index] = updateFn(blockedUsers[index]);

  bool loading = false;

  List<SelectableOptionTypeStruct> languages = [];
  void addToLanguages(SelectableOptionTypeStruct item) => languages.add(item);
  void removeFromLanguages(SelectableOptionTypeStruct item) =>
      languages.remove(item);
  void removeAtIndexFromLanguages(int index) => languages.removeAt(index);
  void insertAtIndexInLanguages(int index, SelectableOptionTypeStruct item) =>
      languages.insert(index, item);
  void updateLanguagesAtIndex(
          int index, Function(SelectableOptionTypeStruct) updateFn) =>
      languages[index] = updateFn(languages[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Languages)] action in SettingsScreen widget.
  ApiCallResponse? languagesResponse;
  // Stores action output result for [Backend Call - API (Get Profile Infos)] action in SettingsScreen widget.
  ApiCallResponse? getProfileInfos;
  // Stores action output result for [Backend Call - API (Get User Settings)] action in SettingsScreen widget.
  ApiCallResponse? userSettings;
  // Stores action output result for [Backend Call - API (Update Map Visibility)] action in Container widget.
  ApiCallResponse? apiResultfeg;
  // Stores action output result for [Backend Call - API (Update Map Visibility)] action in Container widget.
  ApiCallResponse? apiVisibilityResponse2;
  // Stores action output result for [Backend Call - API (Update Map Visibility)] action in Container widget.
  ApiCallResponse? mapVisibilityResponse2;
  // Model for SettingsSwitchButton component.
  late SettingsSwitchButtonModel settingsSwitchButtonModel1;
  // Model for SettingsSwitchButton component.
  late SettingsSwitchButtonModel settingsSwitchButtonModel2;
  // Model for SettingsSwitchButton component.
  late SettingsSwitchButtonModel settingsSwitchButtonModel3;
  // Model for SettingsSwitchButton component.
  late SettingsSwitchButtonModel settingsSwitchButtonModel4;
  // Model for languageDropdown.
  late SelectDropdownModel languageDropdownModel;
  // Stores action output result for [Backend Call - API (Update Locale)] action in languageDropdown widget.
  ApiCallResponse? apiResultu5s;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    settingsSwitchButtonModel1 =
        createModel(context, () => SettingsSwitchButtonModel());
    settingsSwitchButtonModel2 =
        createModel(context, () => SettingsSwitchButtonModel());
    settingsSwitchButtonModel3 =
        createModel(context, () => SettingsSwitchButtonModel());
    settingsSwitchButtonModel4 =
        createModel(context, () => SettingsSwitchButtonModel());
    languageDropdownModel = createModel(context, () => SelectDropdownModel());
    navbarModel = createModel(context, () => NavbarModel());
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    settingsSwitchButtonModel1.dispose();
    settingsSwitchButtonModel2.dispose();
    settingsSwitchButtonModel3.dispose();
    settingsSwitchButtonModel4.dispose();
    languageDropdownModel.dispose();
    navbarModel.dispose();
    sidebarModel.dispose();
  }
}
