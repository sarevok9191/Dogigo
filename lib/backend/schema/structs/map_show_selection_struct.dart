// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MapShowSelectionStruct extends FFFirebaseStruct {
  MapShowSelectionStruct({
    int? id,
    String? label,
    String? image,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _label = label,
        _image = image,
        _type = type,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static MapShowSelectionStruct fromMap(Map<String, dynamic> data) =>
      MapShowSelectionStruct(
        id: castToType<int>(data['id']),
        label: data['label'] as String?,
        image: data['image'] as String?,
        type: data['type'] as String?,
      );

  static MapShowSelectionStruct? maybeFromMap(dynamic data) => data is Map
      ? MapShowSelectionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'label': _label,
        'image': _image,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static MapShowSelectionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MapShowSelectionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MapShowSelectionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MapShowSelectionStruct &&
        id == other.id &&
        label == other.label &&
        image == other.image &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([id, label, image, type]);
}

MapShowSelectionStruct createMapShowSelectionStruct({
  int? id,
  String? label,
  String? image,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MapShowSelectionStruct(
      id: id,
      label: label,
      image: image,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MapShowSelectionStruct? updateMapShowSelectionStruct(
  MapShowSelectionStruct? mapShowSelection, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mapShowSelection
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMapShowSelectionStructData(
  Map<String, dynamic> firestoreData,
  MapShowSelectionStruct? mapShowSelection,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mapShowSelection == null) {
    return;
  }
  if (mapShowSelection.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mapShowSelection.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mapShowSelectionData =
      getMapShowSelectionFirestoreData(mapShowSelection, forFieldValue);
  final nestedData =
      mapShowSelectionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mapShowSelection.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMapShowSelectionFirestoreData(
  MapShowSelectionStruct? mapShowSelection, [
  bool forFieldValue = false,
]) {
  if (mapShowSelection == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mapShowSelection.toMap());

  // Add any Firestore field values
  mapShowSelection.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMapShowSelectionListFirestoreData(
  List<MapShowSelectionStruct>? mapShowSelections,
) =>
    mapShowSelections
        ?.map((e) => getMapShowSelectionFirestoreData(e, true))
        .toList() ??
    [];
