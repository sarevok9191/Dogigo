// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockedUserStruct extends FFFirebaseStruct {
  BlockedUserStruct({
    int? id,
    String? fullName,
    FileTypeStruct? avatar,
    bool? isBlocked,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _fullName = fullName,
        _avatar = avatar,
        _isBlocked = isBlocked,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "avatar" field.
  FileTypeStruct? _avatar;
  FileTypeStruct get avatar => _avatar ?? FileTypeStruct();
  set avatar(FileTypeStruct? val) => _avatar = val;

  void updateAvatar(Function(FileTypeStruct) updateFn) {
    updateFn(_avatar ??= FileTypeStruct());
  }

  bool hasAvatar() => _avatar != null;

  // "is_blocked" field.
  bool? _isBlocked;
  bool get isBlocked => _isBlocked ?? false;
  set isBlocked(bool? val) => _isBlocked = val;

  bool hasIsBlocked() => _isBlocked != null;

  static BlockedUserStruct fromMap(Map<String, dynamic> data) =>
      BlockedUserStruct(
        id: castToType<int>(data['id']),
        fullName: data['full_name'] as String?,
        avatar: data['avatar'] is FileTypeStruct
            ? data['avatar']
            : FileTypeStruct.maybeFromMap(data['avatar']),
        isBlocked: data['is_blocked'] as bool?,
      );

  static BlockedUserStruct? maybeFromMap(dynamic data) => data is Map
      ? BlockedUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'full_name': _fullName,
        'avatar': _avatar?.toMap(),
        'is_blocked': _isBlocked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.DataStruct,
        ),
        'is_blocked': serializeParam(
          _isBlocked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BlockedUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlockedUserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        avatar: deserializeStructParam(
          data['avatar'],
          ParamType.DataStruct,
          false,
          structBuilder: FileTypeStruct.fromSerializableMap,
        ),
        isBlocked: deserializeParam(
          data['is_blocked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BlockedUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BlockedUserStruct &&
        id == other.id &&
        fullName == other.fullName &&
        avatar == other.avatar &&
        isBlocked == other.isBlocked;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, fullName, avatar, isBlocked]);
}

BlockedUserStruct createBlockedUserStruct({
  int? id,
  String? fullName,
  FileTypeStruct? avatar,
  bool? isBlocked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlockedUserStruct(
      id: id,
      fullName: fullName,
      avatar: avatar ?? (clearUnsetFields ? FileTypeStruct() : null),
      isBlocked: isBlocked,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlockedUserStruct? updateBlockedUserStruct(
  BlockedUserStruct? blockedUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blockedUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlockedUserStructData(
  Map<String, dynamic> firestoreData,
  BlockedUserStruct? blockedUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blockedUser == null) {
    return;
  }
  if (blockedUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && blockedUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blockedUserData =
      getBlockedUserFirestoreData(blockedUser, forFieldValue);
  final nestedData =
      blockedUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blockedUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlockedUserFirestoreData(
  BlockedUserStruct? blockedUser, [
  bool forFieldValue = false,
]) {
  if (blockedUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blockedUser.toMap());

  // Handle nested data for "avatar" field.
  addFileTypeStructData(
    firestoreData,
    blockedUser.hasAvatar() ? blockedUser.avatar : null,
    'avatar',
    forFieldValue,
  );

  // Add any Firestore field values
  blockedUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlockedUserListFirestoreData(
  List<BlockedUserStruct>? blockedUsers,
) =>
    blockedUsers?.map((e) => getBlockedUserFirestoreData(e, true)).toList() ??
    [];
