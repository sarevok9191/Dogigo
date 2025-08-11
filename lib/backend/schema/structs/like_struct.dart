// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikeStruct extends FFFirebaseStruct {
  LikeStruct({
    int? id,
    DogTypeStruct? dog,
    DogTypeStruct? userDog,
    UserStruct? user,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _dog = dog,
        _userDog = userDog,
        _user = user,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "dog" field.
  DogTypeStruct? _dog;
  DogTypeStruct get dog => _dog ?? DogTypeStruct();
  set dog(DogTypeStruct? val) => _dog = val;

  void updateDog(Function(DogTypeStruct) updateFn) {
    updateFn(_dog ??= DogTypeStruct());
  }

  bool hasDog() => _dog != null;

  // "user_dog" field.
  DogTypeStruct? _userDog;
  DogTypeStruct get userDog => _userDog ?? DogTypeStruct();
  set userDog(DogTypeStruct? val) => _userDog = val;

  void updateUserDog(Function(DogTypeStruct) updateFn) {
    updateFn(_userDog ??= DogTypeStruct());
  }

  bool hasUserDog() => _userDog != null;

  // "user" field.
  UserStruct? _user;
  UserStruct get user => _user ?? UserStruct();
  set user(UserStruct? val) => _user = val;

  void updateUser(Function(UserStruct) updateFn) {
    updateFn(_user ??= UserStruct());
  }

  bool hasUser() => _user != null;

  static LikeStruct fromMap(Map<String, dynamic> data) => LikeStruct(
        id: castToType<int>(data['id']),
        dog: data['dog'] is DogTypeStruct
            ? data['dog']
            : DogTypeStruct.maybeFromMap(data['dog']),
        userDog: data['user_dog'] is DogTypeStruct
            ? data['user_dog']
            : DogTypeStruct.maybeFromMap(data['user_dog']),
        user: data['user'] is UserStruct
            ? data['user']
            : UserStruct.maybeFromMap(data['user']),
      );

  static LikeStruct? maybeFromMap(dynamic data) =>
      data is Map ? LikeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'dog': _dog?.toMap(),
        'user_dog': _userDog?.toMap(),
        'user': _user?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'dog': serializeParam(
          _dog,
          ParamType.DataStruct,
        ),
        'user_dog': serializeParam(
          _userDog,
          ParamType.DataStruct,
        ),
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static LikeStruct fromSerializableMap(Map<String, dynamic> data) =>
      LikeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        dog: deserializeStructParam(
          data['dog'],
          ParamType.DataStruct,
          false,
          structBuilder: DogTypeStruct.fromSerializableMap,
        ),
        userDog: deserializeStructParam(
          data['user_dog'],
          ParamType.DataStruct,
          false,
          structBuilder: DogTypeStruct.fromSerializableMap,
        ),
        user: deserializeStructParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LikeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LikeStruct &&
        id == other.id &&
        dog == other.dog &&
        userDog == other.userDog &&
        user == other.user;
  }

  @override
  int get hashCode => const ListEquality().hash([id, dog, userDog, user]);
}

LikeStruct createLikeStruct({
  int? id,
  DogTypeStruct? dog,
  DogTypeStruct? userDog,
  UserStruct? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LikeStruct(
      id: id,
      dog: dog ?? (clearUnsetFields ? DogTypeStruct() : null),
      userDog: userDog ?? (clearUnsetFields ? DogTypeStruct() : null),
      user: user ?? (clearUnsetFields ? UserStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LikeStruct? updateLikeStruct(
  LikeStruct? like, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    like
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLikeStructData(
  Map<String, dynamic> firestoreData,
  LikeStruct? like,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (like == null) {
    return;
  }
  if (like.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && like.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final likeData = getLikeFirestoreData(like, forFieldValue);
  final nestedData = likeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = like.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLikeFirestoreData(
  LikeStruct? like, [
  bool forFieldValue = false,
]) {
  if (like == null) {
    return {};
  }
  final firestoreData = mapToFirestore(like.toMap());

  // Handle nested data for "dog" field.
  addDogTypeStructData(
    firestoreData,
    like.hasDog() ? like.dog : null,
    'dog',
    forFieldValue,
  );

  // Handle nested data for "user_dog" field.
  addDogTypeStructData(
    firestoreData,
    like.hasUserDog() ? like.userDog : null,
    'user_dog',
    forFieldValue,
  );

  // Handle nested data for "user" field.
  addUserStructData(
    firestoreData,
    like.hasUser() ? like.user : null,
    'user',
    forFieldValue,
  );

  // Add any Firestore field values
  like.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLikeListFirestoreData(
  List<LikeStruct>? likes,
) =>
    likes?.map((e) => getLikeFirestoreData(e, true)).toList() ?? [];
