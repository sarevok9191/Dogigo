import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swipe_page_item_widget.dart' show SwipePageItemWidget;
import 'package:flutter/material.dart';

class SwipePageItemModel extends FlutterFlowModel<SwipePageItemWidget> {
  ///  Local state fields for this component.

  bool showPeople = false;

  List<ProfilePhotoTypeStruct> defaultUserImageList = [];
  void addToDefaultUserImageList(ProfilePhotoTypeStruct item) =>
      defaultUserImageList.add(item);
  void removeFromDefaultUserImageList(ProfilePhotoTypeStruct item) =>
      defaultUserImageList.remove(item);
  void removeAtIndexFromDefaultUserImageList(int index) =>
      defaultUserImageList.removeAt(index);
  void insertAtIndexInDefaultUserImageList(
          int index, ProfilePhotoTypeStruct item) =>
      defaultUserImageList.insert(index, item);
  void updateDefaultUserImageListAtIndex(
          int index, Function(ProfilePhotoTypeStruct) updateFn) =>
      defaultUserImageList[index] = updateFn(defaultUserImageList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
