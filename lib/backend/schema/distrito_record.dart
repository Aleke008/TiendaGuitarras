import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DistritoRecord extends FirestoreRecord {
  DistritoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idDistrito" field.
  String? _idDistrito;
  String get idDistrito => _idDistrito ?? '';
  bool hasIdDistrito() => _idDistrito != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "idCanton" field.
  String? _idCanton;
  String get idCanton => _idCanton ?? '';
  bool hasIdCanton() => _idCanton != null;

  void _initializeFields() {
    _idDistrito = snapshotData['idDistrito'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _idCanton = snapshotData['idCanton'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('distrito');

  static Stream<DistritoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DistritoRecord.fromSnapshot(s));

  static Future<DistritoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DistritoRecord.fromSnapshot(s));

  static DistritoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DistritoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DistritoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DistritoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DistritoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DistritoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDistritoRecordData({
  String? idDistrito,
  String? nombre,
  String? idCanton,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idDistrito': idDistrito,
      'nombre': nombre,
      'idCanton': idCanton,
    }.withoutNulls,
  );

  return firestoreData;
}

class DistritoRecordDocumentEquality implements Equality<DistritoRecord> {
  const DistritoRecordDocumentEquality();

  @override
  bool equals(DistritoRecord? e1, DistritoRecord? e2) {
    return e1?.idDistrito == e2?.idDistrito &&
        e1?.nombre == e2?.nombre &&
        e1?.idCanton == e2?.idCanton;
  }

  @override
  int hash(DistritoRecord? e) =>
      const ListEquality().hash([e?.idDistrito, e?.nombre, e?.idCanton]);

  @override
  bool isValidKey(Object? o) => o is DistritoRecord;
}
