import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/components/messages/friend/friend_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_friends_screen_widget.dart' show MyFriendsScreenWidget;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MyFriendsScreenModel extends FlutterFlowModel<MyFriendsScreenWidget> {
  ///  Local state fields for this page.

  bool isDogsOpen = false;

  bool isLoaded = false;

  List<FriendTypeStruct> myFriends = [];
  void addToMyFriends(FriendTypeStruct item) => myFriends.add(item);
  void removeFromMyFriends(FriendTypeStruct item) => myFriends.remove(item);
  void removeAtIndexFromMyFriends(int index) => myFriends.removeAt(index);
  void insertAtIndexInMyFriends(int index, FriendTypeStruct item) =>
      myFriends.insert(index, item);
  void updateMyFriendsAtIndex(int index, Function(FriendTypeStruct) updateFn) =>
      myFriends[index] = updateFn(myFriends[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for friend dynamic component.
  late FlutterFlowDynamicModels<FriendModel> friendModels;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    friendModels = FlutterFlowDynamicModels(() => FriendModel());
    navbarModel = createModel(context, () => NavbarModel());
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    friendModels.dispose();
    navbarModel.dispose();
    sidebarModel.dispose();
  }

  /// Action blocks.
  Future getList(BuildContext context) async {
    ApiCallResponse? friendsResponse;

    friendsResponse = await FriendsGroup.getFriendsCall.call(
      search: textController.text,
    );

    if ((friendsResponse.succeeded ?? true)) {
      myFriends = (getJsonField(
        (friendsResponse.jsonBody ?? ''),
        r'''$.friends''',
        true,
      )!
              .toList()
              .map<FriendTypeStruct?>(FriendTypeStruct.maybeFromMap)
              .toList() as Iterable<FriendTypeStruct?>)
          .withoutNulls
          .toList()
          .cast<FriendTypeStruct>();
    } else {
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: ErrorSheetWidget(
                  errorMessage: getJsonField(
                    (friendsResponse?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString().toString(),
                ),
              ),
            ),
          );
        },
      );
    }

    isLoaded = true;
  }
}
