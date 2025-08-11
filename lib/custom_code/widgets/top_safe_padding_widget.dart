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

class TopSafePaddingWidget extends StatefulWidget {
  TopSafePaddingWidget({super.key, this.width, this.height});
  final double? width;
  final double? height;
  State<TopSafePaddingWidget> createState() => _TopSafePaddingWidgetState();
}

class _TopSafePaddingWidgetState extends State<TopSafePaddingWidget> {
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: MediaQuery.paddingOf(context).top,
    );
  }
}
