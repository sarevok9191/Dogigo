import '/flutter_flow/flutter_flow_util.dart';
import 'swipe_pages_widget.dart' show SwipePagesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipePagesModel extends FlutterFlowModel<SwipePagesWidget> {
  ///  Local state fields for this component.

  bool isShowActive = true;

  int? currentPageView = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in SwipeableStack widget.
  bool? interstitialAdSuccess;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
