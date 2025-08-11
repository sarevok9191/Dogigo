// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SwipeItemOwnerTypeStruct extends FFFirebaseStruct {
  SwipeItemOwnerTypeStruct({
    int? id,
    List<String>? image,
    String? name,
    int? age,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _image = image,
        _name = name,
        _age = age,
        _description = description,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  set image(List<String>? val) => _image = val;

  void updateImage(Function(List<String>) updateFn) {
    updateFn(_image ??= []);
  }

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static SwipeItemOwnerTypeStruct fromMap(Map<String, dynamic> data) =>
      SwipeItemOwnerTypeStruct(
        id: castToType<int>(data['id']),
        image: getDataList(data['image']),
        name: data['name'] as String?,
        age: castToType<int>(data['age']),
        description: data['description'] as String?,
      );

  static SwipeItemOwnerTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? SwipeItemOwnerTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'image': _image,
        'name': _name,
        'age': _age,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
          isList: true,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static SwipeItemOwnerTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SwipeItemOwnerTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        image: deserializeParam<String>(
          data['image'],
          ParamType.String,
          true,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SwipeItemOwnerTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SwipeItemOwnerTypeStruct &&
        id == other.id &&
        listEquality.equals(image, other.image) &&
        name == other.name &&
        age == other.age &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, image, name, age, description]);
}

SwipeItemOwnerTypeStruct createSwipeItemOwnerTypeStruct({
  int? id,
  String? name,
  int? age,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SwipeItemOwnerTypeStruct(
      id: id,
      name: name,
      age: age,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SwipeItemOwnerTypeStruct? updateSwipeItemOwnerTypeStruct(
  SwipeItemOwnerTypeStruct? swipeItemOwnerType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    swipeItemOwnerType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSwipeItemOwnerTypeStructData(
  Map<String, dynamic> firestoreData,
  SwipeItemOwnerTypeStruct? swipeItemOwnerType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (swipeItemOwnerType == null) {
    return;
  }
  if (swipeItemOwnerType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && swipeItemOwnerType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final swipeItemOwnerTypeData =
      getSwipeItemOwnerTypeFirestoreData(swipeItemOwnerType, forFieldValue);
  final nestedData =
      swipeItemOwnerTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      swipeItemOwnerType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSwipeItemOwnerTypeFirestoreData(
  SwipeItemOwnerTypeStruct? swipeItemOwnerType, [
  bool forFieldValue = false,
]) {
  if (swipeItemOwnerType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(swipeItemOwnerType.toMap());

  // Add any Firestore field values
  swipeItemOwnerType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSwipeItemOwnerTypeListFirestoreData(
  List<SwipeItemOwnerTypeStruct>? swipeItemOwnerTypes,
) =>
    swipeItemOwnerTypes
        ?.map((e) => getSwipeItemOwnerTypeFirestoreData(e, true))
        .toList() ??
    [];
