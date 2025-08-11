// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SearchResultItemStruct extends FFFirebaseStruct {
  SearchResultItemStruct({
    int? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? avatar,
    bool? isOnline,
    bool? isFriend,
    String? username,
    String? chatToken,
    bool? hasFriendRequest,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _fullName = fullName,
        _avatar = avatar,
        _isOnline = isOnline,
        _isFriend = isFriend,
        _username = username,
        _chatToken = chatToken,
        _hasFriendRequest = hasFriendRequest,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "is_online" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  set isOnline(bool? val) => _isOnline = val;

  bool hasIsOnline() => _isOnline != null;

  // "is_friend" field.
  bool? _isFriend;
  bool get isFriend => _isFriend ?? false;
  set isFriend(bool? val) => _isFriend = val;

  bool hasIsFriend() => _isFriend != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "chat_token" field.
  String? _chatToken;
  String get chatToken => _chatToken ?? '';
  set chatToken(String? val) => _chatToken = val;

  bool hasChatToken() => _chatToken != null;

  // "has_friend_request" field.
  bool? _hasFriendRequest;
  bool get hasFriendRequest => _hasFriendRequest ?? false;
  set hasFriendRequest(bool? val) => _hasFriendRequest = val;

  bool hasHasFriendRequest() => _hasFriendRequest != null;

  static SearchResultItemStruct fromMap(Map<String, dynamic> data) =>
      SearchResultItemStruct(
        id: castToType<int>(data['id']),
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        fullName: data['full_name'] as String?,
        avatar: data['avatar'] as String?,
        isOnline: data['is_online'] as bool?,
        isFriend: data['is_friend'] as bool?,
        username: data['username'] as String?,
        chatToken: data['chat_token'] as String?,
        hasFriendRequest: data['has_friend_request'] as bool?,
      );

  static SearchResultItemStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'first_name': _firstName,
        'last_name': _lastName,
        'full_name': _fullName,
        'avatar': _avatar,
        'is_online': _isOnline,
        'is_friend': _isFriend,
        'username': _username,
        'chat_token': _chatToken,
        'has_friend_request': _hasFriendRequest,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'is_online': serializeParam(
          _isOnline,
          ParamType.bool,
        ),
        'is_friend': serializeParam(
          _isFriend,
          ParamType.bool,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'chat_token': serializeParam(
          _chatToken,
          ParamType.String,
        ),
        'has_friend_request': serializeParam(
          _hasFriendRequest,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SearchResultItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchResultItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        isOnline: deserializeParam(
          data['is_online'],
          ParamType.bool,
          false,
        ),
        isFriend: deserializeParam(
          data['is_friend'],
          ParamType.bool,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        chatToken: deserializeParam(
          data['chat_token'],
          ParamType.String,
          false,
        ),
        hasFriendRequest: deserializeParam(
          data['has_friend_request'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SearchResultItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultItemStruct &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        fullName == other.fullName &&
        avatar == other.avatar &&
        isOnline == other.isOnline &&
        isFriend == other.isFriend &&
        username == other.username &&
        chatToken == other.chatToken &&
        hasFriendRequest == other.hasFriendRequest;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        firstName,
        lastName,
        fullName,
        avatar,
        isOnline,
        isFriend,
        username,
        chatToken,
        hasFriendRequest
      ]);
}

SearchResultItemStruct createSearchResultItemStruct({
  int? id,
  String? firstName,
  String? lastName,
  String? fullName,
  String? avatar,
  bool? isOnline,
  bool? isFriend,
  String? username,
  String? chatToken,
  bool? hasFriendRequest,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchResultItemStruct(
      id: id,
      firstName: firstName,
      lastName: lastName,
      fullName: fullName,
      avatar: avatar,
      isOnline: isOnline,
      isFriend: isFriend,
      username: username,
      chatToken: chatToken,
      hasFriendRequest: hasFriendRequest,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchResultItemStruct? updateSearchResultItemStruct(
  SearchResultItemStruct? searchResultItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchResultItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchResultItemStructData(
  Map<String, dynamic> firestoreData,
  SearchResultItemStruct? searchResultItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchResultItem == null) {
    return;
  }
  if (searchResultItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchResultItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchResultItemData =
      getSearchResultItemFirestoreData(searchResultItem, forFieldValue);
  final nestedData =
      searchResultItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = searchResultItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchResultItemFirestoreData(
  SearchResultItemStruct? searchResultItem, [
  bool forFieldValue = false,
]) {
  if (searchResultItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchResultItem.toMap());

  // Add any Firestore field values
  searchResultItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchResultItemListFirestoreData(
  List<SearchResultItemStruct>? searchResultItems,
) =>
    searchResultItems
        ?.map((e) => getSearchResultItemFirestoreData(e, true))
        .toList() ??
    [];
