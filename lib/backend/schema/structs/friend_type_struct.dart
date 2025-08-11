// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendTypeStruct extends FFFirebaseStruct {
  FriendTypeStruct({
    int? id,
    String? fullName,
    String? firstName,
    String? lastName,
    String? email,
    FileTypeStruct? avatar,
    String? username,
    String? userGender,
    String? about,
    List<FileTypeStruct>? userImage,
    int? friendCount,
    String? chatToken,
    bool? isSelected,
    DateTime? dateBirth,
    List<DogTypeStruct>? dogs,
    bool? isOnline,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _fullName = fullName,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _avatar = avatar,
        _username = username,
        _userGender = userGender,
        _about = about,
        _userImage = userImage,
        _friendCount = friendCount,
        _chatToken = chatToken,
        _isSelected = isSelected,
        _dateBirth = dateBirth,
        _dogs = dogs,
        _isOnline = isOnline,
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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "avatar" field.
  FileTypeStruct? _avatar;
  FileTypeStruct get avatar => _avatar ?? FileTypeStruct();
  set avatar(FileTypeStruct? val) => _avatar = val;

  void updateAvatar(Function(FileTypeStruct) updateFn) {
    updateFn(_avatar ??= FileTypeStruct());
  }

  bool hasAvatar() => _avatar != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "user_gender" field.
  String? _userGender;
  String get userGender => _userGender ?? '';
  set userGender(String? val) => _userGender = val;

  bool hasUserGender() => _userGender != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  set about(String? val) => _about = val;

  bool hasAbout() => _about != null;

  // "user_image" field.
  List<FileTypeStruct>? _userImage;
  List<FileTypeStruct> get userImage => _userImage ?? const [];
  set userImage(List<FileTypeStruct>? val) => _userImage = val;

  void updateUserImage(Function(List<FileTypeStruct>) updateFn) {
    updateFn(_userImage ??= []);
  }

  bool hasUserImage() => _userImage != null;

  // "friend_count" field.
  int? _friendCount;
  int get friendCount => _friendCount ?? 0;
  set friendCount(int? val) => _friendCount = val;

  void incrementFriendCount(int amount) => friendCount = friendCount + amount;

  bool hasFriendCount() => _friendCount != null;

  // "chat_token" field.
  String? _chatToken;
  String get chatToken => _chatToken ?? '';
  set chatToken(String? val) => _chatToken = val;

  bool hasChatToken() => _chatToken != null;

  // "is_selected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;

  bool hasIsSelected() => _isSelected != null;

  // "date_birth" field.
  DateTime? _dateBirth;
  DateTime? get dateBirth => _dateBirth;
  set dateBirth(DateTime? val) => _dateBirth = val;

  bool hasDateBirth() => _dateBirth != null;

  // "dogs" field.
  List<DogTypeStruct>? _dogs;
  List<DogTypeStruct> get dogs => _dogs ?? const [];
  set dogs(List<DogTypeStruct>? val) => _dogs = val;

  void updateDogs(Function(List<DogTypeStruct>) updateFn) {
    updateFn(_dogs ??= []);
  }

  bool hasDogs() => _dogs != null;

  // "is_online" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  set isOnline(bool? val) => _isOnline = val;

  bool hasIsOnline() => _isOnline != null;

  static FriendTypeStruct fromMap(Map<String, dynamic> data) =>
      FriendTypeStruct(
        id: castToType<int>(data['id']),
        fullName: data['full_name'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        email: data['email'] as String?,
        avatar: data['avatar'] is FileTypeStruct
            ? data['avatar']
            : FileTypeStruct.maybeFromMap(data['avatar']),
        username: data['username'] as String?,
        userGender: data['user_gender'] as String?,
        about: data['about'] as String?,
        userImage: getStructList(
          data['user_image'],
          FileTypeStruct.fromMap,
        ),
        friendCount: castToType<int>(data['friend_count']),
        chatToken: data['chat_token'] as String?,
        isSelected: data['is_selected'] as bool?,
        dateBirth: data['date_birth'] as DateTime?,
        dogs: getStructList(
          data['dogs'],
          DogTypeStruct.fromMap,
        ),
        isOnline: data['is_online'] as bool?,
      );

  static FriendTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? FriendTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'full_name': _fullName,
        'first_name': _firstName,
        'last_name': _lastName,
        'email': _email,
        'avatar': _avatar?.toMap(),
        'username': _username,
        'user_gender': _userGender,
        'about': _about,
        'user_image': _userImage?.map((e) => e.toMap()).toList(),
        'friend_count': _friendCount,
        'chat_token': _chatToken,
        'is_selected': _isSelected,
        'date_birth': _dateBirth,
        'dogs': _dogs?.map((e) => e.toMap()).toList(),
        'is_online': _isOnline,
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
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.DataStruct,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'user_gender': serializeParam(
          _userGender,
          ParamType.String,
        ),
        'about': serializeParam(
          _about,
          ParamType.String,
        ),
        'user_image': serializeParam(
          _userImage,
          ParamType.DataStruct,
          isList: true,
        ),
        'friend_count': serializeParam(
          _friendCount,
          ParamType.int,
        ),
        'chat_token': serializeParam(
          _chatToken,
          ParamType.String,
        ),
        'is_selected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
        'date_birth': serializeParam(
          _dateBirth,
          ParamType.DateTime,
        ),
        'dogs': serializeParam(
          _dogs,
          ParamType.DataStruct,
          isList: true,
        ),
        'is_online': serializeParam(
          _isOnline,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FriendTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      FriendTypeStruct(
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        avatar: deserializeStructParam(
          data['avatar'],
          ParamType.DataStruct,
          false,
          structBuilder: FileTypeStruct.fromSerializableMap,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        userGender: deserializeParam(
          data['user_gender'],
          ParamType.String,
          false,
        ),
        about: deserializeParam(
          data['about'],
          ParamType.String,
          false,
        ),
        userImage: deserializeStructParam<FileTypeStruct>(
          data['user_image'],
          ParamType.DataStruct,
          true,
          structBuilder: FileTypeStruct.fromSerializableMap,
        ),
        friendCount: deserializeParam(
          data['friend_count'],
          ParamType.int,
          false,
        ),
        chatToken: deserializeParam(
          data['chat_token'],
          ParamType.String,
          false,
        ),
        isSelected: deserializeParam(
          data['is_selected'],
          ParamType.bool,
          false,
        ),
        dateBirth: deserializeParam(
          data['date_birth'],
          ParamType.DateTime,
          false,
        ),
        dogs: deserializeStructParam<DogTypeStruct>(
          data['dogs'],
          ParamType.DataStruct,
          true,
          structBuilder: DogTypeStruct.fromSerializableMap,
        ),
        isOnline: deserializeParam(
          data['is_online'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FriendTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FriendTypeStruct &&
        id == other.id &&
        fullName == other.fullName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        avatar == other.avatar &&
        username == other.username &&
        userGender == other.userGender &&
        about == other.about &&
        listEquality.equals(userImage, other.userImage) &&
        friendCount == other.friendCount &&
        chatToken == other.chatToken &&
        isSelected == other.isSelected &&
        dateBirth == other.dateBirth &&
        listEquality.equals(dogs, other.dogs) &&
        isOnline == other.isOnline;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        fullName,
        firstName,
        lastName,
        email,
        avatar,
        username,
        userGender,
        about,
        userImage,
        friendCount,
        chatToken,
        isSelected,
        dateBirth,
        dogs,
        isOnline
      ]);
}

FriendTypeStruct createFriendTypeStruct({
  int? id,
  String? fullName,
  String? firstName,
  String? lastName,
  String? email,
  FileTypeStruct? avatar,
  String? username,
  String? userGender,
  String? about,
  int? friendCount,
  String? chatToken,
  bool? isSelected,
  DateTime? dateBirth,
  bool? isOnline,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FriendTypeStruct(
      id: id,
      fullName: fullName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      avatar: avatar ?? (clearUnsetFields ? FileTypeStruct() : null),
      username: username,
      userGender: userGender,
      about: about,
      friendCount: friendCount,
      chatToken: chatToken,
      isSelected: isSelected,
      dateBirth: dateBirth,
      isOnline: isOnline,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FriendTypeStruct? updateFriendTypeStruct(
  FriendTypeStruct? friendType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    friendType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFriendTypeStructData(
  Map<String, dynamic> firestoreData,
  FriendTypeStruct? friendType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (friendType == null) {
    return;
  }
  if (friendType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && friendType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final friendTypeData = getFriendTypeFirestoreData(friendType, forFieldValue);
  final nestedData = friendTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = friendType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFriendTypeFirestoreData(
  FriendTypeStruct? friendType, [
  bool forFieldValue = false,
]) {
  if (friendType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(friendType.toMap());

  // Handle nested data for "avatar" field.
  addFileTypeStructData(
    firestoreData,
    friendType.hasAvatar() ? friendType.avatar : null,
    'avatar',
    forFieldValue,
  );

  // Add any Firestore field values
  friendType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFriendTypeListFirestoreData(
  List<FriendTypeStruct>? friendTypes,
) =>
    friendTypes?.map((e) => getFriendTypeFirestoreData(e, true)).toList() ?? [];
