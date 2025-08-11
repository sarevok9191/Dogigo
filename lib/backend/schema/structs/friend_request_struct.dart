// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendRequestStruct extends FFFirebaseStruct {
  FriendRequestStruct({
    int? id,
    DogTypeStruct? userDog,
    DogTypeStruct? requestedDog,
    UserStruct? user,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _userDog = userDog,
        _requestedDog = requestedDog,
        _user = user,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "user_dog" field.
  DogTypeStruct? _userDog;
  DogTypeStruct get userDog => _userDog ?? DogTypeStruct();
  set userDog(DogTypeStruct? val) => _userDog = val;

  void updateUserDog(Function(DogTypeStruct) updateFn) {
    updateFn(_userDog ??= DogTypeStruct());
  }

  bool hasUserDog() => _userDog != null;

  // "requested_dog" field.
  DogTypeStruct? _requestedDog;
  DogTypeStruct get requestedDog => _requestedDog ?? DogTypeStruct();
  set requestedDog(DogTypeStruct? val) => _requestedDog = val;

  void updateRequestedDog(Function(DogTypeStruct) updateFn) {
    updateFn(_requestedDog ??= DogTypeStruct());
  }

  bool hasRequestedDog() => _requestedDog != null;

  // "user" field.
  UserStruct? _user;
  UserStruct get user => _user ?? UserStruct();
  set user(UserStruct? val) => _user = val;

  void updateUser(Function(UserStruct) updateFn) {
    updateFn(_user ??= UserStruct());
  }

  bool hasUser() => _user != null;

  static FriendRequestStruct fromMap(Map<String, dynamic> data) =>
      FriendRequestStruct(
        id: castToType<int>(data['id']),
        userDog: data['user_dog'] is DogTypeStruct
            ? data['user_dog']
            : DogTypeStruct.maybeFromMap(data['user_dog']),
        requestedDog: data['requested_dog'] is DogTypeStruct
            ? data['requested_dog']
            : DogTypeStruct.maybeFromMap(data['requested_dog']),
        user: data['user'] is UserStruct
            ? data['user']
            : UserStruct.maybeFromMap(data['user']),
      );

  static FriendRequestStruct? maybeFromMap(dynamic data) => data is Map
      ? FriendRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_dog': _userDog?.toMap(),
        'requested_dog': _requestedDog?.toMap(),
        'user': _user?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user_dog': serializeParam(
          _userDog,
          ParamType.DataStruct,
        ),
        'requested_dog': serializeParam(
          _requestedDog,
          ParamType.DataStruct,
        ),
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FriendRequestStruct fromSerializableMap(Map<String, dynamic> data) =>
      FriendRequestStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userDog: deserializeStructParam(
          data['user_dog'],
          ParamType.DataStruct,
          false,
          structBuilder: DogTypeStruct.fromSerializableMap,
        ),
        requestedDog: deserializeStructParam(
          data['requested_dog'],
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
  String toString() => 'FriendRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FriendRequestStruct &&
        id == other.id &&
        userDog == other.userDog &&
        requestedDog == other.requestedDog &&
        user == other.user;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, userDog, requestedDog, user]);
}

FriendRequestStruct createFriendRequestStruct({
  int? id,
  DogTypeStruct? userDog,
  DogTypeStruct? requestedDog,
  UserStruct? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FriendRequestStruct(
      id: id,
      userDog: userDog ?? (clearUnsetFields ? DogTypeStruct() : null),
      requestedDog: requestedDog ?? (clearUnsetFields ? DogTypeStruct() : null),
      user: user ?? (clearUnsetFields ? UserStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FriendRequestStruct? updateFriendRequestStruct(
  FriendRequestStruct? friendRequest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    friendRequest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFriendRequestStructData(
  Map<String, dynamic> firestoreData,
  FriendRequestStruct? friendRequest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (friendRequest == null) {
    return;
  }
  if (friendRequest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && friendRequest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final friendRequestData =
      getFriendRequestFirestoreData(friendRequest, forFieldValue);
  final nestedData =
      friendRequestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = friendRequest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFriendRequestFirestoreData(
  FriendRequestStruct? friendRequest, [
  bool forFieldValue = false,
]) {
  if (friendRequest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(friendRequest.toMap());

  // Handle nested data for "user_dog" field.
  addDogTypeStructData(
    firestoreData,
    friendRequest.hasUserDog() ? friendRequest.userDog : null,
    'user_dog',
    forFieldValue,
  );

  // Handle nested data for "requested_dog" field.
  addDogTypeStructData(
    firestoreData,
    friendRequest.hasRequestedDog() ? friendRequest.requestedDog : null,
    'requested_dog',
    forFieldValue,
  );

  // Handle nested data for "user" field.
  addUserStructData(
    firestoreData,
    friendRequest.hasUser() ? friendRequest.user : null,
    'user',
    forFieldValue,
  );

  // Add any Firestore field values
  friendRequest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFriendRequestListFirestoreData(
  List<FriendRequestStruct>? friendRequests,
) =>
    friendRequests
        ?.map((e) => getFriendRequestFirestoreData(e, true))
        .toList() ??
    [];
