import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvinciaRecord extends FirestoreRecord {
  ProvinciaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idProvincia" field.
  int? _idProvincia;
  int get idProvincia => _idProvincia ?? 0;
  bool hasIdProvincia() => _idProvincia != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _idProvincia = castToType<int>(snapshotData['idProvincia']);
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('provincia');

  static Stream<ProvinciaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProvinciaRecord.fromSnapshot(s));

  static Future<ProvinciaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProvinciaRecord.fromSnapshot(s));

  static ProvinciaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProvinciaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProvinciaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProvinciaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProvinciaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProvinciaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProvinciaRecordData({
  int? idProvincia,
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idProvincia': idProvincia,
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProvinciaRecordDocumentEquality implements Equality<ProvinciaRecord> {
  const ProvinciaRecordDocumentEquality();

  @override
  bool equals(ProvinciaRecord? e1, ProvinciaRecord? e2) {
    return e1?.idProvincia == e2?.idProvincia && e1?.nombre == e2?.nombre;
  }

  @override
  int hash(ProvinciaRecord? e) =>
      const ListEquality().hash([e?.idProvincia, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is ProvinciaRecord;
}
