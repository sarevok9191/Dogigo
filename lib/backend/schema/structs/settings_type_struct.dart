// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsTypeStruct extends FFFirebaseStruct {
  SettingsTypeStruct({
    bool? ageFriends,
    bool? locationFriends,
    bool? distanceFriends,
    bool? sexFriends,
    bool? ageArent,
    bool? locationArent,
    bool? distanceArent,
    bool? sexArent,
    bool? beingLiked,
    bool? friendRequest,
    bool? beingTouched,
    bool? forMessages,
    bool? patidoNews,
    String? visibleMap,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ageFriends = ageFriends,
        _locationFriends = locationFriends,
        _distanceFriends = distanceFriends,
        _sexFriends = sexFriends,
        _ageArent = ageArent,
        _locationArent = locationArent,
        _distanceArent = distanceArent,
        _sexArent = sexArent,
        _beingLiked = beingLiked,
        _friendRequest = friendRequest,
        _beingTouched = beingTouched,
        _forMessages = forMessages,
        _patidoNews = patidoNews,
        _visibleMap = visibleMap,
        super(firestoreUtilData);

  // "age_friends" field.
  bool? _ageFriends;
  bool get ageFriends => _ageFriends ?? false;
  set ageFriends(bool? val) => _ageFriends = val;

  bool hasAgeFriends() => _ageFriends != null;

  // "location_friends" field.
  bool? _locationFriends;
  bool get locationFriends => _locationFriends ?? false;
  set locationFriends(bool? val) => _locationFriends = val;

  bool hasLocationFriends() => _locationFriends != null;

  // "distance_friends" field.
  bool? _distanceFriends;
  bool get distanceFriends => _distanceFriends ?? false;
  set distanceFriends(bool? val) => _distanceFriends = val;

  bool hasDistanceFriends() => _distanceFriends != null;

  // "sex_friends" field.
  bool? _sexFriends;
  bool get sexFriends => _sexFriends ?? false;
  set sexFriends(bool? val) => _sexFriends = val;

  bool hasSexFriends() => _sexFriends != null;

  // "age_arent" field.
  bool? _ageArent;
  bool get ageArent => _ageArent ?? false;
  set ageArent(bool? val) => _ageArent = val;

  bool hasAgeArent() => _ageArent != null;

  // "location_arent" field.
  bool? _locationArent;
  bool get locationArent => _locationArent ?? false;
  set locationArent(bool? val) => _locationArent = val;

  bool hasLocationArent() => _locationArent != null;

  // "distance_arent" field.
  bool? _distanceArent;
  bool get distanceArent => _distanceArent ?? false;
  set distanceArent(bool? val) => _distanceArent = val;

  bool hasDistanceArent() => _distanceArent != null;

  // "sex_arent" field.
  bool? _sexArent;
  bool get sexArent => _sexArent ?? false;
  set sexArent(bool? val) => _sexArent = val;

  bool hasSexArent() => _sexArent != null;

  // "being_liked" field.
  bool? _beingLiked;
  bool get beingLiked => _beingLiked ?? false;
  set beingLiked(bool? val) => _beingLiked = val;

  bool hasBeingLiked() => _beingLiked != null;

  // "friend_request" field.
  bool? _friendRequest;
  bool get friendRequest => _friendRequest ?? false;
  set friendRequest(bool? val) => _friendRequest = val;

  bool hasFriendRequest() => _friendRequest != null;

  // "being_touched" field.
  bool? _beingTouched;
  bool get beingTouched => _beingTouched ?? false;
  set beingTouched(bool? val) => _beingTouched = val;

  bool hasBeingTouched() => _beingTouched != null;

  // "for_messages" field.
  bool? _forMessages;
  bool get forMessages => _forMessages ?? false;
  set forMessages(bool? val) => _forMessages = val;

  bool hasForMessages() => _forMessages != null;

  // "patido_news" field.
  bool? _patidoNews;
  bool get patidoNews => _patidoNews ?? false;
  set patidoNews(bool? val) => _patidoNews = val;

  bool hasPatidoNews() => _patidoNews != null;

  // "visible_map" field.
  String? _visibleMap;
  String get visibleMap => _visibleMap ?? '';
  set visibleMap(String? val) => _visibleMap = val;

  bool hasVisibleMap() => _visibleMap != null;

  static SettingsTypeStruct fromMap(Map<String, dynamic> data) =>
      SettingsTypeStruct(
        ageFriends: data['age_friends'] as bool?,
        locationFriends: data['location_friends'] as bool?,
        distanceFriends: data['distance_friends'] as bool?,
        sexFriends: data['sex_friends'] as bool?,
        ageArent: data['age_arent'] as bool?,
        locationArent: data['location_arent'] as bool?,
        distanceArent: data['distance_arent'] as bool?,
        sexArent: data['sex_arent'] as bool?,
        beingLiked: data['being_liked'] as bool?,
        friendRequest: data['friend_request'] as bool?,
        beingTouched: data['being_touched'] as bool?,
        forMessages: data['for_messages'] as bool?,
        patidoNews: data['patido_news'] as bool?,
        visibleMap: data['visible_map'] as String?,
      );

  static SettingsTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'age_friends': _ageFriends,
        'location_friends': _locationFriends,
        'distance_friends': _distanceFriends,
        'sex_friends': _sexFriends,
        'age_arent': _ageArent,
        'location_arent': _locationArent,
        'distance_arent': _distanceArent,
        'sex_arent': _sexArent,
        'being_liked': _beingLiked,
        'friend_request': _friendRequest,
        'being_touched': _beingTouched,
        'for_messages': _forMessages,
        'patido_news': _patidoNews,
        'visible_map': _visibleMap,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age_friends': serializeParam(
          _ageFriends,
          ParamType.bool,
        ),
        'location_friends': serializeParam(
          _locationFriends,
          ParamType.bool,
        ),
        'distance_friends': serializeParam(
          _distanceFriends,
          ParamType.bool,
        ),
        'sex_friends': serializeParam(
          _sexFriends,
          ParamType.bool,
        ),
        'age_arent': serializeParam(
          _ageArent,
          ParamType.bool,
        ),
        'location_arent': serializeParam(
          _locationArent,
          ParamType.bool,
        ),
        'distance_arent': serializeParam(
          _distanceArent,
          ParamType.bool,
        ),
        'sex_arent': serializeParam(
          _sexArent,
          ParamType.bool,
        ),
        'being_liked': serializeParam(
          _beingLiked,
          ParamType.bool,
        ),
        'friend_request': serializeParam(
          _friendRequest,
          ParamType.bool,
        ),
        'being_touched': serializeParam(
          _beingTouched,
          ParamType.bool,
        ),
        'for_messages': serializeParam(
          _forMessages,
          ParamType.bool,
        ),
        'patido_news': serializeParam(
          _patidoNews,
          ParamType.bool,
        ),
        'visible_map': serializeParam(
          _visibleMap,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettingsTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsTypeStruct(
        ageFriends: deserializeParam(
          data['age_friends'],
          ParamType.bool,
          false,
        ),
        locationFriends: deserializeParam(
          data['location_friends'],
          ParamType.bool,
          false,
        ),
        distanceFriends: deserializeParam(
          data['distance_friends'],
          ParamType.bool,
          false,
        ),
        sexFriends: deserializeParam(
          data['sex_friends'],
          ParamType.bool,
          false,
        ),
        ageArent: deserializeParam(
          data['age_arent'],
          ParamType.bool,
          false,
        ),
        locationArent: deserializeParam(
          data['location_arent'],
          ParamType.bool,
          false,
        ),
        distanceArent: deserializeParam(
          data['distance_arent'],
          ParamType.bool,
          false,
        ),
        sexArent: deserializeParam(
          data['sex_arent'],
          ParamType.bool,
          false,
        ),
        beingLiked: deserializeParam(
          data['being_liked'],
          ParamType.bool,
          false,
        ),
        friendRequest: deserializeParam(
          data['friend_request'],
          ParamType.bool,
          false,
        ),
        beingTouched: deserializeParam(
          data['being_touched'],
          ParamType.bool,
          false,
        ),
        forMessages: deserializeParam(
          data['for_messages'],
          ParamType.bool,
          false,
        ),
        patidoNews: deserializeParam(
          data['patido_news'],
          ParamType.bool,
          false,
        ),
        visibleMap: deserializeParam(
          data['visible_map'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SettingsTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsTypeStruct &&
        ageFriends == other.ageFriends &&
        locationFriends == other.locationFriends &&
        distanceFriends == other.distanceFriends &&
        sexFriends == other.sexFriends &&
        ageArent == other.ageArent &&
        locationArent == other.locationArent &&
        distanceArent == other.distanceArent &&
        sexArent == other.sexArent &&
        beingLiked == other.beingLiked &&
        friendRequest == other.friendRequest &&
        beingTouched == other.beingTouched &&
        forMessages == other.forMessages &&
        patidoNews == other.patidoNews &&
        visibleMap == other.visibleMap;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ageFriends,
        locationFriends,
        distanceFriends,
        sexFriends,
        ageArent,
        locationArent,
        distanceArent,
        sexArent,
        beingLiked,
        friendRequest,
        beingTouched,
        forMessages,
        patidoNews,
        visibleMap
      ]);
}

SettingsTypeStruct createSettingsTypeStruct({
  bool? ageFriends,
  bool? locationFriends,
  bool? distanceFriends,
  bool? sexFriends,
  bool? ageArent,
  bool? locationArent,
  bool? distanceArent,
  bool? sexArent,
  bool? beingLiked,
  bool? friendRequest,
  bool? beingTouched,
  bool? forMessages,
  bool? patidoNews,
  String? visibleMap,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsTypeStruct(
      ageFriends: ageFriends,
      locationFriends: locationFriends,
      distanceFriends: distanceFriends,
      sexFriends: sexFriends,
      ageArent: ageArent,
      locationArent: locationArent,
      distanceArent: distanceArent,
      sexArent: sexArent,
      beingLiked: beingLiked,
      friendRequest: friendRequest,
      beingTouched: beingTouched,
      forMessages: forMessages,
      patidoNews: patidoNews,
      visibleMap: visibleMap,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsTypeStruct? updateSettingsTypeStruct(
  SettingsTypeStruct? settingsType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsTypeStructData(
  Map<String, dynamic> firestoreData,
  SettingsTypeStruct? settingsType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsType == null) {
    return;
  }
  if (settingsType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsTypeData =
      getSettingsTypeFirestoreData(settingsType, forFieldValue);
  final nestedData =
      settingsTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settingsType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsTypeFirestoreData(
  SettingsTypeStruct? settingsType, [
  bool forFieldValue = false,
]) {
  if (settingsType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsType.toMap());

  // Add any Firestore field values
  settingsType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsTypeListFirestoreData(
  List<SettingsTypeStruct>? settingsTypes,
) =>
    settingsTypes?.map((e) => getSettingsTypeFirestoreData(e, true)).toList() ??
    [];
