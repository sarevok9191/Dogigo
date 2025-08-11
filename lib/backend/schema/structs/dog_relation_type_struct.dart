// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DogRelationTypeStruct extends FFFirebaseStruct {
  DogRelationTypeStruct({
    String? action,
    String? key,
    String? title,
    String? description,
    int? gender,
    SelectableOptionTypeStruct? dogType,
    DateTime? birthDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _action = action,
        _key = key,
        _title = title,
        _description = description,
        _gender = gender,
        _dogType = dogType,
        _birthDate = birthDate,
        super(firestoreUtilData);

  // "action" field.
  String? _action;
  String get action => _action ?? 'store';
  set action(String? val) => _action = val;

  bool hasAction() => _action != null;

  // "key" field.
  String? _key;
  String get key => _key ?? 'dogs';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "gender" field.
  int? _gender;
  int get gender => _gender ?? 0;
  set gender(int? val) => _gender = val;

  void incrementGender(int amount) => gender = gender + amount;

  bool hasGender() => _gender != null;

  // "dog_type" field.
  SelectableOptionTypeStruct? _dogType;
  SelectableOptionTypeStruct get dogType =>
      _dogType ?? SelectableOptionTypeStruct();
  set dogType(SelectableOptionTypeStruct? val) => _dogType = val;

  void updateDogType(Function(SelectableOptionTypeStruct) updateFn) {
    updateFn(_dogType ??= SelectableOptionTypeStruct());
  }

  bool hasDogType() => _dogType != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  set birthDate(DateTime? val) => _birthDate = val;

  bool hasBirthDate() => _birthDate != null;

  static DogRelationTypeStruct fromMap(Map<String, dynamic> data) =>
      DogRelationTypeStruct(
        action: data['action'] as String?,
        key: data['key'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        gender: castToType<int>(data['gender']),
        dogType: data['dog_type'] is SelectableOptionTypeStruct
            ? data['dog_type']
            : SelectableOptionTypeStruct.maybeFromMap(data['dog_type']),
        birthDate: data['birth_date'] as DateTime?,
      );

  static DogRelationTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? DogRelationTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'action': _action,
        'key': _key,
        'title': _title,
        'description': _description,
        'gender': _gender,
        'dog_type': _dogType?.toMap(),
        'birth_date': _birthDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'action': serializeParam(
          _action,
          ParamType.String,
        ),
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.int,
        ),
        'dog_type': serializeParam(
          _dogType,
          ParamType.DataStruct,
        ),
        'birth_date': serializeParam(
          _birthDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DogRelationTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DogRelationTypeStruct(
        action: deserializeParam(
          data['action'],
          ParamType.String,
          false,
        ),
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.int,
          false,
        ),
        dogType: deserializeStructParam(
          data['dog_type'],
          ParamType.DataStruct,
          false,
          structBuilder: SelectableOptionTypeStruct.fromSerializableMap,
        ),
        birthDate: deserializeParam(
          data['birth_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DogRelationTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DogRelationTypeStruct &&
        action == other.action &&
        key == other.key &&
        title == other.title &&
        description == other.description &&
        gender == other.gender &&
        dogType == other.dogType &&
        birthDate == other.birthDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([action, key, title, description, gender, dogType, birthDate]);
}

DogRelationTypeStruct createDogRelationTypeStruct({
  String? action,
  String? key,
  String? title,
  String? description,
  int? gender,
  SelectableOptionTypeStruct? dogType,
  DateTime? birthDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DogRelationTypeStruct(
      action: action,
      key: key,
      title: title,
      description: description,
      gender: gender,
      dogType:
          dogType ?? (clearUnsetFields ? SelectableOptionTypeStruct() : null),
      birthDate: birthDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DogRelationTypeStruct? updateDogRelationTypeStruct(
  DogRelationTypeStruct? dogRelationType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dogRelationType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDogRelationTypeStructData(
  Map<String, dynamic> firestoreData,
  DogRelationTypeStruct? dogRelationType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dogRelationType == null) {
    return;
  }
  if (dogRelationType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dogRelationType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dogRelationTypeData =
      getDogRelationTypeFirestoreData(dogRelationType, forFieldValue);
  final nestedData =
      dogRelationTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dogRelationType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDogRelationTypeFirestoreData(
  DogRelationTypeStruct? dogRelationType, [
  bool forFieldValue = false,
]) {
  if (dogRelationType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dogRelationType.toMap());

  // Handle nested data for "dog_type" field.
  addSelectableOptionTypeStructData(
    firestoreData,
    dogRelationType.hasDogType() ? dogRelationType.dogType : null,
    'dog_type',
    forFieldValue,
  );

  // Add any Firestore field values
  dogRelationType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDogRelationTypeListFirestoreData(
  List<DogRelationTypeStruct>? dogRelationTypes,
) =>
    dogRelationTypes
        ?.map((e) => getDogRelationTypeFirestoreData(e, true))
        .toList() ??
    [];
