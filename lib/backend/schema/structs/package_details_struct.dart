// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PackageDetailsStruct extends FFFirebaseStruct {
  PackageDetailsStruct({
    String? packageIdenfitier,
    int? swipeRights,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _packageIdenfitier = packageIdenfitier,
        _swipeRights = swipeRights,
        super(firestoreUtilData);

  // "package_idenfitier" field.
  String? _packageIdenfitier;
  String get packageIdenfitier => _packageIdenfitier ?? '';
  set packageIdenfitier(String? val) => _packageIdenfitier = val;

  bool hasPackageIdenfitier() => _packageIdenfitier != null;

  // "swipe_rights" field.
  int? _swipeRights;
  int get swipeRights => _swipeRights ?? 0;
  set swipeRights(int? val) => _swipeRights = val;

  void incrementSwipeRights(int amount) => swipeRights = swipeRights + amount;

  bool hasSwipeRights() => _swipeRights != null;

  static PackageDetailsStruct fromMap(Map<String, dynamic> data) =>
      PackageDetailsStruct(
        packageIdenfitier: data['package_idenfitier'] as String?,
        swipeRights: castToType<int>(data['swipe_rights']),
      );

  static PackageDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? PackageDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'package_idenfitier': _packageIdenfitier,
        'swipe_rights': _swipeRights,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'package_idenfitier': serializeParam(
          _packageIdenfitier,
          ParamType.String,
        ),
        'swipe_rights': serializeParam(
          _swipeRights,
          ParamType.int,
        ),
      }.withoutNulls;

  static PackageDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PackageDetailsStruct(
        packageIdenfitier: deserializeParam(
          data['package_idenfitier'],
          ParamType.String,
          false,
        ),
        swipeRights: deserializeParam(
          data['swipe_rights'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PackageDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PackageDetailsStruct &&
        packageIdenfitier == other.packageIdenfitier &&
        swipeRights == other.swipeRights;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([packageIdenfitier, swipeRights]);
}

PackageDetailsStruct createPackageDetailsStruct({
  String? packageIdenfitier,
  int? swipeRights,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PackageDetailsStruct(
      packageIdenfitier: packageIdenfitier,
      swipeRights: swipeRights,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PackageDetailsStruct? updatePackageDetailsStruct(
  PackageDetailsStruct? packageDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    packageDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPackageDetailsStructData(
  Map<String, dynamic> firestoreData,
  PackageDetailsStruct? packageDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (packageDetails == null) {
    return;
  }
  if (packageDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && packageDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final packageDetailsData =
      getPackageDetailsFirestoreData(packageDetails, forFieldValue);
  final nestedData =
      packageDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = packageDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPackageDetailsFirestoreData(
  PackageDetailsStruct? packageDetails, [
  bool forFieldValue = false,
]) {
  if (packageDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(packageDetails.toMap());

  // Add any Firestore field values
  packageDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPackageDetailsListFirestoreData(
  List<PackageDetailsStruct>? packageDetailss,
) =>
    packageDetailss
        ?.map((e) => getPackageDetailsFirestoreData(e, true))
        .toList() ??
    [];
