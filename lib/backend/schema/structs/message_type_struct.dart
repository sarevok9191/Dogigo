// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MessageTypeStruct extends FFFirebaseStruct {
  MessageTypeStruct({
    String? message,
    String? messageImage,
    int? senderId,
    DateTime? timestamp,
    String? token,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _messageImage = messageImage,
        _senderId = senderId,
        _timestamp = timestamp,
        _token = token,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "messageImage" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  set messageImage(String? val) => _messageImage = val;

  bool hasMessageImage() => _messageImage != null;

  // "senderId" field.
  int? _senderId;
  int get senderId => _senderId ?? 0;
  set senderId(int? val) => _senderId = val;

  void incrementSenderId(int amount) => senderId = senderId + amount;

  bool hasSenderId() => _senderId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  static MessageTypeStruct fromMap(Map<String, dynamic> data) =>
      MessageTypeStruct(
        message: data['message'] as String?,
        messageImage: data['messageImage'] as String?,
        senderId: castToType<int>(data['senderId']),
        timestamp: data['timestamp'] as DateTime?,
        token: data['token'] as String?,
      );

  static MessageTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? MessageTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'messageImage': _messageImage,
        'senderId': _senderId,
        'timestamp': _timestamp,
        'token': _token,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'messageImage': serializeParam(
          _messageImage,
          ParamType.String,
        ),
        'senderId': serializeParam(
          _senderId,
          ParamType.int,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessageTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageTypeStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        messageImage: deserializeParam(
          data['messageImage'],
          ParamType.String,
          false,
        ),
        senderId: deserializeParam(
          data['senderId'],
          ParamType.int,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessageTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageTypeStruct &&
        message == other.message &&
        messageImage == other.messageImage &&
        senderId == other.senderId &&
        timestamp == other.timestamp &&
        token == other.token;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([message, messageImage, senderId, timestamp, token]);
}

MessageTypeStruct createMessageTypeStruct({
  String? message,
  String? messageImage,
  int? senderId,
  DateTime? timestamp,
  String? token,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageTypeStruct(
      message: message,
      messageImage: messageImage,
      senderId: senderId,
      timestamp: timestamp,
      token: token,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageTypeStruct? updateMessageTypeStruct(
  MessageTypeStruct? messageType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messageType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageTypeStructData(
  Map<String, dynamic> firestoreData,
  MessageTypeStruct? messageType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messageType == null) {
    return;
  }
  if (messageType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messageType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageTypeData =
      getMessageTypeFirestoreData(messageType, forFieldValue);
  final nestedData =
      messageTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messageType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageTypeFirestoreData(
  MessageTypeStruct? messageType, [
  bool forFieldValue = false,
]) {
  if (messageType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messageType.toMap());

  // Add any Firestore field values
  messageType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageTypeListFirestoreData(
  List<MessageTypeStruct>? messageTypes,
) =>
    messageTypes?.map((e) => getMessageTypeFirestoreData(e, true)).toList() ??
    [];
