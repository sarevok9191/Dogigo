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

import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoadingImageNetwork extends StatefulWidget {
  const LoadingImageNetwork({
    super.key,
    this.width,
    this.height,
    required this.url,
    this.fit = "cover", // Varsayılan değer "cover"
    this.backgroundColor, // Opsiyonel arka plan rengi
  });

  final double? width;
  final double? height;
  final String url;
  final String fit;
  final Color? backgroundColor; // Yeni arka plan rengi parametresi

  @override
  State<LoadingImageNetwork> createState() => _LoadingImageNetworkState();
}

class _LoadingImageNetworkState extends State<LoadingImageNetwork> {
  BoxFit _parseBoxFit(String fit) {
    switch (fit.toLowerCase()) {
      case 'contain':
        return BoxFit.contain;
      case 'fill':
        return BoxFit.fill;
      case 'fitwidth':
        return BoxFit.fitWidth;
      case 'fitheight':
        return BoxFit.fitHeight;
      case 'scaledown':
        return BoxFit.scaleDown;
      case 'none':
        return BoxFit.none;
      case 'cover':
      default:
        return BoxFit.cover;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor ??
          Colors.transparent, // Opsiyonel arka plan rengi
      child: CachedNetworkImage(
        imageUrl: widget.url,
        width: widget.width,
        height: widget.height,
        fit: _parseBoxFit(widget.fit),
        placeholder: (context, url) => Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset(
              'assets/jsons/Animation_-_1732613829909.json',
              width: 110.0,
              height: 110.0,
              fit: BoxFit.contain,
              animate: true,
            ),
          ],
        ),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
