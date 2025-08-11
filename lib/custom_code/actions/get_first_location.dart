// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<void> getFirstLocation() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("konum bilgisine erişilemiyor");
      FFAppState().update(() => FFAppState().LocationAvailable = false);
      return; // Servisler kapalıysa çık
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      FFAppState().update(() => FFAppState().LocationAvailable = true);
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final LatLng currentLocation =
          LatLng(currentPosition.latitude, currentPosition.longitude);

      FFAppState().update(() => FFAppState().LastLocation = currentLocation);

      print(
          'Konum güncellendi: ${currentPosition.latitude}, ${currentPosition.longitude}');
    } else {
      FFAppState().update(() => FFAppState().LocationAvailable = false);
    }
  } catch (e) {
    print('Konum alınırken hata oluştu: $e');
  }
}
