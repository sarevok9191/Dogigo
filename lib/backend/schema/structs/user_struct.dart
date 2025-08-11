// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? username,
    String? email,
    String? userGender,
    SelectableOptionTypeStruct? country,
    SelectableOptionTypeStruct? city,
    String? address,
    int? visibleMap,
    FileTypeStruct? avatar,
    int? friendCount,
    LatLng? location,
    MapShowSelectionStruct? shownMap,
    List<ProfilePhotoTypeStruct>? images,
    String? about,
    List<DogTypeStruct>? dogs,
    DogTypeStruct? activeDog,
    String? preferredLocale,
    bool? isOnline,
    DateTime? dateBirth,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _username = username,
        _email = email,
        _userGender = userGender,
        _country = country,
        _city = city,
        _address = address,
        _visibleMap = visibleMap,
        _avatar = avatar,
        _friendCount = friendCount,
        _location = location,
        _shownMap = shownMap,
        _images = images,
        _about = about,
        _dogs = dogs,
        _activeDog = activeDog,
        _preferredLocale = preferredLocale,
        _isOnline = isOnline,
        _dateBirth = dateBirth,
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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "user_gender" field.
  String? _userGender;
  String get userGender => _userGender ?? '';
  set userGender(String? val) => _userGender = val;

  bool hasUserGender() => _userGender != null;

  // "country" field.
  SelectableOptionTypeStruct? _country;
  SelectableOptionTypeStruct get country =>
      _country ?? SelectableOptionTypeStruct();
  set country(SelectableOptionTypeStruct? val) => _country = val;

  void updateCountry(Function(SelectableOptionTypeStruct) updateFn) {
    updateFn(_country ??= SelectableOptionTypeStruct());
  }

  bool hasCountry() => _country != null;

  // "city" field.
  SelectableOptionTypeStruct? _city;
  SelectableOptionTypeStruct get city => _city ?? SelectableOptionTypeStruct();
  set city(SelectableOptionTypeStruct? val) => _city = val;

  void updateCity(Function(SelectableOptionTypeStruct) updateFn) {
    updateFn(_city ??= SelectableOptionTypeStruct());
  }

  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "visible_map" field.
  int? _visibleMap;
  int get visibleMap => _visibleMap ?? 0;
  set visibleMap(int? val) => _visibleMap = val;

  void incrementVisibleMap(int amount) => visibleMap = visibleMap + amount;

  bool hasVisibleMap() => _visibleMap != null;

  // "avatar" field.
  FileTypeStruct? _avatar;
  FileTypeStruct get avatar => _avatar ?? FileTypeStruct();
  set avatar(FileTypeStruct? val) => _avatar = val;

  void updateAvatar(Function(FileTypeStruct) updateFn) {
    updateFn(_avatar ??= FileTypeStruct());
  }

  bool hasAvatar() => _avatar != null;

  // "friend_count" field.
  int? _friendCount;
  int get friendCount => _friendCount ?? 0;
  set friendCount(int? val) => _friendCount = val;

  void incrementFriendCount(int amount) => friendCount = friendCount + amount;

  bool hasFriendCount() => _friendCount != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  // "shown_map" field.
  MapShowSelectionStruct? _shownMap;
  MapShowSelectionStruct get shownMap => _shownMap ?? MapShowSelectionStruct();
  set shownMap(MapShowSelectionStruct? val) => _shownMap = val;

  void updateShownMap(Function(MapShowSelectionStruct) updateFn) {
    updateFn(_shownMap ??= MapShowSelectionStruct());
  }

  bool hasShownMap() => _shownMap != null;

  // "images" field.
  List<ProfilePhotoTypeStruct>? _images;
  List<ProfilePhotoTypeStruct> get images => _images ?? const [];
  set images(List<ProfilePhotoTypeStruct>? val) => _images = val;

  void updateImages(Function(List<ProfilePhotoTypeStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  set about(String? val) => _about = val;

  bool hasAbout() => _about != null;

  // "dogs" field.
  List<DogTypeStruct>? _dogs;
  List<DogTypeStruct> get dogs => _dogs ?? const [];
  set dogs(List<DogTypeStruct>? val) => _dogs = val;

  void updateDogs(Function(List<DogTypeStruct>) updateFn) {
    updateFn(_dogs ??= []);
  }

  bool hasDogs() => _dogs != null;

  // "active_dog" field.
  DogTypeStruct? _activeDog;
  DogTypeStruct get activeDog => _activeDog ?? DogTypeStruct();
  set activeDog(DogTypeStruct? val) => _activeDog = val;

  void updateActiveDog(Function(DogTypeStruct) updateFn) {
    updateFn(_activeDog ??= DogTypeStruct());
  }

  bool hasActiveDog() => _activeDog != null;

  // "preferred_locale" field.
  String? _preferredLocale;
  String get preferredLocale => _preferredLocale ?? '';
  set preferredLocale(String? val) => _preferredLocale = val;

  bool hasPreferredLocale() => _preferredLocale != null;

  // "is_online" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  set isOnline(bool? val) => _isOnline = val;

  bool hasIsOnline() => _isOnline != null;

  // "date_birth" field.
  DateTime? _dateBirth;
  DateTime? get dateBirth => _dateBirth;
  set dateBirth(DateTime? val) => _dateBirth = val;

  bool hasDateBirth() => _dateBirth != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: castToType<int>(data['id']),
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        userGender: data['user_gender'] as String?,
        country: data['country'] is SelectableOptionTypeStruct
            ? data['country']
            : SelectableOptionTypeStruct.maybeFromMap(data['country']),
        city: data['city'] is SelectableOptionTypeStruct
            ? data['city']
            : SelectableOptionTypeStruct.maybeFromMap(data['city']),
        address: data['address'] as String?,
        visibleMap: castToType<int>(data['visible_map']),
        avatar: data['avatar'] is FileTypeStruct
            ? data['avatar']
            : FileTypeStruct.maybeFromMap(data['avatar']),
        friendCount: castToType<int>(data['friend_count']),
        location: data['location'] as LatLng?,
        shownMap: data['shown_map'] is MapShowSelectionStruct
            ? data['shown_map']
            : MapShowSelectionStruct.maybeFromMap(data['shown_map']),
        images: getStructList(
          data['images'],
          ProfilePhotoTypeStruct.fromMap,
        ),
        about: data['about'] as String?,
        dogs: getStructList(
          data['dogs'],
          DogTypeStruct.fromMap,
        ),
        activeDog: data['active_dog'] is DogTypeStruct
            ? data['active_dog']
            : DogTypeStruct.maybeFromMap(data['active_dog']),
        preferredLocale: data['preferred_locale'] as String?,
        isOnline: data['is_online'] as bool?,
        dateBirth: data['date_birth'] as DateTime?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'username': _username,
        'email': _email,
        'user_gender': _userGender,
        'country': _country?.toMap(),
        'city': _city?.toMap(),
        'address': _address,
        'visible_map': _visibleMap,
        'avatar': _avatar?.toMap(),
        'friend_count': _friendCount,
        'location': _location,
        'shown_map': _shownMap?.toMap(),
        'images': _images?.map((e) => e.toMap()).toList(),
        'about': _about,
        'dogs': _dogs?.map((e) => e.toMap()).toList(),
        'active_dog': _activeDog?.toMap(),
        'preferred_locale': _preferredLocale,
        'is_online': _isOnline,
        'date_birth': _dateBirth,
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
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'user_gender': serializeParam(
          _userGender,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.DataStruct,
        ),
        'city': serializeParam(
          _city,
          ParamType.DataStruct,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'visible_map': serializeParam(
          _visibleMap,
          ParamType.int,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.DataStruct,
        ),
        'friend_count': serializeParam(
          _friendCount,
          ParamType.int,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'shown_map': serializeParam(
          _shownMap,
          ParamType.DataStruct,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'about': serializeParam(
          _about,
          ParamType.String,
        ),
        'dogs': serializeParam(
          _dogs,
          ParamType.DataStruct,
          isList: true,
        ),
        'active_dog': serializeParam(
          _activeDog,
          ParamType.DataStruct,
        ),
        'preferred_locale': serializeParam(
          _preferredLocale,
          ParamType.String,
        ),
        'is_online': serializeParam(
          _isOnline,
          ParamType.bool,
        ),
        'date_birth': serializeParam(
          _dateBirth,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
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
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        userGender: deserializeParam(
          data['user_gender'],
          ParamType.String,
          false,
        ),
        country: deserializeStructParam(
          data['country'],
          ParamType.DataStruct,
          false,
          structBuilder: SelectableOptionTypeStruct.fromSerializableMap,
        ),
        city: deserializeStructParam(
          data['city'],
          ParamType.DataStruct,
          false,
          structBuilder: SelectableOptionTypeStruct.fromSerializableMap,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        visibleMap: deserializeParam(
          data['visible_map'],
          ParamType.int,
          false,
        ),
        avatar: deserializeStructParam(
          data['avatar'],
          ParamType.DataStruct,
          false,
          structBuilder: FileTypeStruct.fromSerializableMap,
        ),
        friendCount: deserializeParam(
          data['friend_count'],
          ParamType.int,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        shownMap: deserializeStructParam(
          data['shown_map'],
          ParamType.DataStruct,
          false,
          structBuilder: MapShowSelectionStruct.fromSerializableMap,
        ),
        images: deserializeStructParam<ProfilePhotoTypeStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ProfilePhotoTypeStruct.fromSerializableMap,
        ),
        about: deserializeParam(
          data['about'],
          ParamType.String,
          false,
        ),
        dogs: deserializeStructParam<DogTypeStruct>(
          data['dogs'],
          ParamType.DataStruct,
          true,
          structBuilder: DogTypeStruct.fromSerializableMap,
        ),
        activeDog: deserializeStructParam(
          data['active_dog'],
          ParamType.DataStruct,
          false,
          structBuilder: DogTypeStruct.fromSerializableMap,
        ),
        preferredLocale: deserializeParam(
          data['preferred_locale'],
          ParamType.String,
          false,
        ),
        isOnline: deserializeParam(
          data['is_online'],
          ParamType.bool,
          false,
        ),
        dateBirth: deserializeParam(
          data['date_birth'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        username == other.username &&
        email == other.email &&
        userGender == other.userGender &&
        country == other.country &&
        city == other.city &&
        address == other.address &&
        visibleMap == other.visibleMap &&
        avatar == other.avatar &&
        friendCount == other.friendCount &&
        location == other.location &&
        shownMap == other.shownMap &&
        listEquality.equals(images, other.images) &&
        about == other.about &&
        listEquality.equals(dogs, other.dogs) &&
        activeDog == other.activeDog &&
        preferredLocale == other.preferredLocale &&
        isOnline == other.isOnline &&
        dateBirth == other.dateBirth;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        firstName,
        lastName,
        phoneNumber,
        username,
        email,
        userGender,
        country,
        city,
        address,
        visibleMap,
        avatar,
        friendCount,
        location,
        shownMap,
        images,
        about,
        dogs,
        activeDog,
        preferredLocale,
        isOnline,
        dateBirth
      ]);
}

UserStruct createUserStruct({
  int? id,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? username,
  String? email,
  String? userGender,
  SelectableOptionTypeStruct? country,
  SelectableOptionTypeStruct? city,
  String? address,
  int? visibleMap,
  FileTypeStruct? avatar,
  int? friendCount,
  LatLng? location,
  MapShowSelectionStruct? shownMap,
  String? about,
  DogTypeStruct? activeDog,
  String? preferredLocale,
  bool? isOnline,
  DateTime? dateBirth,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      username: username,
      email: email,
      userGender: userGender,
      country:
          country ?? (clearUnsetFields ? SelectableOptionTypeStruct() : null),
      city: city ?? (clearUnsetFields ? SelectableOptionTypeStruct() : null),
      address: address,
      visibleMap: visibleMap,
      avatar: avatar ?? (clearUnsetFields ? FileTypeStruct() : null),
      friendCount: friendCount,
      location: location,
      shownMap:
          shownMap ?? (clearUnsetFields ? MapShowSelectionStruct() : null),
      about: about,
      activeDog: activeDog ?? (clearUnsetFields ? DogTypeStruct() : null),
      preferredLocale: preferredLocale,
      isOnline: isOnline,
      dateBirth: dateBirth,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Handle nested data for "country" field.
  addSelectableOptionTypeStructData(
    firestoreData,
    user.hasCountry() ? user.country : null,
    'country',
    forFieldValue,
  );

  // Handle nested data for "city" field.
  addSelectableOptionTypeStructData(
    firestoreData,
    user.hasCity() ? user.city : null,
    'city',
    forFieldValue,
  );

  // Handle nested data for "avatar" field.
  addFileTypeStructData(
    firestoreData,
    user.hasAvatar() ? user.avatar : null,
    'avatar',
    forFieldValue,
  );

  // Handle nested data for "shown_map" field.
  addMapShowSelectionStructData(
    firestoreData,
    user.hasShownMap() ? user.shownMap : null,
    'shown_map',
    forFieldValue,
  );

  // Handle nested data for "active_dog" field.
  addDogTypeStructData(
    firestoreData,
    user.hasActiveDog() ? user.activeDog : null,
    'active_dog',
    forFieldValue,
  );

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
