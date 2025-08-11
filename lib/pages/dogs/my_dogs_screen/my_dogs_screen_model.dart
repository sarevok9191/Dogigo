import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_dogs_screen_widget.dart' show MyDogsScreenWidget;
import 'package:flutter/material.dart';

class MyDogsScreenModel extends FlutterFlowModel<MyDogsScreenWidget> {
  ///  Local state fields for this page.

  List<DogTypeStruct> myDogs = [];
  void addToMyDogs(DogTypeStruct item) => myDogs.add(item);
  void removeFromMyDogs(DogTypeStruct item) => myDogs.remove(item);
  void removeAtIndexFromMyDogs(int index) => myDogs.removeAt(index);
  void insertAtIndexInMyDogs(int index, DogTypeStruct item) =>
      myDogs.insert(index, item);
  void updateMyDogsAtIndex(int index, Function(DogTypeStruct) updateFn) =>
      myDogs[index] = updateFn(myDogs[index]);

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Dogs Index)] action in MyDogsScreen widget.
  ApiCallResponse? apiResultkwe;
  // Stores action output result for [Backend Call - API (Dogs Index)] action in Container widget.
  ApiCallResponse? apiResultkweCopy;
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
