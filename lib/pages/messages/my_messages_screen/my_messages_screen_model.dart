import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_sheets/error_sheet/error_sheet_widget.dart';
import '/components/global/navbar/navbar_widget.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'my_messages_screen_widget.dart' show MyMessagesScreenWidget;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MyMessagesScreenModel extends FlutterFlowModel<MyMessagesScreenWidget> {
  ///  Local state fields for this page.

  bool isDogsOpen = false;

  List<FriendTypeStruct> messageList = [];
  void addToMessageList(FriendTypeStruct item) => messageList.add(item);
  void removeFromMessageList(FriendTypeStruct item) => messageList.remove(item);
  void removeAtIndexFromMessageList(int index) => messageList.removeAt(index);
  void insertAtIndexInMessageList(int index, FriendTypeStruct item) =>
      messageList.insert(index, item);
  void updateMessageListAtIndex(
          int index, Function(FriendTypeStruct) updateFn) =>
      messageList[index] = updateFn(messageList[index]);

  bool isLoaded = false;

  double? safeTopPadding = 0.0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Get Messages)] action in TextField widget.
  ApiCallResponse? apiResult1v1;
  List<MessagesRecord>? containerPreviousSnapshot;
  // Stores action output result for [Backend Call - API (Get Messages)] action in Container widget.
  ApiCallResponse? apiResultru8Copy;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navbarModel.dispose();
    sidebarModel.dispose();
  }

  /// Action blocks.
  Future fetchList(BuildContext context) async {
    ApiCallResponse? apiResultru8Copy2;

    apiResultru8Copy2 = await MessagesGroup.getMessagesCall.call();

    if ((apiResultru8Copy2.succeeded ?? true)) {
      messageList = (getJsonField(
        (apiResultru8Copy2.jsonBody ?? ''),
        r'''$.records''',
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
                    (apiResultru8Copy2?.jsonBody ?? ''),
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
