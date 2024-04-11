import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MensajesRecord extends FirestoreRecord {
  MensajesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "senderId" field.
  String? _senderId;
  String get senderId => _senderId ?? '';
  bool hasSenderId() => _senderId != null;

  // "senderEmail" field.
  String? _senderEmail;
  String get senderEmail => _senderEmail ?? '';
  bool hasSenderEmail() => _senderEmail != null;

  // "receiverId" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  // "chatRoomId" field.
  String? _chatRoomId;
  String get chatRoomId => _chatRoomId ?? '';
  bool hasChatRoomId() => _chatRoomId != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _mensaje = snapshotData['mensaje'] as String?;
    _estado = snapshotData['estado'] as bool?;
    _senderId = snapshotData['senderId'] as String?;
    _senderEmail = snapshotData['senderEmail'] as String?;
    _receiverId = snapshotData['receiverId'] as String?;
    _chatRoomId = snapshotData['chatRoomId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mensajes');

  static Stream<MensajesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MensajesRecord.fromSnapshot(s));

  static Future<MensajesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MensajesRecord.fromSnapshot(s));

  static MensajesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MensajesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MensajesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MensajesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MensajesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MensajesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMensajesRecordData({
  DateTime? createdTime,
  String? mensaje,
  bool? estado,
  String? senderId,
  String? senderEmail,
  String? receiverId,
  String? chatRoomId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'mensaje': mensaje,
      'estado': estado,
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'chatRoomId': chatRoomId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensajesRecordDocumentEquality implements Equality<MensajesRecord> {
  const MensajesRecordDocumentEquality();

  @override
  bool equals(MensajesRecord? e1, MensajesRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.mensaje == e2?.mensaje &&
        e1?.estado == e2?.estado &&
        e1?.senderId == e2?.senderId &&
        e1?.senderEmail == e2?.senderEmail &&
        e1?.receiverId == e2?.receiverId &&
        e1?.chatRoomId == e2?.chatRoomId;
  }

  @override
  int hash(MensajesRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.mensaje,
        e?.estado,
        e?.senderId,
        e?.senderEmail,
        e?.receiverId,
        e?.chatRoomId
      ]);

  @override
  bool isValidKey(Object? o) => o is MensajesRecord;
}
