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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:collection/collection.dart';
import 'package:patido_app/flutter_flow/flutter_flow_theme.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart' as rendering;
export 'dart:async' show Completer;
export 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
export '/backend/backend.dart' hide LatLng;
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart' as material;
import 'package:collection/collection.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    this.onCameraIdle,
    this.initialLocation,
    this.markers = const [],
    this.style = MapStyle.standart,
    this.initialZoom = 12,
    this.allowInteraction = true,
    this.allowZoom = true,
    this.showZoomControls = true,
    this.showLocation = true,
    this.showCompass = false,
    this.showMapToolbar = false,
    this.showTraffic = false,
    this.centerMapOnMarkerTap = false,
    this.markerImageSize = 12.0,
    this.width,
    this.height,
    this.customMapStyle,
    this.onTapMarker,
    this.myLocationButtonEnabled = false,
    super.key,
  });

  final double? width;
  final double? height;
  final bool centerMapOnMarkerTap;
  final String? customMapStyle;
  final Future Function(MarkerStruct marker)? onTapMarker;
  final bool showTraffic;
  final bool showMapToolbar;
  final bool showCompass;
  final bool showLocation;
  final bool showZoomControls;
  final bool allowZoom;
  final bool allowInteraction;
  final double initialZoom;
  final MapStyle style;
  final LatLng? initialLocation;
  final List<MarkerStruct> markers;
  final Future Function(LatLng latlng)? onCameraIdle;
  final double markerImageSize;
  final bool myLocationButtonEnabled;
  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late Completer<gmaps.GoogleMapController> _controller;
  Set<gmaps.Marker> _markers = <gmaps.Marker>{};
  late gmaps.LatLng currentMapCenter;
  DateTime _lastUpdate = DateTime.now();
  @override
  void initState() {
    super.initState();
    currentMapCenter = widget.initialLocation?.toGoogleMaps() ??
        gmaps.LatLng(40.9202201, 29.1536896);
    _controller = Completer<gmaps.GoogleMapController>();

    material.WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initializeMarkers();
      Future.delayed(Duration(milliseconds: 100), () {
        _moveCameraToUser();
      });
    });
  }

  @override
  void didUpdateWidget(oldWidget) {
    final listEquals = const ListEquality().equals;
    if (DateTime.now().difference(_lastUpdate).abs().inSeconds >= 15 ||
        (!listEquals(oldWidget.markers, widget.markers))) {
      _initializeMarkers();
      _lastUpdate = DateTime.now();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    () async {
      var controller = await _controller.future;
      controller.dispose();
    }();
    super.dispose();
  }

  void _initializeMarkers() async {
    final markers = await Future.wait(
        widget.markers.map((marker) => _createMarker(marker)));
    setState(() {
      _markers = markers.toSet();
    });
  }

  Future<gmaps.Marker> _createMarker(MarkerStruct marker) async {
    final icon = await _createMarkerIcon(marker);
    return gmaps.Marker(
      markerId: gmaps.MarkerId(marker.id),
      position: marker.position?.toGoogleMaps() ?? currentMapCenter,
      icon: icon,
      onTap: () => _onTapMarker(marker),
    );
  }

  Future<gmaps.BitmapDescriptor> _createMarkerIcon(MarkerStruct marker) async {
    if (marker.image?.imagePath != null) {
      final imageProvider = NetworkImage(marker.image.imagePath);
      final image = await _loadImage(imageProvider);
      return await _widgetToBitmapDescriptor(Container(
        padding: const EdgeInsets.all(4),
        color: Colors.transparent,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFF37C20), width: 8),
          ),
          child: ClipOval(
            child: Image.network(
              marker.image.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ));
    } else {
      return await _createDefaultMarkerIcon(marker);
    }
  }

  Future<Uint8List> _loadImage(ImageProvider imageProvider) async {
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    final completer = Completer<ui.Image>();
    final listener = ImageStreamListener(
        (ImageInfo info, bool _) => completer.complete(info.image));
    imageStream.addListener(listener);
    final image = await completer.future;
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<gmaps.BitmapDescriptor> _createDefaultMarkerIcon(
      MarkerStruct marker) async {
    final widget = Container(
      padding: const EdgeInsets.all(4),
      color: Colors.transparent,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFF37C20),
          border: Border.all(color: const Color(0xFFF37C20), width: 8),
        ),
        child: Icon(
          marker.dog.id == 0 ? Icons.person : Icons.pets,
          size: 62.0,
          color: Colors.white,
        ),
      ),
    );
    return await _widgetToBitmapDescriptor(widget);
  }

  Future<gmaps.BitmapDescriptor> _widgetToBitmapDescriptor(
      Widget widget) async {
    final repaintBoundary = rendering.RenderRepaintBoundary();
    final view = ui.PlatformDispatcher.instance.views.first;
    final logicalSize = view.physicalSize / view.devicePixelRatio;
    final renderView = rendering.RenderView(
      view: view,
      child: rendering.RenderPositionedBox(
        alignment: Alignment.center,
        child: repaintBoundary,
      ),
      configuration: rendering.ViewConfiguration(
        devicePixelRatio: 1.0,
        physicalConstraints: BoxConstraints.tight(view.physicalSize),
        logicalConstraints: BoxConstraints.tight(logicalSize),
      ),
    );

    final pipelineOwner = rendering.PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());
    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final rootElement = RenderObjectToWidgetAdapter<rendering.RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final image = await repaintBoundary.toImage(pixelRatio: 1.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return gmaps.BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  Future<void> _onTapMarker(MarkerStruct marker) async {
    if (widget.centerMapOnMarkerTap && marker.position != null) {
      final controller = await _controller.future;
      await controller.animateCamera(
        gmaps.CameraUpdate.newLatLng(marker.position!.toGoogleMaps()),
      );
      currentMapCenter = marker.position!.toGoogleMaps();
      widget.onCameraIdle?.call(marker.position!);
    }
    await widget.onTapMarker?.call(marker);
  }

  void _moveCameraToUser() async {
    final controller = await _controller.future;

    var lastLocation = FFAppState().LastLocation;
    if (lastLocation != null) {
      await controller.animateCamera(
        gmaps.CameraUpdate.newLatLng(lastLocation.toGoogleMaps()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: !widget.allowInteraction,
          child: Container(
            width: widget.width,
            height: widget.height,
            child: gmaps.GoogleMap(
              myLocationEnabled: widget.showLocation,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: widget.myLocationButtonEnabled,
              onMapCreated: (controller) async {
                _controller.complete(controller);
                await controller.setMapStyle(widget.customMapStyle ??
                    googleMapStyleStrings[widget.style]);
              },
              onCameraIdle: () =>
                  widget.onCameraIdle?.call(currentMapCenter.toLatLng()),
              onCameraMove: (position) => currentMapCenter = position.target,
              initialCameraPosition: gmaps.CameraPosition(
                  target: currentMapCenter, zoom: widget.initialZoom),
              markers: _markers,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.91, 0.68),
          child: FlutterFlowIconButton(
            borderRadius: 300.0,
            buttonSize: 60.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.location_searching,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () {
              _moveCameraToUser();
            },
          ),
        )
      ],
    );
  }
}

// Extensions for converting between LatLng and Google Maps LatLng
extension ToGoogleMapsLatLng on LatLng {
  gmaps.LatLng toGoogleMaps() => gmaps.LatLng(latitude, longitude);
}

extension GoogleMapsToLatLng on gmaps.LatLng {
  LatLng toLatLng() => LatLng(latitude, longitude);
}

// Map style configurations
Map<MapStyle, String> googleMapStyleStrings = {
  MapStyle.standart: '[]',
  MapStyle.silver:
      r'[ {"elementType":"geometry","stylers":[{"color":"#f5f5f5"}]}, ... ]',
  MapStyle.retro:
      r'[ {"elementType":"geometry","stylers":[{"color":"#ebe3cd"}]}, ... ]',
  MapStyle.dark:
      r'[ {"elementType":"geometry","stylers":[{"color":"#212121"}]}, ... ]',
  MapStyle.night:
      r'[ {"elementType":"geometry","stylers":[{"color":"#242f3e"}]}, ... ]',
  MapStyle.aubergine:
      r'[ {"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]}, ... ]',
};
