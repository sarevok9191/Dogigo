// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LocationTypeStruct extends FFFirebaseStruct {
  LocationTypeStruct({
    int? id,
    String? name,
    String? locationName,
    LatLng? location,
    String? address,
    String? markerImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _locationName = locationName,
        _location = location,
        _address = address,
        _markerImage = markerImage,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  set locationName(String? val) => _locationName = val;

  bool hasLocationName() => _locationName != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "markerImage" field.
  String? _markerImage;
  String get markerImage => _markerImage ?? '';
  set markerImage(String? val) => _markerImage = val;

  bool hasMarkerImage() => _markerImage != null;

  static LocationTypeStruct fromMap(Map<String, dynamic> data) =>
      LocationTypeStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        locationName: data['locationName'] as String?,
        location: data['location'] as LatLng?,
        address: data['address'] as String?,
        markerImage: data['markerImage'] as String?,
      );

  static LocationTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'locationName': _locationName,
        'location': _location,
        'address': _address,
        'markerImage': _markerImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'locationName': serializeParam(
          _locationName,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'markerImage': serializeParam(
          _markerImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        locationName: deserializeParam(
          data['locationName'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        markerImage: deserializeParam(
          data['markerImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationTypeStruct &&
        id == other.id &&
        name == other.name &&
        locationName == other.locationName &&
        location == other.location &&
        address == other.address &&
        markerImage == other.markerImage;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, locationName, location, address, markerImage]);
}

LocationTypeStruct createLocationTypeStruct({
  int? id,
  String? name,
  String? locationName,
  LatLng? location,
  String? address,
  String? markerImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationTypeStruct(
      id: id,
      name: name,
      locationName: locationName,
      location: location,
      address: address,
      markerImage: markerImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationTypeStruct? updateLocationTypeStruct(
  LocationTypeStruct? locationType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationTypeStructData(
  Map<String, dynamic> firestoreData,
  LocationTypeStruct? locationType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationType == null) {
    return;
  }
  if (locationType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationTypeData =
      getLocationTypeFirestoreData(locationType, forFieldValue);
  final nestedData =
      locationTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationTypeFirestoreData(
  LocationTypeStruct? locationType, [
  bool forFieldValue = false,
]) {
  if (locationType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationType.toMap());

  // Add any Firestore field values
  locationType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationTypeListFirestoreData(
  List<LocationTypeStruct>? locationTypes,
) =>
    locationTypes?.map((e) => getLocationTypeFirestoreData(e, true)).toList() ??
    [];
