// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DogTypeStruct extends FFFirebaseStruct {
  DogTypeStruct({
    int? id,
    String? description,
    String? title,
    SelectableOptionTypeStruct? dogType,
    int? gender,
    FileTypeStruct? avatar,
    List<ProfilePhotoTypeStruct>? images,
    bool? isActive,
    DateTime? birthDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _description = description,
        _title = title,
        _dogType = dogType,
        _gender = gender,
        _avatar = avatar,
        _images = images,
        _isActive = isActive,
        _birthDate = birthDate,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "dog_type" field.
  SelectableOptionTypeStruct? _dogType;
  SelectableOptionTypeStruct get dogType =>
      _dogType ?? SelectableOptionTypeStruct();
  set dogType(SelectableOptionTypeStruct? val) => _dogType = val;

  void updateDogType(Function(SelectableOptionTypeStruct) updateFn) {
    updateFn(_dogType ??= SelectableOptionTypeStruct());
  }

  bool hasDogType() => _dogType != null;

  // "gender" field.
  int? _gender;
  int get gender => _gender ?? 0;
  set gender(int? val) => _gender = val;

  void incrementGender(int amount) => gender = gender + amount;

  bool hasGender() => _gender != null;

  // "avatar" field.
  FileTypeStruct? _avatar;
  FileTypeStruct get avatar => _avatar ?? FileTypeStruct();
  set avatar(FileTypeStruct? val) => _avatar = val;

  void updateAvatar(Function(FileTypeStruct) updateFn) {
    updateFn(_avatar ??= FileTypeStruct());
  }

  bool hasAvatar() => _avatar != null;

  // "images" field.
  List<ProfilePhotoTypeStruct>? _images;
  List<ProfilePhotoTypeStruct> get images => _images ?? const [];
  set images(List<ProfilePhotoTypeStruct>? val) => _images = val;

  void updateImages(Function(List<ProfilePhotoTypeStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  set birthDate(DateTime? val) => _birthDate = val;

  bool hasBirthDate() => _birthDate != null;

  static DogTypeStruct fromMap(Map<String, dynamic> data) => DogTypeStruct(
        id: castToType<int>(data['id']),
        description: data['description'] as String?,
        title: data['title'] as String?,
        dogType: data['dog_type'] is SelectableOptionTypeStruct
            ? data['dog_type']
            : SelectableOptionTypeStruct.maybeFromMap(data['dog_type']),
        gender: castToType<int>(data['gender']),
        avatar: data['avatar'] is FileTypeStruct
            ? data['avatar']
            : FileTypeStruct.maybeFromMap(data['avatar']),
        images: getStructList(
          data['images'],
          ProfilePhotoTypeStruct.fromMap,
        ),
        isActive: data['is_active'] as bool?,
        birthDate: data['birth_date'] as DateTime?,
      );

  static DogTypeStruct? maybeFromMap(dynamic data) =>
      data is Map ? DogTypeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'description': _description,
        'title': _title,
        'dog_type': _dogType?.toMap(),
        'gender': _gender,
        'avatar': _avatar?.toMap(),
        'images': _images?.map((e) => e.toMap()).toList(),
        'is_active': _isActive,
        'birth_date': _birthDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'dog_type': serializeParam(
          _dogType,
          ParamType.DataStruct,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.int,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.DataStruct,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'is_active': serializeParam(
          _isActive,
          ParamType.bool,
        ),
        'birth_date': serializeParam(
          _birthDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DogTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DogTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        dogType: deserializeStructParam(
          data['dog_type'],
          ParamType.DataStruct,
          false,
          structBuilder: SelectableOptionTypeStruct.fromSerializableMap,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.int,
          false,
        ),
        avatar: deserializeStructParam(
          data['avatar'],
          ParamType.DataStruct,
          false,
          structBuilder: FileTypeStruct.fromSerializableMap,
        ),
        images: deserializeStructParam<ProfilePhotoTypeStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ProfilePhotoTypeStruct.fromSerializableMap,
        ),
        isActive: deserializeParam(
          data['is_active'],
          ParamType.bool,
          false,
        ),
        birthDate: deserializeParam(
          data['birth_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DogTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DogTypeStruct &&
        id == other.id &&
        description == other.description &&
        title == other.title &&
        dogType == other.dogType &&
        gender == other.gender &&
        avatar == other.avatar &&
        listEquality.equals(images, other.images) &&
        isActive == other.isActive &&
        birthDate == other.birthDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        description,
        title,
        dogType,
        gender,
        avatar,
        images,
        isActive,
        birthDate
      ]);
}

DogTypeStruct createDogTypeStruct({
  int? id,
  String? description,
  String? title,
  SelectableOptionTypeStruct? dogType,
  int? gender,
  FileTypeStruct? avatar,
  bool? isActive,
  DateTime? birthDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DogTypeStruct(
      id: id,
      description: description,
      title: title,
      dogType:
          dogType ?? (clearUnsetFields ? SelectableOptionTypeStruct() : null),
      gender: gender,
      avatar: avatar ?? (clearUnsetFields ? FileTypeStruct() : null),
      isActive: isActive,
      birthDate: birthDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DogTypeStruct? updateDogTypeStruct(
  DogTypeStruct? dogTypeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dogTypeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDogTypeStructData(
  Map<String, dynamic> firestoreData,
  DogTypeStruct? dogTypeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dogTypeStruct == null) {
    return;
  }
  if (dogTypeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dogTypeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dogTypeStructData =
      getDogTypeFirestoreData(dogTypeStruct, forFieldValue);
  final nestedData =
      dogTypeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dogTypeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDogTypeFirestoreData(
  DogTypeStruct? dogTypeStruct, [
  bool forFieldValue = false,
]) {
  if (dogTypeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dogTypeStruct.toMap());

  // Handle nested data for "dog_type" field.
  addSelectableOptionTypeStructData(
    firestoreData,
    dogTypeStruct.hasDogType() ? dogTypeStruct.dogType : null,
    'dog_type',
    forFieldValue,
  );

  // Handle nested data for "avatar" field.
  addFileTypeStructData(
    firestoreData,
    dogTypeStruct.hasAvatar() ? dogTypeStruct.avatar : null,
    'avatar',
    forFieldValue,
  );

  // Add any Firestore field values
  dogTypeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDogTypeListFirestoreData(
  List<DogTypeStruct>? dogTypeStructs,
) =>
    dogTypeStructs?.map((e) => getDogTypeFirestoreData(e, true)).toList() ?? [];
