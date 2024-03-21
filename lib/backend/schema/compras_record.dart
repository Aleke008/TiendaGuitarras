import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ComprasRecord extends FirestoreRecord {
  ComprasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "productos" field.
  List<String>? _productos;
  List<String> get productos => _productos ?? const [];
  bool hasProductos() => _productos != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _productos = getDataList(snapshotData['productos']);
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('compras');

  static Stream<ComprasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComprasRecord.fromSnapshot(s));

  static Future<ComprasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComprasRecord.fromSnapshot(s));

  static ComprasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComprasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComprasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComprasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComprasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComprasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComprasRecordData({
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComprasRecordDocumentEquality implements Equality<ComprasRecord> {
  const ComprasRecordDocumentEquality();

  @override
  bool equals(ComprasRecord? e1, ComprasRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.productos, e2?.productos) &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(ComprasRecord? e) =>
      const ListEquality().hash([e?.productos, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is ComprasRecord;
}
