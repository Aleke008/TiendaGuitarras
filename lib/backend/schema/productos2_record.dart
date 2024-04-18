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

  // "enVenta" field.
  bool? _enVenta;
  bool get enVenta => _enVenta ?? false;
  bool hasEnVenta() => _enVenta != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "modelo" field.
  String? _modelo;
  String get modelo => _modelo ?? '';
  bool hasModelo() => _modelo != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "imagenPrincipal" field.
  String? _imagenPrincipal;
  String get imagenPrincipal => _imagenPrincipal ?? '';
  bool hasImagenPrincipal() => _imagenPrincipal != null;

  // "imagenesSecundarias" field.
  List<String>? _imagenesSecundarias;
  List<String> get imagenesSecundarias => _imagenesSecundarias ?? const [];
  bool hasImagenesSecundarias() => _imagenesSecundarias != null;

  // "uidVendedor" field.
  String? _uidVendedor;
  String get uidVendedor => _uidVendedor ?? '';
  bool hasUidVendedor() => _uidVendedor != null;

  // "fechaActualizacion" field.
  DateTime? _fechaActualizacion;
  DateTime? get fechaActualizacion => _fechaActualizacion;
  bool hasFechaActualizacion() => _fechaActualizacion != null;

  // "likes" field.
  List<String>? _likes;
  List<String> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _esOferta = snapshotData['esOferta'] as bool?;
    _precioOferta = castToType<double>(snapshotData['precioOferta']);
    _fechaPublicacion = snapshotData['fechaPublicacion'] as DateTime?;
    _enVenta = snapshotData['enVenta'] as bool?;
    _categoria = snapshotData['categoria'] as String?;
    _marca = snapshotData['marca'] as String?;
    _modelo = snapshotData['modelo'] as String?;
    _estado = snapshotData['estado'] as String?;
    _imagenPrincipal = snapshotData['imagenPrincipal'] as String?;
    _imagenesSecundarias = getDataList(snapshotData['imagenesSecundarias']);
    _uidVendedor = snapshotData['uidVendedor'] as String?;
    _fechaActualizacion = snapshotData['fechaActualizacion'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
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
  bool? enVenta,
  String? categoria,
  String? marca,
  String? modelo,
  String? estado,
  String? imagenPrincipal,
  String? uidVendedor,
  DateTime? fechaActualizacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'esOferta': esOferta,
      'precioOferta': precioOferta,
      'fechaPublicacion': fechaPublicacion,
      'enVenta': enVenta,
      'categoria': categoria,
      'marca': marca,
      'modelo': modelo,
      'estado': estado,
      'imagenPrincipal': imagenPrincipal,
      'uidVendedor': uidVendedor,
      'fechaActualizacion': fechaActualizacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class Productos2RecordDocumentEquality implements Equality<Productos2Record> {
  const Productos2RecordDocumentEquality();

  @override
  bool equals(Productos2Record? e1, Productos2Record? e2) {
    const listEquality = ListEquality();
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precio == e2?.precio &&
        e1?.esOferta == e2?.esOferta &&
        e1?.precioOferta == e2?.precioOferta &&
        e1?.fechaPublicacion == e2?.fechaPublicacion &&
        e1?.enVenta == e2?.enVenta &&
        e1?.categoria == e2?.categoria &&
        e1?.marca == e2?.marca &&
        e1?.modelo == e2?.modelo &&
        e1?.estado == e2?.estado &&
        e1?.imagenPrincipal == e2?.imagenPrincipal &&
        listEquality.equals(e1?.imagenesSecundarias, e2?.imagenesSecundarias) &&
        e1?.uidVendedor == e2?.uidVendedor &&
        e1?.fechaActualizacion == e2?.fechaActualizacion &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(Productos2Record? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.precio,
        e?.esOferta,
        e?.precioOferta,
        e?.fechaPublicacion,
        e?.enVenta,
        e?.categoria,
        e?.marca,
        e?.modelo,
        e?.estado,
        e?.imagenPrincipal,
        e?.imagenesSecundarias,
        e?.uidVendedor,
        e?.fechaActualizacion,
        e?.likes
      ]);

  @override
  bool isValidKey(Object? o) => o is Productos2Record;
}
