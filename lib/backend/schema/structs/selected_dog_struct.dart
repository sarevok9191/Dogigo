// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SelectedDogStruct extends FFFirebaseStruct {
  SelectedDogStruct({
    int? id,
    String? name,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _image = image,
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static SelectedDogStruct fromMap(Map<String, dynamic> data) =>
      SelectedDogStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  static SelectedDogStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectedDogStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'image': _image,
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
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static SelectedDogStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelectedDogStruct(
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
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SelectedDogStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedDogStruct &&
        id == other.id &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, image]);
}

SelectedDogStruct createSelectedDogStruct({
  int? id,
  String? name,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedDogStruct(
      id: id,
      name: name,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedDogStruct? updateSelectedDogStruct(
  SelectedDogStruct? selectedDog, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedDog
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedDogStructData(
  Map<String, dynamic> firestoreData,
  SelectedDogStruct? selectedDog,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedDog == null) {
    return;
  }
  if (selectedDog.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selectedDog.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedDogData =
      getSelectedDogFirestoreData(selectedDog, forFieldValue);
  final nestedData =
      selectedDogData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selectedDog.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedDogFirestoreData(
  SelectedDogStruct? selectedDog, [
  bool forFieldValue = false,
]) {
  if (selectedDog == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedDog.toMap());

  // Add any Firestore field values
  selectedDog.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedDogListFirestoreData(
  List<SelectedDogStruct>? selectedDogs,
) =>
    selectedDogs?.map((e) => getSelectedDogFirestoreData(e, true)).toList() ??
    [];
