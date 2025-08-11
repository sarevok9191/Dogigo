import '/backend/schema/structs/index.dart';
import '/components/swipe/swipe_page_item/swipe_page_item_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'swipe_pages_model.dart';
export 'swipe_pages_model.dart';

class SwipePagesWidget extends StatefulWidget {
  const SwipePagesWidget({
    super.key,
    required this.swipes,
  });

  final List<SwipeItemStruct>? swipes;

  @override
  State<SwipePagesWidget> createState() => _SwipePagesWidgetState();
}

class _SwipePagesWidgetState extends State<SwipePagesWidget> {
  late SwipePagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipePagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final swipeItem = widget.swipes!.toList();

        return FlutterFlowSwipeableStack(
          onSwipeFn: (index) async {
            final swipeItemItem = swipeItem[index];

            admob.loadInterstitialAd(
              "ca-app-pub-6563118093467323/5724725732",
              "",
              false,
            );

            _model.interstitialAdSuccess = await admob.showInterstitialAd();

            safeSetState(() {});
          },
          onLeftSwipe: (index) {},
          onRightSwipe: (index) {},
          onUpSwipe: (index) {},
          onDownSwipe: (index) {},
          itemBuilder: (context, swipeItemIndex) {
            final swipeItemItem = swipeItem[swipeItemIndex];
            return SwipePageItemWidget(
              key: Key('Key837_${swipeItemIndex}_of_${swipeItem.length}'),
              isShowActive: _model.isShowActive,
              initialPage: _model.currentPageView,
              item: swipeItemItem,
              onClickCenter: () async {
                _model.isShowActive = !_model.isShowActive;
                _model.updatePage(() {});
              },
            );
          },
          itemCount: swipeItem.length,
          controller: _model.swipeableStackController,
          loop: false,
          cardDisplayCount: 3,
          scale: 1.0,
          cardPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          backCardOffset: const Offset(0.0, 0.0),
        );
      },
    );
  }
}
