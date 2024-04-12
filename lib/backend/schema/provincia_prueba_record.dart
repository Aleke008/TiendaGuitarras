import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProvinciaPruebaRecord extends FirestoreRecord {
  ProvinciaPruebaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idProvincia" field.
  String? _idProvincia;
  String get idProvincia => _idProvincia ?? '';
  bool hasIdProvincia() => _idProvincia != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _idProvincia = snapshotData['idProvincia'] as String?;
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('provinciaPrueba');

  static Stream<ProvinciaPruebaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProvinciaPruebaRecord.fromSnapshot(s));

  static Future<ProvinciaPruebaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProvinciaPruebaRecord.fromSnapshot(s));

  static ProvinciaPruebaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProvinciaPruebaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProvinciaPruebaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProvinciaPruebaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProvinciaPruebaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProvinciaPruebaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProvinciaPruebaRecordData({
  String? idProvincia,
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

class ProvinciaPruebaRecordDocumentEquality
    implements Equality<ProvinciaPruebaRecord> {
  const ProvinciaPruebaRecordDocumentEquality();

  @override
  bool equals(ProvinciaPruebaRecord? e1, ProvinciaPruebaRecord? e2) {
    return e1?.idProvincia == e2?.idProvincia && e1?.nombre == e2?.nombre;
  }

  @override
  int hash(ProvinciaPruebaRecord? e) =>
      const ListEquality().hash([e?.idProvincia, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is ProvinciaPruebaRecord;
}
