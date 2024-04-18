import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ImagenesRecord extends FirestoreRecord {
  ImagenesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "listaImage" field.
  List<String>? _listaImage;
  List<String> get listaImage => _listaImage ?? const [];
  bool hasListaImage() => _listaImage != null;

  void _initializeFields() {
    _listaImage = getDataList(snapshotData['listaImage']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imagenes');

  static Stream<ImagenesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagenesRecord.fromSnapshot(s));

  static Future<ImagenesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagenesRecord.fromSnapshot(s));

  static ImagenesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImagenesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagenesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagenesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagenesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagenesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagenesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ImagenesRecordDocumentEquality implements Equality<ImagenesRecord> {
  const ImagenesRecordDocumentEquality();

  @override
  bool equals(ImagenesRecord? e1, ImagenesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.listaImage, e2?.listaImage);
  }

  @override
  int hash(ImagenesRecord? e) => const ListEquality().hash([e?.listaImage]);

  @override
  bool isValidKey(Object? o) => o is ImagenesRecord;
}
