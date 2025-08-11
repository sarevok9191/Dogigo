// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SelectableOptionTypeStruct extends FFFirebaseStruct {
  SelectableOptionTypeStruct({
    int? id,
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? ' ';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static SelectableOptionTypeStruct fromMap(Map<String, dynamic> data) =>
      SelectableOptionTypeStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
      );

  static SelectableOptionTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectableOptionTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static SelectableOptionTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SelectableOptionTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SelectableOptionTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectableOptionTypeStruct &&
        id == other.id &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title]);
}

SelectableOptionTypeStruct createSelectableOptionTypeStruct({
  int? id,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectableOptionTypeStruct(
      id: id,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectableOptionTypeStruct? updateSelectableOptionTypeStruct(
  SelectableOptionTypeStruct? selectableOptionType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectableOptionType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectableOptionTypeStructData(
  Map<String, dynamic> firestoreData,
  SelectableOptionTypeStruct? selectableOptionType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectableOptionType == null) {
    return;
  }
  if (selectableOptionType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selectableOptionType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectableOptionTypeData =
      getSelectableOptionTypeFirestoreData(selectableOptionType, forFieldValue);
  final nestedData =
      selectableOptionTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      selectableOptionType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectableOptionTypeFirestoreData(
  SelectableOptionTypeStruct? selectableOptionType, [
  bool forFieldValue = false,
]) {
  if (selectableOptionType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectableOptionType.toMap());

  // Add any Firestore field values
  selectableOptionType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectableOptionTypeListFirestoreData(
  List<SelectableOptionTypeStruct>? selectableOptionTypes,
) =>
    selectableOptionTypes
        ?.map((e) => getSelectableOptionTypeFirestoreData(e, true))
        .toList() ??
    [];
