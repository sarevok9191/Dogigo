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

import 'package:flutter_svg/flutter_svg.dart';

class ColoredSVG extends StatefulWidget {
  const ColoredSVG({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.icon,
  });

  final double? width;
  final double? height;
  final Color? color;
  final String icon;

  @override
  State<ColoredSVG> createState() => _ColoredSVG_State();
}

class _ColoredSVG_State extends State<ColoredSVG> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: SvgPicture.asset(widget.icon,
            colorFilter: widget.color != null
                ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
                : null));
  }
}
