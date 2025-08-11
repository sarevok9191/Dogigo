// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProfilePhotoTypeStruct extends FFFirebaseStruct {
  ProfilePhotoTypeStruct({
    int? id,
    int? sortOrder,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _sortOrder = sortOrder,
        _url = url,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static ProfilePhotoTypeStruct fromMap(Map<String, dynamic> data) =>
      ProfilePhotoTypeStruct(
        id: castToType<int>(data['id']),
        sortOrder: castToType<int>(data['sort_order']),
        url: data['url'] as String?,
      );

  static ProfilePhotoTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfilePhotoTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'sort_order': _sortOrder,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'sort_order': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfilePhotoTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProfilePhotoTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        sortOrder: deserializeParam(
          data['sort_order'],
          ParamType.int,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProfilePhotoTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfilePhotoTypeStruct &&
        id == other.id &&
        sortOrder == other.sortOrder &&
        url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([id, sortOrder, url]);
}

ProfilePhotoTypeStruct createProfilePhotoTypeStruct({
  int? id,
  int? sortOrder,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfilePhotoTypeStruct(
      id: id,
      sortOrder: sortOrder,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfilePhotoTypeStruct? updateProfilePhotoTypeStruct(
  ProfilePhotoTypeStruct? profilePhotoType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profilePhotoType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfilePhotoTypeStructData(
  Map<String, dynamic> firestoreData,
  ProfilePhotoTypeStruct? profilePhotoType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profilePhotoType == null) {
    return;
  }
  if (profilePhotoType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profilePhotoType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profilePhotoTypeData =
      getProfilePhotoTypeFirestoreData(profilePhotoType, forFieldValue);
  final nestedData =
      profilePhotoTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profilePhotoType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfilePhotoTypeFirestoreData(
  ProfilePhotoTypeStruct? profilePhotoType, [
  bool forFieldValue = false,
]) {
  if (profilePhotoType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profilePhotoType.toMap());

  // Add any Firestore field values
  profilePhotoType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfilePhotoTypeListFirestoreData(
  List<ProfilePhotoTypeStruct>? profilePhotoTypes,
) =>
    profilePhotoTypes
        ?.map((e) => getProfilePhotoTypeFirestoreData(e, true))
        .toList() ??
    [];
