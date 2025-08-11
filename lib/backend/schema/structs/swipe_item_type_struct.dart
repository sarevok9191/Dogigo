// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SwipeItemTypeStruct extends FFFirebaseStruct {
  SwipeItemTypeStruct({
    int? id,
    List<String>? images,
    bool? isOnline,
    String? name,
    int? age,
    String? kind,
    String? description,
    SwipeItemOwnerTypeStruct? owner,
    double? distance,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _images = images,
        _isOnline = isOnline,
        _name = name,
        _age = age,
        _kind = kind,
        _description = description,
        _owner = owner,
        _distance = distance,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "isOnline" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  set isOnline(bool? val) => _isOnline = val;

  bool hasIsOnline() => _isOnline != null;

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

  // "kind" field.
  String? _kind;
  String get kind => _kind ?? '';
  set kind(String? val) => _kind = val;

  bool hasKind() => _kind != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "owner" field.
  SwipeItemOwnerTypeStruct? _owner;
  SwipeItemOwnerTypeStruct get owner => _owner ?? SwipeItemOwnerTypeStruct();
  set owner(SwipeItemOwnerTypeStruct? val) => _owner = val;

  void updateOwner(Function(SwipeItemOwnerTypeStruct) updateFn) {
    updateFn(_owner ??= SwipeItemOwnerTypeStruct());
  }

  bool hasOwner() => _owner != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  set distance(double? val) => _distance = val;

  void incrementDistance(double amount) => distance = distance + amount;

  bool hasDistance() => _distance != null;

  static SwipeItemTypeStruct fromMap(Map<String, dynamic> data) =>
      SwipeItemTypeStruct(
        id: castToType<int>(data['id']),
        images: getDataList(data['images']),
        isOnline: data['isOnline'] as bool?,
        name: data['name'] as String?,
        age: castToType<int>(data['age']),
        kind: data['kind'] as String?,
        description: data['description'] as String?,
        owner: data['owner'] is SwipeItemOwnerTypeStruct
            ? data['owner']
            : SwipeItemOwnerTypeStruct.maybeFromMap(data['owner']),
        distance: castToType<double>(data['distance']),
      );

  static SwipeItemTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? SwipeItemTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'images': _images,
        'isOnline': _isOnline,
        'name': _name,
        'age': _age,
        'kind': _kind,
        'description': _description,
        'owner': _owner?.toMap(),
        'distance': _distance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'isOnline': serializeParam(
          _isOnline,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'kind': serializeParam(
          _kind,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.DataStruct,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.double,
        ),
      }.withoutNulls;

  static SwipeItemTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SwipeItemTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        isOnline: deserializeParam(
          data['isOnline'],
          ParamType.bool,
          false,
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
        kind: deserializeParam(
          data['kind'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        owner: deserializeStructParam(
          data['owner'],
          ParamType.DataStruct,
          false,
          structBuilder: SwipeItemOwnerTypeStruct.fromSerializableMap,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SwipeItemTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SwipeItemTypeStruct &&
        id == other.id &&
        listEquality.equals(images, other.images) &&
        isOnline == other.isOnline &&
        name == other.name &&
        age == other.age &&
        kind == other.kind &&
        description == other.description &&
        owner == other.owner &&
        distance == other.distance;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, images, isOnline, name, age, kind, description, owner, distance]);
}

SwipeItemTypeStruct createSwipeItemTypeStruct({
  int? id,
  bool? isOnline,
  String? name,
  int? age,
  String? kind,
  String? description,
  SwipeItemOwnerTypeStruct? owner,
  double? distance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SwipeItemTypeStruct(
      id: id,
      isOnline: isOnline,
      name: name,
      age: age,
      kind: kind,
      description: description,
      owner: owner ?? (clearUnsetFields ? SwipeItemOwnerTypeStruct() : null),
      distance: distance,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SwipeItemTypeStruct? updateSwipeItemTypeStruct(
  SwipeItemTypeStruct? swipeItemType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    swipeItemType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSwipeItemTypeStructData(
  Map<String, dynamic> firestoreData,
  SwipeItemTypeStruct? swipeItemType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (swipeItemType == null) {
    return;
  }
  if (swipeItemType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && swipeItemType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final swipeItemTypeData =
      getSwipeItemTypeFirestoreData(swipeItemType, forFieldValue);
  final nestedData =
      swipeItemTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = swipeItemType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSwipeItemTypeFirestoreData(
  SwipeItemTypeStruct? swipeItemType, [
  bool forFieldValue = false,
]) {
  if (swipeItemType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(swipeItemType.toMap());

  // Handle nested data for "owner" field.
  addSwipeItemOwnerTypeStructData(
    firestoreData,
    swipeItemType.hasOwner() ? swipeItemType.owner : null,
    'owner',
    forFieldValue,
  );

  // Add any Firestore field values
  swipeItemType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSwipeItemTypeListFirestoreData(
  List<SwipeItemTypeStruct>? swipeItemTypes,
) =>
    swipeItemTypes
        ?.map((e) => getSwipeItemTypeFirestoreData(e, true))
        .toList() ??
    [];
