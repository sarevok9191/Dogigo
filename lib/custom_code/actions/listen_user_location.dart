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

import '/custom_code/actions/index.dart' as actions;
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import '/backend/api_requests/api_calls.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/nav/nav.dart';

Timer? locationUpdateTimer;
int currentListeningId = 0;
Future<void> listenUserLocation() async {
  AppStateNotifier.instance.addListener(() {
    final appState = AppStateNotifier.instance;
    print('has redirect: ' + appState.hasRedirect().toString());
    print("redirect Location:" + appState.getRedirectLocation());
    print("appstateuser" + appState.user.toString());
  });
  FFAppState().LocationAvailable = await checkLocationAccess();
  Geolocator.getServiceStatusStream().listen((ServiceStatus status) async {
    if (currentListeningId != FFAppState().CurrentUser.id) {
      locationUpdateTimer?.cancel();
      locationUpdateTimer = null;
    }
    if (status == ServiceStatus.enabled &&
        locationUpdateTimer == null &&
        FFAppState().CurrentUser.id != 0) {
      _listenLocation();
    } else {
      locationUpdateTimer?.cancel();
    }
  });
  FFAppState().addListener(() async {
    FFAppState().LocationAvailable = await checkLocationAccess();
    if (currentListeningId != FFAppState().CurrentUser.id) {
      locationUpdateTimer?.cancel();
      locationUpdateTimer = null;
    }
    if (FFAppState().CurrentUser.id != 0 && locationUpdateTimer == null) {
      _listenLocation();
    }
  });
}

_listenLocation() {
  if (currentUser?.uid?.isNotEmpty ?? false) {
    _timerAction();
    print("Location Availibity:" + FFAppState().LocationAvailable.toString());
    if (FFAppState().LocationAvailable) {
      if ((locationUpdateTimer?.isActive) ?? false) {
        return;
      }

      locationUpdateTimer =
          Timer.periodic(const Duration(seconds: 15), (Timer timer) async {
        _timerAction();
      });
    }
  }
}

_timerAction() async {
  const LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  currentListeningId = FFAppState().CurrentUser.id;
  try {
    bool locationAccess = await actions.checkLocationAccess();
    if (locationAccess) {
      final Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      final LatLng currentLocation =
          LatLng(position.latitude, position.longitude);

      FFAppState().update(() => FFAppState().LastLocation = currentLocation);
      final updateLocationResponse =
          await LocationGroup.updateLocationCall.call(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      if (updateLocationResponse.succeeded) {
        print("location update success");
      }
      actions.getMapUsers(LatLng(position.latitude, position.longitude));
    }
  } catch (e, trace) {
    print("timer location exception" + e.toString());
    print(trace.toString());
  }
}
