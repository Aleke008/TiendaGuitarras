import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Productos2Record extends FirestoreRecord {
  Productos2Record._(
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

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "esOferta" field.
  bool? _esOferta;
  bool get esOferta => _esOferta ?? false;
  bool hasEsOferta() => _esOferta != null;

  // "precioOferta" field.
  double? _precioOferta;
  double get precioOferta => _precioOferta ?? 0.0;
  bool hasPrecioOferta() => _precioOferta != null;

  // "fechaPublicacion" field.
  DateTime? _fechaPublicacion;
  DateTime? get fechaPublicacion => _fechaPublicacion;
  bool hasFechaPublicacion() => _fechaPublicacion != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _esOferta = snapshotData['esOferta'] as bool?;
    _precioOferta = castToType<double>(snapshotData['precioOferta']);
    _fechaPublicacion = snapshotData['fechaPublicacion'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('productos2')
          : FirebaseFirestore.instance.collectionGroup('productos2');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('productos2').doc(id);

  static Stream<Productos2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Productos2Record.fromSnapshot(s));

  static Future<Productos2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Productos2Record.fromSnapshot(s));

  static Productos2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Productos2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Productos2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Productos2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Productos2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Productos2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductos2RecordData({
  String? nombre,
  String? descripcion,
  double? precio,
  bool? esOferta,
  double? precioOferta,
  DateTime? fechaPublicacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'esOferta': esOferta,
      'precioOferta': precioOferta,
      'fechaPublicacion': fechaPublicacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class Productos2RecordDocumentEquality implements Equality<Productos2Record> {
  const Productos2RecordDocumentEquality();

  @override
  bool equals(Productos2Record? e1, Productos2Record? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precio == e2?.precio &&
        e1?.esOferta == e2?.esOferta &&
        e1?.precioOferta == e2?.precioOferta &&
        e1?.fechaPublicacion == e2?.fechaPublicacion;
  }

  @override
  int hash(Productos2Record? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.precio,
        e?.esOferta,
        e?.precioOferta,
        e?.fechaPublicacion
      ]);

  @override
  bool isValidKey(Object? o) => o is Productos2Record;
}
