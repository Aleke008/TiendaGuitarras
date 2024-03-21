import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VentasRecord extends FirestoreRecord {
  VentasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "fechaVenta" field.
  DateTime? _fechaVenta;
  DateTime? get fechaVenta => _fechaVenta;
  bool hasFechaVenta() => _fechaVenta != null;

  // "precioTotal" field.
  double? _precioTotal;
  double get precioTotal => _precioTotal ?? 0.0;
  bool hasPrecioTotal() => _precioTotal != null;

  // "estadoVenta" field.
  String? _estadoVenta;
  String get estadoVenta => _estadoVenta ?? '';
  bool hasEstadoVenta() => _estadoVenta != null;

  void _initializeFields() {
    _fechaVenta = snapshotData['fechaVenta'] as DateTime?;
    _precioTotal = castToType<double>(snapshotData['precioTotal']);
    _estadoVenta = snapshotData['estadoVenta'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ventas');

  static Stream<VentasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VentasRecord.fromSnapshot(s));

  static Future<VentasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VentasRecord.fromSnapshot(s));

  static VentasRecord fromSnapshot(DocumentSnapshot snapshot) => VentasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VentasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VentasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VentasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VentasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVentasRecordData({
  DateTime? fechaVenta,
  double? precioTotal,
  String? estadoVenta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fechaVenta': fechaVenta,
      'precioTotal': precioTotal,
      'estadoVenta': estadoVenta,
    }.withoutNulls,
  );

  return firestoreData;
}

class VentasRecordDocumentEquality implements Equality<VentasRecord> {
  const VentasRecordDocumentEquality();

  @override
  bool equals(VentasRecord? e1, VentasRecord? e2) {
    return e1?.fechaVenta == e2?.fechaVenta &&
        e1?.precioTotal == e2?.precioTotal &&
        e1?.estadoVenta == e2?.estadoVenta;
  }

  @override
  int hash(VentasRecord? e) => const ListEquality()
      .hash([e?.fechaVenta, e?.precioTotal, e?.estadoVenta]);

  @override
  bool isValidKey(Object? o) => o is VentasRecord;
}
