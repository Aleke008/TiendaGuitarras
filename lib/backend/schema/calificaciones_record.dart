import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalificacionesRecord extends FirestoreRecord {
  CalificacionesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "puntuacion" field.
  int? _puntuacion;
  int get puntuacion => _puntuacion ?? 0;
  bool hasPuntuacion() => _puntuacion != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  void _initializeFields() {
    _puntuacion = castToType<int>(snapshotData['puntuacion']);
    _comentario = snapshotData['comentario'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calificaciones');

  static Stream<CalificacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CalificacionesRecord.fromSnapshot(s));

  static Future<CalificacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CalificacionesRecord.fromSnapshot(s));

  static CalificacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CalificacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CalificacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CalificacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CalificacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CalificacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCalificacionesRecordData({
  int? puntuacion,
  String? comentario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'puntuacion': puntuacion,
      'comentario': comentario,
    }.withoutNulls,
  );

  return firestoreData;
}

class CalificacionesRecordDocumentEquality
    implements Equality<CalificacionesRecord> {
  const CalificacionesRecordDocumentEquality();

  @override
  bool equals(CalificacionesRecord? e1, CalificacionesRecord? e2) {
    return e1?.puntuacion == e2?.puntuacion && e1?.comentario == e2?.comentario;
  }

  @override
  int hash(CalificacionesRecord? e) =>
      const ListEquality().hash([e?.puntuacion, e?.comentario]);

  @override
  bool isValidKey(Object? o) => o is CalificacionesRecord;
}
