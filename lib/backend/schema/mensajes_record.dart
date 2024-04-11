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

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _mensaje = snapshotData['mensaje'] as String?;
    _estado = snapshotData['estado'] as bool?;
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
  String? uid,
  String? photoUrl,
  String? mensaje,
  bool? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'uid': uid,
      'photo_url': photoUrl,
      'mensaje': mensaje,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensajesRecordDocumentEquality implements Equality<MensajesRecord> {
  const MensajesRecordDocumentEquality();

  @override
  bool equals(MensajesRecord? e1, MensajesRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.uid == e2?.uid &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.mensaje == e2?.mensaje &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(MensajesRecord? e) => const ListEquality()
      .hash([e?.createdTime, e?.uid, e?.photoUrl, e?.mensaje, e?.estado]);

  @override
  bool isValidKey(Object? o) => o is MensajesRecord;
}
