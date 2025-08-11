import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/loading_view/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_done_sheet_widget.dart' show RegisterDoneSheetWidget;
import 'package:flutter/material.dart';

class RegisterDoneSheetModel extends FlutterFlowModel<RegisterDoneSheetWidget> {
  ///  Local state fields for this component.

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

  bool loading = false;

  bool addingNewDog = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - createRegisterData] action in SignIn widget.
  dynamic createdRegisterData;
  // Stores action output result for [Custom Action - customRegister] action in SignIn widget.
  bool? registerSuccess;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    loadingViewModel.dispose();
  }
}
