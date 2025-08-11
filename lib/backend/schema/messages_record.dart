import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "senderId" field.
  int? _senderId;
  int get senderId => _senderId ?? 0;
  bool hasSenderId() => _senderId != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "messageImage" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  bool hasMessageImage() => _messageImage != null;

  // "receiverId" field.
  int? _receiverId;
  int get receiverId => _receiverId ?? 0;
  bool hasReceiverId() => _receiverId != null;

  // "isReaded" field.
  bool? _isReaded;
  bool get isReaded => _isReaded ?? false;
  bool hasIsReaded() => _isReaded != null;

  // "messageType" field.
  MessageTypes? _messageType;
  MessageTypes? get messageType => _messageType;
  bool hasMessageType() => _messageType != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _senderId = castToType<int>(snapshotData['senderId']);
    _token = snapshotData['token'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _messageImage = snapshotData['messageImage'] as String?;
    _receiverId = castToType<int>(snapshotData['receiverId']);
    _isReaded = snapshotData['isReaded'] as bool?;
    _messageType = snapshotData['messageType'] is MessageTypes
        ? snapshotData['messageType']
        : deserializeEnum<MessageTypes>(snapshotData['messageType']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? message,
  int? senderId,
  String? token,
  DateTime? timestamp,
  String? messageImage,
  int? receiverId,
  bool? isReaded,
  MessageTypes? messageType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'senderId': senderId,
      'token': token,
      'timestamp': timestamp,
      'messageImage': messageImage,
      'receiverId': receiverId,
      'isReaded': isReaded,
      'messageType': messageType,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.senderId == e2?.senderId &&
        e1?.token == e2?.token &&
        e1?.timestamp == e2?.timestamp &&
        e1?.messageImage == e2?.messageImage &&
        e1?.receiverId == e2?.receiverId &&
        e1?.isReaded == e2?.isReaded &&
        e1?.messageType == e2?.messageType;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.message,
        e?.senderId,
        e?.token,
        e?.timestamp,
        e?.messageImage,
        e?.receiverId,
        e?.isReaded,
        e?.messageType
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
