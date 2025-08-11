// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationTypeStruct extends FFFirebaseStruct {
  NotificationTypeStruct({
    int? id,
    String? time,
    String? type,
    bool? isRead,
    LikeStruct? like,
    FriendRequestStruct? friendRequest,
    UserStruct? touchedUser,
    String? chatToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _time = time,
        _type = type,
        _isRead = isRead,
        _like = like,
        _friendRequest = friendRequest,
        _touchedUser = touchedUser,
        _chatToken = chatToken,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  set isRead(bool? val) => _isRead = val;

  bool hasIsRead() => _isRead != null;

  // "like" field.
  LikeStruct? _like;
  LikeStruct get like => _like ?? LikeStruct();
  set like(LikeStruct? val) => _like = val;

  void updateLike(Function(LikeStruct) updateFn) {
    updateFn(_like ??= LikeStruct());
  }

  bool hasLike() => _like != null;

  // "friend_request" field.
  FriendRequestStruct? _friendRequest;
  FriendRequestStruct get friendRequest =>
      _friendRequest ?? FriendRequestStruct();
  set friendRequest(FriendRequestStruct? val) => _friendRequest = val;

  void updateFriendRequest(Function(FriendRequestStruct) updateFn) {
    updateFn(_friendRequest ??= FriendRequestStruct());
  }

  bool hasFriendRequest() => _friendRequest != null;

  // "touched_user" field.
  UserStruct? _touchedUser;
  UserStruct get touchedUser => _touchedUser ?? UserStruct();
  set touchedUser(UserStruct? val) => _touchedUser = val;

  void updateTouchedUser(Function(UserStruct) updateFn) {
    updateFn(_touchedUser ??= UserStruct());
  }

  bool hasTouchedUser() => _touchedUser != null;

  // "chat_token" field.
  String? _chatToken;
  String get chatToken => _chatToken ?? '';
  set chatToken(String? val) => _chatToken = val;

  bool hasChatToken() => _chatToken != null;

  static NotificationTypeStruct fromMap(Map<String, dynamic> data) =>
      NotificationTypeStruct(
        id: castToType<int>(data['id']),
        time: data['time'] as String?,
        type: data['type'] as String?,
        isRead: data['is_read'] as bool?,
        like: data['like'] is LikeStruct
            ? data['like']
            : LikeStruct.maybeFromMap(data['like']),
        friendRequest: data['friend_request'] is FriendRequestStruct
            ? data['friend_request']
            : FriendRequestStruct.maybeFromMap(data['friend_request']),
        touchedUser: data['touched_user'] is UserStruct
            ? data['touched_user']
            : UserStruct.maybeFromMap(data['touched_user']),
        chatToken: data['chat_token'] as String?,
      );

  static NotificationTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'time': _time,
        'type': _type,
        'is_read': _isRead,
        'like': _like?.toMap(),
        'friend_request': _friendRequest?.toMap(),
        'touched_user': _touchedUser?.toMap(),
        'chat_token': _chatToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'is_read': serializeParam(
          _isRead,
          ParamType.bool,
        ),
        'like': serializeParam(
          _like,
          ParamType.DataStruct,
        ),
        'friend_request': serializeParam(
          _friendRequest,
          ParamType.DataStruct,
        ),
        'touched_user': serializeParam(
          _touchedUser,
          ParamType.DataStruct,
        ),
        'chat_token': serializeParam(
          _chatToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        isRead: deserializeParam(
          data['is_read'],
          ParamType.bool,
          false,
        ),
        like: deserializeStructParam(
          data['like'],
          ParamType.DataStruct,
          false,
          structBuilder: LikeStruct.fromSerializableMap,
        ),
        friendRequest: deserializeStructParam(
          data['friend_request'],
          ParamType.DataStruct,
          false,
          structBuilder: FriendRequestStruct.fromSerializableMap,
        ),
        touchedUser: deserializeStructParam(
          data['touched_user'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        chatToken: deserializeParam(
          data['chat_token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationTypeStruct &&
        id == other.id &&
        time == other.time &&
        type == other.type &&
        isRead == other.isRead &&
        like == other.like &&
        friendRequest == other.friendRequest &&
        touchedUser == other.touchedUser &&
        chatToken == other.chatToken;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, time, type, isRead, like, friendRequest, touchedUser, chatToken]);
}

NotificationTypeStruct createNotificationTypeStruct({
  int? id,
  String? time,
  String? type,
  bool? isRead,
  LikeStruct? like,
  FriendRequestStruct? friendRequest,
  UserStruct? touchedUser,
  String? chatToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationTypeStruct(
      id: id,
      time: time,
      type: type,
      isRead: isRead,
      like: like ?? (clearUnsetFields ? LikeStruct() : null),
      friendRequest:
          friendRequest ?? (clearUnsetFields ? FriendRequestStruct() : null),
      touchedUser: touchedUser ?? (clearUnsetFields ? UserStruct() : null),
      chatToken: chatToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationTypeStruct? updateNotificationTypeStruct(
  NotificationTypeStruct? notificationType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationTypeStructData(
  Map<String, dynamic> firestoreData,
  NotificationTypeStruct? notificationType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationType == null) {
    return;
  }
  if (notificationType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notificationType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationTypeData =
      getNotificationTypeFirestoreData(notificationType, forFieldValue);
  final nestedData =
      notificationTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notificationType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationTypeFirestoreData(
  NotificationTypeStruct? notificationType, [
  bool forFieldValue = false,
]) {
  if (notificationType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationType.toMap());

  // Handle nested data for "like" field.
  addLikeStructData(
    firestoreData,
    notificationType.hasLike() ? notificationType.like : null,
    'like',
    forFieldValue,
  );

  // Handle nested data for "friend_request" field.
  addFriendRequestStructData(
    firestoreData,
    notificationType.hasFriendRequest() ? notificationType.friendRequest : null,
    'friend_request',
    forFieldValue,
  );

  // Handle nested data for "touched_user" field.
  addUserStructData(
    firestoreData,
    notificationType.hasTouchedUser() ? notificationType.touchedUser : null,
    'touched_user',
    forFieldValue,
  );

  // Add any Firestore field values
  notificationType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationTypeListFirestoreData(
  List<NotificationTypeStruct>? notificationTypes,
) =>
    notificationTypes
        ?.map((e) => getNotificationTypeFirestoreData(e, true))
        .toList() ??
    [];
