// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SwipeItemStruct extends FFFirebaseStruct {
  SwipeItemStruct({
    UserStruct? user,
    DogTypeStruct? dog,
    bool? online,
    double? distance,
    String? distanceUnit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _dog = dog,
        _online = online,
        _distance = distance,
        _distanceUnit = distanceUnit,
        super(firestoreUtilData);

  // "user" field.
  UserStruct? _user;
  UserStruct get user => _user ?? UserStruct();
  set user(UserStruct? val) => _user = val;

  void updateUser(Function(UserStruct) updateFn) {
    updateFn(_user ??= UserStruct());
  }

  bool hasUser() => _user != null;

  // "dog" field.
  DogTypeStruct? _dog;
  DogTypeStruct get dog => _dog ?? DogTypeStruct();
  set dog(DogTypeStruct? val) => _dog = val;

  void updateDog(Function(DogTypeStruct) updateFn) {
    updateFn(_dog ??= DogTypeStruct());
  }

  bool hasDog() => _dog != null;

  // "online" field.
  bool? _online;
  bool get online => _online ?? false;
  set online(bool? val) => _online = val;

  bool hasOnline() => _online != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  set distance(double? val) => _distance = val;

  void incrementDistance(double amount) => distance = distance + amount;

  bool hasDistance() => _distance != null;

  // "distance_unit" field.
  String? _distanceUnit;
  String get distanceUnit => _distanceUnit ?? 'm';
  set distanceUnit(String? val) => _distanceUnit = val;

  bool hasDistanceUnit() => _distanceUnit != null;

  static SwipeItemStruct fromMap(Map<String, dynamic> data) => SwipeItemStruct(
        user: data['user'] is UserStruct
            ? data['user']
            : UserStruct.maybeFromMap(data['user']),
        dog: data['dog'] is DogTypeStruct
            ? data['dog']
            : DogTypeStruct.maybeFromMap(data['dog']),
        online: data['online'] as bool?,
        distance: castToType<double>(data['distance']),
        distanceUnit: data['distance_unit'] as String?,
      );

  static SwipeItemStruct? maybeFromMap(dynamic data) => data is Map
      ? SwipeItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user?.toMap(),
        'dog': _dog?.toMap(),
        'online': _online,
        'distance': _distance,
        'distance_unit': _distanceUnit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
        'dog': serializeParam(
          _dog,
          ParamType.DataStruct,
        ),
        'online': serializeParam(
          _online,
          ParamType.bool,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.double,
        ),
        'distance_unit': serializeParam(
          _distanceUnit,
          ParamType.String,
        ),
      }.withoutNulls;

  static SwipeItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      SwipeItemStruct(
        user: deserializeStructParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        dog: deserializeStructParam(
          data['dog'],
          ParamType.DataStruct,
          false,
          structBuilder: DogTypeStruct.fromSerializableMap,
        ),
        online: deserializeParam(
          data['online'],
          ParamType.bool,
          false,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.double,
          false,
        ),
        distanceUnit: deserializeParam(
          data['distance_unit'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SwipeItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SwipeItemStruct &&
        user == other.user &&
        dog == other.dog &&
        online == other.online &&
        distance == other.distance &&
        distanceUnit == other.distanceUnit;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([user, dog, online, distance, distanceUnit]);
}

SwipeItemStruct createSwipeItemStruct({
  UserStruct? user,
  DogTypeStruct? dog,
  bool? online,
  double? distance,
  String? distanceUnit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SwipeItemStruct(
      user: user ?? (clearUnsetFields ? UserStruct() : null),
      dog: dog ?? (clearUnsetFields ? DogTypeStruct() : null),
      online: online,
      distance: distance,
      distanceUnit: distanceUnit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SwipeItemStruct? updateSwipeItemStruct(
  SwipeItemStruct? swipeItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    swipeItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSwipeItemStructData(
  Map<String, dynamic> firestoreData,
  SwipeItemStruct? swipeItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (swipeItem == null) {
    return;
  }
  if (swipeItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && swipeItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final swipeItemData = getSwipeItemFirestoreData(swipeItem, forFieldValue);
  final nestedData = swipeItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = swipeItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSwipeItemFirestoreData(
  SwipeItemStruct? swipeItem, [
  bool forFieldValue = false,
]) {
  if (swipeItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(swipeItem.toMap());

  // Handle nested data for "user" field.
  addUserStructData(
    firestoreData,
    swipeItem.hasUser() ? swipeItem.user : null,
    'user',
    forFieldValue,
  );

  // Handle nested data for "dog" field.
  addDogTypeStructData(
    firestoreData,
    swipeItem.hasDog() ? swipeItem.dog : null,
    'dog',
    forFieldValue,
  );

  // Add any Firestore field values
  swipeItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSwipeItemListFirestoreData(
  List<SwipeItemStruct>? swipeItems,
) =>
    swipeItems?.map((e) => getSwipeItemFirestoreData(e, true)).toList() ?? [];
