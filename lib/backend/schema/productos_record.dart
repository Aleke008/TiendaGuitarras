import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductosRecord extends FirestoreRecord {
  ProductosRecord._(
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

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "fechaPublicacion" field.
  DateTime? _fechaPublicacion;
  DateTime? get fechaPublicacion => _fechaPublicacion;
  bool hasFechaPublicacion() => _fechaPublicacion != null;

  // "marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "modelo" field.
  String? _modelo;
  String get modelo => _modelo ?? '';
  bool hasModelo() => _modelo != null;

  // "esOferta" field.
  bool? _esOferta;
  bool get esOferta => _esOferta ?? false;
  bool hasEsOferta() => _esOferta != null;

  // "precioOferta" field.
  double? _precioOferta;
  double get precioOferta => _precioOferta ?? 0.0;
  bool hasPrecioOferta() => _precioOferta != null;

  // "vendedor" field.
  List<DocumentReference>? _vendedor;
  List<DocumentReference> get vendedor => _vendedor ?? const [];
  bool hasVendedor() => _vendedor != null;

  // "provincia" field.
  List<DocumentReference>? _provincia;
  List<DocumentReference> get provincia => _provincia ?? const [];
  bool hasProvincia() => _provincia != null;

  // "canton" field.
  List<DocumentReference>? _canton;
  List<DocumentReference> get canton => _canton ?? const [];
  bool hasCanton() => _canton != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "enVenta" field.
  bool? _enVenta;
  bool get enVenta => _enVenta ?? false;
  bool hasEnVenta() => _enVenta != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _imagen = snapshotData['imagen'] as String?;
    _estado = snapshotData['estado'] as String?;
    _fechaPublicacion = snapshotData['fechaPublicacion'] as DateTime?;
    _marca = snapshotData['marca'] as String?;
    _modelo = snapshotData['modelo'] as String?;
    _esOferta = snapshotData['esOferta'] as bool?;
    _precioOferta = castToType<double>(snapshotData['precioOferta']);
    _vendedor = getDataList(snapshotData['vendedor']);
    _provincia = getDataList(snapshotData['provincia']);
    _canton = getDataList(snapshotData['canton']);
    _categoria = snapshotData['categoria'] as String?;
    _enVenta = snapshotData['enVenta'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('productos');

  static Stream<ProductosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductosRecord.fromSnapshot(s));

  static Future<ProductosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductosRecord.fromSnapshot(s));

  static ProductosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductosRecordData({
  String? nombre,
  String? descripcion,
  double? precio,
  String? imagen,
  String? estado,
  DateTime? fechaPublicacion,
  String? marca,
  String? modelo,
  bool? esOferta,
  double? precioOferta,
  String? categoria,
  bool? enVenta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'imagen': imagen,
      'estado': estado,
      'fechaPublicacion': fechaPublicacion,
      'marca': marca,
      'modelo': modelo,
      'esOferta': esOferta,
      'precioOferta': precioOferta,
      'categoria': categoria,
      'enVenta': enVenta,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductosRecordDocumentEquality implements Equality<ProductosRecord> {
  const ProductosRecordDocumentEquality();

  @override
  bool equals(ProductosRecord? e1, ProductosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precio == e2?.precio &&
        e1?.imagen == e2?.imagen &&
        e1?.estado == e2?.estado &&
        e1?.fechaPublicacion == e2?.fechaPublicacion &&
        e1?.marca == e2?.marca &&
        e1?.modelo == e2?.modelo &&
        e1?.esOferta == e2?.esOferta &&
        e1?.precioOferta == e2?.precioOferta &&
        listEquality.equals(e1?.vendedor, e2?.vendedor) &&
        listEquality.equals(e1?.provincia, e2?.provincia) &&
        listEquality.equals(e1?.canton, e2?.canton) &&
        e1?.categoria == e2?.categoria &&
        e1?.enVenta == e2?.enVenta;
  }

  @override
  int hash(ProductosRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.precio,
        e?.imagen,
        e?.estado,
        e?.fechaPublicacion,
        e?.marca,
        e?.modelo,
        e?.esOferta,
        e?.precioOferta,
        e?.vendedor,
        e?.provincia,
        e?.canton,
        e?.categoria,
        e?.enVenta
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductosRecord;
}
