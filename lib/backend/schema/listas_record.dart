import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ListasRecord extends FirestoreRecord {
  ListasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "fechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "uidVendedor" field.
  String? _uidVendedor;
  String get uidVendedor => _uidVendedor ?? '';
  bool hasUidVendedor() => _uidVendedor != null;

  // "fechaActualizacion" field.
  DateTime? _fechaActualizacion;
  DateTime? get fechaActualizacion => _fechaActualizacion;
  bool hasFechaActualizacion() => _fechaActualizacion != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _fechaCreacion = snapshotData['fechaCreacion'] as DateTime?;
    _uidVendedor = snapshotData['uidVendedor'] as String?;
    _fechaActualizacion = snapshotData['fechaActualizacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listas');

  static Stream<ListasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListasRecord.fromSnapshot(s));

  static Future<ListasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListasRecord.fromSnapshot(s));

  static ListasRecord fromSnapshot(DocumentSnapshot snapshot) => ListasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListasRecordData({
  String? nombre,
  String? descripcion,
  String? imagen,
  DateTime? fechaCreacion,
  String? uidVendedor,
  DateTime? fechaActualizacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
      'fechaCreacion': fechaCreacion,
      'uidVendedor': uidVendedor,
      'fechaActualizacion': fechaActualizacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListasRecordDocumentEquality implements Equality<ListasRecord> {
  const ListasRecordDocumentEquality();

  @override
  bool equals(ListasRecord? e1, ListasRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagen == e2?.imagen &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.uidVendedor == e2?.uidVendedor &&
        e1?.fechaActualizacion == e2?.fechaActualizacion;
  }

  @override
  int hash(ListasRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.imagen,
        e?.fechaCreacion,
        e?.uidVendedor,
        e?.fechaActualizacion
      ]);

  @override
  bool isValidKey(Object? o) => o is ListasRecord;
}
