import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prefered_dog_screen_widget.dart' show PreferedDogScreenWidget;
import 'package:flutter/material.dart';

class PreferedDogScreenModel extends FlutterFlowModel<PreferedDogScreenWidget> {
  ///  Local state fields for this page.

  List<DogTypeStruct> myDogs = [];
  void addToMyDogs(DogTypeStruct item) => myDogs.add(item);
  void removeFromMyDogs(DogTypeStruct item) => myDogs.remove(item);
  void removeAtIndexFromMyDogs(int index) => myDogs.removeAt(index);
  void insertAtIndexInMyDogs(int index, DogTypeStruct item) =>
      myDogs.insert(index, item);
  void updateMyDogsAtIndex(int index, Function(DogTypeStruct) updateFn) =>
      myDogs[index] = updateFn(myDogs[index]);

  DogTypeStruct? selectedDog;
  void updateSelectedDogStruct(Function(DogTypeStruct) updateFn) {
    updateFn(selectedDog ??= DogTypeStruct());
  }

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Dogs Index)] action in PreferedDogScreen widget.
  ApiCallResponse? apiResult0uo;
  // Stores action output result for [Backend Call - API (Select Active Dog)] action in Button widget.
  ApiCallResponse? apiResultzlvCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
