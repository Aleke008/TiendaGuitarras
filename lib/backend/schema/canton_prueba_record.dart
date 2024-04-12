import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CantonPruebaRecord extends FirestoreRecord {
  CantonPruebaRecord._(
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

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  void _initializeFields() {
    _idCanton = snapshotData['idCanton'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _provincia = snapshotData['provincia'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cantonPrueba');

  static Stream<CantonPruebaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CantonPruebaRecord.fromSnapshot(s));

  static Future<CantonPruebaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CantonPruebaRecord.fromSnapshot(s));

  static CantonPruebaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CantonPruebaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CantonPruebaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CantonPruebaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CantonPruebaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CantonPruebaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCantonPruebaRecordData({
  String? idCanton,
  String? nombre,
  String? provincia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idCanton': idCanton,
      'nombre': nombre,
      'provincia': provincia,
    }.withoutNulls,
  );

  return firestoreData;
}

class CantonPruebaRecordDocumentEquality
    implements Equality<CantonPruebaRecord> {
  const CantonPruebaRecordDocumentEquality();

  @override
  bool equals(CantonPruebaRecord? e1, CantonPruebaRecord? e2) {
    return e1?.idCanton == e2?.idCanton &&
        e1?.nombre == e2?.nombre &&
        e1?.provincia == e2?.provincia;
  }

  @override
  int hash(CantonPruebaRecord? e) =>
      const ListEquality().hash([e?.idCanton, e?.nombre, e?.provincia]);

  @override
  bool isValidKey(Object? o) => o is CantonPruebaRecord;
}
