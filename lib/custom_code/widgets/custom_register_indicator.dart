// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

class CustomRegisterIndicator extends StatefulWidget {
  const CustomRegisterIndicator({
    super.key,
    this.width,
    this.height,
    this.dotWidth,
    required this.index,
    required this.pageCount,
    this.dotColor,
  });

  final double? width;
  final double? height;
  final int index;
  final int pageCount;
  final double? dotWidth;
  final Color? dotColor;
  @override
  State<CustomRegisterIndicator> createState() =>
      _CustomRegisterIndicatorState();
}

class _CustomRegisterIndicatorState extends State<CustomRegisterIndicator> {
  @override
  Widget build(BuildContext context) {
    return smooth_page_indicator.AnimatedSmoothIndicator(
      activeIndex: widget.index,
      count: widget.pageCount,
      axisDirection: Axis.horizontal,
      onDotClicked: (i) async {},
      effect: smooth_page_indicator.SlideEffect(
        spacing: 5.0,
        radius: 20.0,
        dotWidth: widget.dotWidth ?? 80.0,
        dotHeight: 5.0,
        dotColor: widget.dotColor ?? const Color(0x4CF25822),
        activeDotColor: FlutterFlowTheme.of(context).primary,
        paintStyle: PaintingStyle.fill,
      ),
    );
  }
}
