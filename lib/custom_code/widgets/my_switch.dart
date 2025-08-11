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

class MySwitch extends StatefulWidget {
  const MySwitch({
    super.key,
    this.width,
    this.height,
    this.onValueChange,
    this.initialValue,
    this.switchColor,
    this.backgroundColor,
    this.activeBackgroundColor,
    this.activeSwitchColor,
  });

  final double? width;
  final double? height;
  final Future Function(bool value)? onValueChange;
  final bool? initialValue;
  final Color? switchColor;
  final Color? backgroundColor;
  final Color? activeBackgroundColor;
  final Color? activeSwitchColor;

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool value = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        value = widget.initialValue ?? false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            value = !value;
          });
          widget.onValueChange?.call(value);
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            color: widget.backgroundColor));
  }
}
