// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SiderBarStruct extends FFFirebaseStruct {
  SiderBarStruct({
    String? avatar,
    String? username,
    String? fullName,
    String? firstName,
    int? friendCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _avatar = avatar,
        _username = username,
        _fullName = fullName,
        _firstName = firstName,
        _friendCount = friendCount,
        super(firestoreUtilData);

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "friend_count" field.
  int? _friendCount;
  int get friendCount => _friendCount ?? 0;
  set friendCount(int? val) => _friendCount = val;

  void incrementFriendCount(int amount) => friendCount = friendCount + amount;

  bool hasFriendCount() => _friendCount != null;

  static SiderBarStruct fromMap(Map<String, dynamic> data) => SiderBarStruct(
        avatar: data['avatar'] as String?,
        username: data['username'] as String?,
        fullName: data['full_name'] as String?,
        firstName: data['first_name'] as String?,
        friendCount: castToType<int>(data['friend_count']),
      );

  static SiderBarStruct? maybeFromMap(dynamic data) =>
      data is Map ? SiderBarStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'avatar': _avatar,
        'username': _username,
        'full_name': _fullName,
        'first_name': _firstName,
        'friend_count': _friendCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'friend_count': serializeParam(
          _friendCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static SiderBarStruct fromSerializableMap(Map<String, dynamic> data) =>
      SiderBarStruct(
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        friendCount: deserializeParam(
          data['friend_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SiderBarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SiderBarStruct &&
        avatar == other.avatar &&
        username == other.username &&
        fullName == other.fullName &&
        firstName == other.firstName &&
        friendCount == other.friendCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([avatar, username, fullName, firstName, friendCount]);
}

SiderBarStruct createSiderBarStruct({
  String? avatar,
  String? username,
  String? fullName,
  String? firstName,
  int? friendCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SiderBarStruct(
      avatar: avatar,
      username: username,
      fullName: fullName,
      firstName: firstName,
      friendCount: friendCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SiderBarStruct? updateSiderBarStruct(
  SiderBarStruct? siderBar, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    siderBar
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSiderBarStructData(
  Map<String, dynamic> firestoreData,
  SiderBarStruct? siderBar,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (siderBar == null) {
    return;
  }
  if (siderBar.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && siderBar.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final siderBarData = getSiderBarFirestoreData(siderBar, forFieldValue);
  final nestedData = siderBarData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = siderBar.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSiderBarFirestoreData(
  SiderBarStruct? siderBar, [
  bool forFieldValue = false,
]) {
  if (siderBar == null) {
    return {};
  }
  final firestoreData = mapToFirestore(siderBar.toMap());

  // Add any Firestore field values
  siderBar.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSiderBarListFirestoreData(
  List<SiderBarStruct>? siderBars,
) =>
    siderBars?.map((e) => getSiderBarFirestoreData(e, true)).toList() ?? [];
