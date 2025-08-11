// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarkerStruct extends FFFirebaseStruct {
  MarkerStruct({
    LatLng? position,
    MarkerColor? color,
    String? id,
    MarkerImageStruct? image,
    UserStruct? user,
    DogTypeStruct? dog,
    String? mapShowType,
    String? chatToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _position = position,
        _color = color,
        _id = id,
        _image = image,
        _user = user,
        _dog = dog,
        _mapShowType = mapShowType,
        _chatToken = chatToken,
        super(firestoreUtilData);

  // "position" field.
  LatLng? _position;
  LatLng? get position => _position;
  set position(LatLng? val) => _position = val;

  bool hasPosition() => _position != null;

  // "color" field.
  MarkerColor? _color;
  MarkerColor get color => _color ?? MarkerColor.red;
  set color(MarkerColor? val) => _color = val;

  bool hasColor() => _color != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "image" field.
  MarkerImageStruct? _image;
  MarkerImageStruct get image => _image ?? MarkerImageStruct();
  set image(MarkerImageStruct? val) => _image = val;

  void updateImage(Function(MarkerImageStruct) updateFn) {
    updateFn(_image ??= MarkerImageStruct());
  }

  bool hasImage() => _image != null;

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

  // "map_show_type" field.
  String? _mapShowType;
  String get mapShowType => _mapShowType ?? '';
  set mapShowType(String? val) => _mapShowType = val;

  bool hasMapShowType() => _mapShowType != null;

  // "chat_token" field.
  String? _chatToken;
  String get chatToken => _chatToken ?? '';
  set chatToken(String? val) => _chatToken = val;

  bool hasChatToken() => _chatToken != null;

  static MarkerStruct fromMap(Map<String, dynamic> data) => MarkerStruct(
        position: data['position'] as LatLng?,
        color: data['color'] is MarkerColor
            ? data['color']
            : deserializeEnum<MarkerColor>(data['color']),
        id: data['id'] as String?,
        image: data['image'] is MarkerImageStruct
            ? data['image']
            : MarkerImageStruct.maybeFromMap(data['image']),
        user: data['user'] is UserStruct
            ? data['user']
            : UserStruct.maybeFromMap(data['user']),
        dog: data['dog'] is DogTypeStruct
            ? data['dog']
            : DogTypeStruct.maybeFromMap(data['dog']),
        mapShowType: data['map_show_type'] as String?,
        chatToken: data['chat_token'] as String?,
      );

  static MarkerStruct? maybeFromMap(dynamic data) =>
      data is Map ? MarkerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'position': _position,
        'color': _color?.serialize(),
        'id': _id,
        'image': _image?.toMap(),
        'user': _user?.toMap(),
        'dog': _dog?.toMap(),
        'map_show_type': _mapShowType,
        'chat_token': _chatToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'position': serializeParam(
          _position,
          ParamType.LatLng,
        ),
        'color': serializeParam(
          _color,
          ParamType.Enum,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.DataStruct,
        ),
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
        'dog': serializeParam(
          _dog,
          ParamType.DataStruct,
        ),
        'map_show_type': serializeParam(
          _mapShowType,
          ParamType.String,
        ),
        'chat_token': serializeParam(
          _chatToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarkerStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarkerStruct(
        position: deserializeParam(
          data['position'],
          ParamType.LatLng,
          false,
        ),
        color: deserializeParam<MarkerColor>(
          data['color'],
          ParamType.Enum,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        image: deserializeStructParam(
          data['image'],
          ParamType.DataStruct,
          false,
          structBuilder: MarkerImageStruct.fromSerializableMap,
        ),
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
        mapShowType: deserializeParam(
          data['map_show_type'],
          ParamType.String,
          false,
        ),
        chatToken: deserializeParam(
          data['chat_token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarkerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarkerStruct &&
        position == other.position &&
        color == other.color &&
        id == other.id &&
        image == other.image &&
        user == other.user &&
        dog == other.dog &&
        mapShowType == other.mapShowType &&
        chatToken == other.chatToken;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([position, color, id, image, user, dog, mapShowType, chatToken]);
}

MarkerStruct createMarkerStruct({
  LatLng? position,
  MarkerColor? color,
  String? id,
  MarkerImageStruct? image,
  UserStruct? user,
  DogTypeStruct? dog,
  String? mapShowType,
  String? chatToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarkerStruct(
      position: position,
      color: color,
      id: id,
      image: image ?? (clearUnsetFields ? MarkerImageStruct() : null),
      user: user ?? (clearUnsetFields ? UserStruct() : null),
      dog: dog ?? (clearUnsetFields ? DogTypeStruct() : null),
      mapShowType: mapShowType,
      chatToken: chatToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarkerStruct? updateMarkerStruct(
  MarkerStruct? marker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    marker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarkerStructData(
  Map<String, dynamic> firestoreData,
  MarkerStruct? marker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (marker == null) {
    return;
  }
  if (marker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && marker.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final markerData = getMarkerFirestoreData(marker, forFieldValue);
  final nestedData = markerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = marker.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarkerFirestoreData(
  MarkerStruct? marker, [
  bool forFieldValue = false,
]) {
  if (marker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(marker.toMap());

  // Handle nested data for "image" field.
  addMarkerImageStructData(
    firestoreData,
    marker.hasImage() ? marker.image : null,
    'image',
    forFieldValue,
  );

  // Handle nested data for "user" field.
  addUserStructData(
    firestoreData,
    marker.hasUser() ? marker.user : null,
    'user',
    forFieldValue,
  );

  // Handle nested data for "dog" field.
  addDogTypeStructData(
    firestoreData,
    marker.hasDog() ? marker.dog : null,
    'dog',
    forFieldValue,
  );

  // Add any Firestore field values
  marker.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarkerListFirestoreData(
  List<MarkerStruct>? markers,
) =>
    markers?.map((e) => getMarkerFirestoreData(e, true)).toList() ?? [];
