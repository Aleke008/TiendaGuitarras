import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RolRecord extends FirestoreRecord {
  RolRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  bool hasRol() => _rol != null;

  void _initializeFields() {
    _rol = snapshotData['rol'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rol');

  static Stream<RolRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RolRecord.fromSnapshot(s));

  static Future<RolRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RolRecord.fromSnapshot(s));

  static RolRecord fromSnapshot(DocumentSnapshot snapshot) => RolRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RolRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RolRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RolRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RolRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRolRecordData({
  String? rol,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rol': rol,
    }.withoutNulls,
  );

  return firestoreData;
}

class RolRecordDocumentEquality implements Equality<RolRecord> {
  const RolRecordDocumentEquality();

  @override
  bool equals(RolRecord? e1, RolRecord? e2) {
    return e1?.rol == e2?.rol;
  }

  @override
  int hash(RolRecord? e) => const ListEquality().hash([e?.rol]);

  @override
  bool isValidKey(Object? o) => o is RolRecord;
}
