import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CantonRecord extends FirestoreRecord {
  CantonRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idCanton" field.
  String? _idCanton;
  String get idCanton => _idCanton ?? '';
  bool hasIdCanton() => _idCanton != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "idProvincia" field.
  String? _idProvincia;
  String get idProvincia => _idProvincia ?? '';
  bool hasIdProvincia() => _idProvincia != null;

  void _initializeFields() {
    _idCanton = snapshotData['idCanton'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _idProvincia = snapshotData['idProvincia'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('canton');

  static Stream<CantonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CantonRecord.fromSnapshot(s));

  static Future<CantonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CantonRecord.fromSnapshot(s));

  static CantonRecord fromSnapshot(DocumentSnapshot snapshot) => CantonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CantonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CantonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CantonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CantonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCantonRecordData({
  String? idCanton,
  String? nombre,
  String? idProvincia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idCanton': idCanton,
      'nombre': nombre,
      'idProvincia': idProvincia,
    }.withoutNulls,
  );

  return firestoreData;
}

class CantonRecordDocumentEquality implements Equality<CantonRecord> {
  const CantonRecordDocumentEquality();

  @override
  bool equals(CantonRecord? e1, CantonRecord? e2) {
    return e1?.idCanton == e2?.idCanton &&
        e1?.nombre == e2?.nombre &&
        e1?.idProvincia == e2?.idProvincia;
  }

  @override
  int hash(CantonRecord? e) =>
      const ListEquality().hash([e?.idCanton, e?.nombre, e?.idProvincia]);

  @override
  bool isValidKey(Object? o) => o is CantonRecord;
}
