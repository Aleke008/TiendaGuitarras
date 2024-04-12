import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DistritoPruebaRecord extends FirestoreRecord {
  DistritoPruebaRecord._(
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

  // "canton" field.
  String? _canton;
  String get canton => _canton ?? '';
  bool hasCanton() => _canton != null;

  void _initializeFields() {
    _idDistrito = snapshotData['idDistrito'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _canton = snapshotData['canton'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('distritoPrueba');

  static Stream<DistritoPruebaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DistritoPruebaRecord.fromSnapshot(s));

  static Future<DistritoPruebaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DistritoPruebaRecord.fromSnapshot(s));

  static DistritoPruebaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DistritoPruebaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DistritoPruebaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DistritoPruebaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DistritoPruebaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DistritoPruebaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDistritoPruebaRecordData({
  String? idDistrito,
  String? nombre,
  String? canton,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idDistrito': idDistrito,
      'nombre': nombre,
      'canton': canton,
    }.withoutNulls,
  );

  return firestoreData;
}

class DistritoPruebaRecordDocumentEquality
    implements Equality<DistritoPruebaRecord> {
  const DistritoPruebaRecordDocumentEquality();

  @override
  bool equals(DistritoPruebaRecord? e1, DistritoPruebaRecord? e2) {
    return e1?.idDistrito == e2?.idDistrito &&
        e1?.nombre == e2?.nombre &&
        e1?.canton == e2?.canton;
  }

  @override
  int hash(DistritoPruebaRecord? e) =>
      const ListEquality().hash([e?.idDistrito, e?.nombre, e?.canton]);

  @override
  bool isValidKey(Object? o) => o is DistritoPruebaRecord;
}
