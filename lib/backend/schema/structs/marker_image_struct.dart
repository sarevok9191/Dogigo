// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MarkerImageStruct extends FFFirebaseStruct {
  MarkerImageStruct({
    bool? isAsset,
    double? size,
    String? imagePath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isAsset = isAsset,
        _size = size,
        _imagePath = imagePath,
        super(firestoreUtilData);

  // "is_asset" field.
  bool? _isAsset;
  bool get isAsset => _isAsset ?? false;
  set isAsset(bool? val) => _isAsset = val;

  bool hasIsAsset() => _isAsset != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 15.0;
  set size(double? val) => _size = val;

  void incrementSize(double amount) => size = size + amount;

  bool hasSize() => _size != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;

  bool hasImagePath() => _imagePath != null;

  static MarkerImageStruct fromMap(Map<String, dynamic> data) =>
      MarkerImageStruct(
        isAsset: data['is_asset'] as bool?,
        size: castToType<double>(data['size']),
        imagePath: data['image_path'] as String?,
      );

  static MarkerImageStruct? maybeFromMap(dynamic data) => data is Map
      ? MarkerImageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_asset': _isAsset,
        'size': _size,
        'image_path': _imagePath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_asset': serializeParam(
          _isAsset,
          ParamType.bool,
        ),
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
        'image_path': serializeParam(
          _imagePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarkerImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarkerImageStruct(
        isAsset: deserializeParam(
          data['is_asset'],
          ParamType.bool,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
        imagePath: deserializeParam(
          data['image_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarkerImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarkerImageStruct &&
        isAsset == other.isAsset &&
        size == other.size &&
        imagePath == other.imagePath;
  }

  @override
  int get hashCode => const ListEquality().hash([isAsset, size, imagePath]);
}

MarkerImageStruct createMarkerImageStruct({
  bool? isAsset,
  double? size,
  String? imagePath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarkerImageStruct(
      isAsset: isAsset,
      size: size,
      imagePath: imagePath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarkerImageStruct? updateMarkerImageStruct(
  MarkerImageStruct? markerImage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    markerImage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarkerImageStructData(
  Map<String, dynamic> firestoreData,
  MarkerImageStruct? markerImage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (markerImage == null) {
    return;
  }
  if (markerImage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && markerImage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final markerImageData =
      getMarkerImageFirestoreData(markerImage, forFieldValue);
  final nestedData =
      markerImageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = markerImage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarkerImageFirestoreData(
  MarkerImageStruct? markerImage, [
  bool forFieldValue = false,
]) {
  if (markerImage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(markerImage.toMap());

  // Add any Firestore field values
  markerImage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarkerImageListFirestoreData(
  List<MarkerImageStruct>? markerImages,
) =>
    markerImages?.map((e) => getMarkerImageFirestoreData(e, true)).toList() ??
    [];
