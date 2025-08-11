// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InAppPurchaseConfigurationStruct extends FFFirebaseStruct {
  InAppPurchaseConfigurationStruct({
    int? swipeRights,
    String? packageIdenfitier,
    String? iosPublicKey,
    String? androidPublicKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _swipeRights = swipeRights,
        _packageIdenfitier = packageIdenfitier,
        _iosPublicKey = iosPublicKey,
        _androidPublicKey = androidPublicKey,
        super(firestoreUtilData);

  // "swipe_rights" field.
  int? _swipeRights;
  int get swipeRights => _swipeRights ?? 0;
  set swipeRights(int? val) => _swipeRights = val;

  void incrementSwipeRights(int amount) => swipeRights = swipeRights + amount;

  bool hasSwipeRights() => _swipeRights != null;

  // "package_idenfitier" field.
  String? _packageIdenfitier;
  String get packageIdenfitier => _packageIdenfitier ?? '';
  set packageIdenfitier(String? val) => _packageIdenfitier = val;

  bool hasPackageIdenfitier() => _packageIdenfitier != null;

  // "ios_public_key" field.
  String? _iosPublicKey;
  String get iosPublicKey => _iosPublicKey ?? '';
  set iosPublicKey(String? val) => _iosPublicKey = val;

  bool hasIosPublicKey() => _iosPublicKey != null;

  // "android_public_key" field.
  String? _androidPublicKey;
  String get androidPublicKey => _androidPublicKey ?? '';
  set androidPublicKey(String? val) => _androidPublicKey = val;

  bool hasAndroidPublicKey() => _androidPublicKey != null;

  static InAppPurchaseConfigurationStruct fromMap(Map<String, dynamic> data) =>
      InAppPurchaseConfigurationStruct(
        swipeRights: castToType<int>(data['swipe_rights']),
        packageIdenfitier: data['package_idenfitier'] as String?,
        iosPublicKey: data['ios_public_key'] as String?,
        androidPublicKey: data['android_public_key'] as String?,
      );

  static InAppPurchaseConfigurationStruct? maybeFromMap(dynamic data) => data
          is Map
      ? InAppPurchaseConfigurationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'swipe_rights': _swipeRights,
        'package_idenfitier': _packageIdenfitier,
        'ios_public_key': _iosPublicKey,
        'android_public_key': _androidPublicKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'swipe_rights': serializeParam(
          _swipeRights,
          ParamType.int,
        ),
        'package_idenfitier': serializeParam(
          _packageIdenfitier,
          ParamType.String,
        ),
        'ios_public_key': serializeParam(
          _iosPublicKey,
          ParamType.String,
        ),
        'android_public_key': serializeParam(
          _androidPublicKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static InAppPurchaseConfigurationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InAppPurchaseConfigurationStruct(
        swipeRights: deserializeParam(
          data['swipe_rights'],
          ParamType.int,
          false,
        ),
        packageIdenfitier: deserializeParam(
          data['package_idenfitier'],
          ParamType.String,
          false,
        ),
        iosPublicKey: deserializeParam(
          data['ios_public_key'],
          ParamType.String,
          false,
        ),
        androidPublicKey: deserializeParam(
          data['android_public_key'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InAppPurchaseConfigurationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InAppPurchaseConfigurationStruct &&
        swipeRights == other.swipeRights &&
        packageIdenfitier == other.packageIdenfitier &&
        iosPublicKey == other.iosPublicKey &&
        androidPublicKey == other.androidPublicKey;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([swipeRights, packageIdenfitier, iosPublicKey, androidPublicKey]);
}

InAppPurchaseConfigurationStruct createInAppPurchaseConfigurationStruct({
  int? swipeRights,
  String? packageIdenfitier,
  String? iosPublicKey,
  String? androidPublicKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InAppPurchaseConfigurationStruct(
      swipeRights: swipeRights,
      packageIdenfitier: packageIdenfitier,
      iosPublicKey: iosPublicKey,
      androidPublicKey: androidPublicKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InAppPurchaseConfigurationStruct? updateInAppPurchaseConfigurationStruct(
  InAppPurchaseConfigurationStruct? inAppPurchaseConfiguration, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    inAppPurchaseConfiguration
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInAppPurchaseConfigurationStructData(
  Map<String, dynamic> firestoreData,
  InAppPurchaseConfigurationStruct? inAppPurchaseConfiguration,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (inAppPurchaseConfiguration == null) {
    return;
  }
  if (inAppPurchaseConfiguration.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      inAppPurchaseConfiguration.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final inAppPurchaseConfigurationData =
      getInAppPurchaseConfigurationFirestoreData(
          inAppPurchaseConfiguration, forFieldValue);
  final nestedData = inAppPurchaseConfigurationData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      inAppPurchaseConfiguration.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInAppPurchaseConfigurationFirestoreData(
  InAppPurchaseConfigurationStruct? inAppPurchaseConfiguration, [
  bool forFieldValue = false,
]) {
  if (inAppPurchaseConfiguration == null) {
    return {};
  }
  final firestoreData = mapToFirestore(inAppPurchaseConfiguration.toMap());

  // Add any Firestore field values
  inAppPurchaseConfiguration.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInAppPurchaseConfigurationListFirestoreData(
  List<InAppPurchaseConfigurationStruct>? inAppPurchaseConfigurations,
) =>
    inAppPurchaseConfigurations
        ?.map((e) => getInAppPurchaseConfigurationFirestoreData(e, true))
        .toList() ??
    [];
