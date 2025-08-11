import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/global/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/admob_util.dart' as admob;
import '/flutter_flow/custom_functions.dart' as functions;
import 'swipe_screen_widget.dart' show SwipeScreenWidget;
import 'package:flutter/material.dart';

class SwipeScreenModel extends FlutterFlowModel<SwipeScreenWidget> {
  ///  Local state fields for this page.

  int? showSwipe = 1;

  List<SwipeItemStruct> swipes = [];
  void addToSwipes(SwipeItemStruct item) => swipes.add(item);
  void removeFromSwipes(SwipeItemStruct item) => swipes.remove(item);
  void removeAtIndexFromSwipes(int index) => swipes.removeAt(index);
  void insertAtIndexInSwipes(int index, SwipeItemStruct item) =>
      swipes.insert(index, item);
  void updateSwipesAtIndex(int index, Function(SwipeItemStruct) updateFn) =>
      swipes[index] = updateFn(swipes[index]);

  bool loading = false;

  bool isFullView = false;

  bool isNotRemainingSwipe = false;

  int swipeIndex = 0;

  String swipeType = 'slide';

  int remainingSwipe = 1;

  bool harthLottieVisible = false;

  bool declineLottieVisible = false;

  bool reporting = false;

  bool hasPurchase = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Package Details)] action in SwipeScreen widget.
  ApiCallResponse? packageDetailsResponse;
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

  /// Action blocks.
  Future getswipelist(BuildContext context) async {
    ApiCallResponse? swipeResponse;

    swipeResponse = await SwipeGroup.getSwipeListCall.call();

    if ((swipeResponse.succeeded ?? true)) {
      remainingSwipe = SwipeGroup.getSwipeListCall.remainingswipe(
        (swipeResponse.jsonBody ?? ''),
      )!;
      swipes = (getJsonField(
        (swipeResponse.jsonBody ?? ''),
        r'''$.records''',
        true,
      )!
              .toList()
              .map<SwipeItemStruct?>(SwipeItemStruct.maybeFromMap)
              .toList() as Iterable<SwipeItemStruct?>)
          .withoutNulls
          .toList()
          .cast<SwipeItemStruct>();
      hasPurchase = getJsonField(
        (swipeResponse.jsonBody ?? ''),
        r'''$.has_purchase''',
      );
      if (remainingSwipe < 1) {
        isNotRemainingSwipe = true;
      } else {
        swipes = (getJsonField(
          (swipeResponse.jsonBody ?? ''),
          r'''$.records''',
          true,
        )!
                .toList()
                .map<SwipeItemStruct?>(SwipeItemStruct.maybeFromMap)
                .toList() as Iterable<SwipeItemStruct?>)
            .withoutNulls
            .toList()
            .cast<SwipeItemStruct>();
        isNotRemainingSwipe = false;
      }
    } else {
      swipes = [];
    }

    swipeIndex = 0;
  }

  Future checkRemainingSwipe(BuildContext context) async {
    swipeType = 'slide';
    if (remainingSwipe < 1) {
      isNotRemainingSwipe = true;
    }
  }

  Future onSwipe(
    BuildContext context, {
    required int? swipedId,
    required String? swipeType,
  }) async {
    ApiCallResponse? swipeResponse;
    bool? interstitialAdSuccessCopy;

    swipeResponse = await SwipeGroup.onSwipeCall.call(
      swipeType: swipeType,
      swipedId: swipedId,
    );

    if ((swipeResponse.succeeded ?? true)) {
      swipeIndex = swipeIndex + 1;
      remainingSwipe = getJsonField(
        (swipeResponse.jsonBody ?? ''),
        r'''$.remaining_swipe''',
      );
      hasPurchase = getJsonField(
        (swipeResponse.jsonBody ?? ''),
        r'''$.has_purchase''',
      );

      admob.loadInterstitialAd(
        "ca-app-pub-9258929631531979/5837016158",
        "ca-app-pub-9258929631531979/9978569008",
        false,
      );

      if ((functions.modeCheck(swipeIndex, 50) == true) && !hasPurchase) {
        interstitialAdSuccessCopy = await admob.showInterstitialAd();
      }
    } else {
      if (getJsonField(
            (swipeResponse.jsonBody ?? ''),
            r'''$.message''',
          ) !=
          null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (swipeResponse.jsonBody ?? ''),
                r'''$.message''',
              ).toString().toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).info,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).primary,
          ),
        );
      }
    }
  }
}
