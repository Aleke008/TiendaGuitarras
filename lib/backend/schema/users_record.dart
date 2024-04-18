import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  bool hasRol() => _rol != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "canton" field.
  String? _canton;
  String get canton => _canton ?? '';
  bool hasCanton() => _canton != null;

  // "distrito" field.
  String? _distrito;
  String get distrito => _distrito ?? '';
  bool hasDistrito() => _distrito != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "update_time_rol" field.
  DateTime? _updateTimeRol;
  DateTime? get updateTimeRol => _updateTimeRol;
  bool hasUpdateTimeRol() => _updateTimeRol != null;

  // "nombreProvincia" field.
  String? _nombreProvincia;
  String get nombreProvincia => _nombreProvincia ?? '';
  bool hasNombreProvincia() => _nombreProvincia != null;

  // "nombreCanton" field.
  String? _nombreCanton;
  String get nombreCanton => _nombreCanton ?? '';
  bool hasNombreCanton() => _nombreCanton != null;

  // "nombreDistrito" field.
  String? _nombreDistrito;
  String get nombreDistrito => _nombreDistrito ?? '';
  bool hasNombreDistrito() => _nombreDistrito != null;

  // "alternate_photo" field.
  String? _alternatePhoto;
  String get alternatePhoto => _alternatePhoto ?? '';
  bool hasAlternatePhoto() => _alternatePhoto != null;

  // "likes" field.
  List<String>? _likes;
  List<String> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _rol = snapshotData['rol'] as String?;
    _provincia = snapshotData['provincia'] as String?;
    _canton = snapshotData['canton'] as String?;
    _distrito = snapshotData['distrito'] as String?;
    _estado = snapshotData['estado'] as String?;
    _updateTimeRol = snapshotData['update_time_rol'] as DateTime?;
    _nombreProvincia = snapshotData['nombreProvincia'] as String?;
    _nombreCanton = snapshotData['nombreCanton'] as String?;
    _nombreDistrito = snapshotData['nombreDistrito'] as String?;
    _alternatePhoto = snapshotData['alternate_photo'] as String?;
    _likes = getDataList(snapshotData['likes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? rol,
  String? provincia,
  String? canton,
  String? distrito,
  String? estado,
  DateTime? updateTimeRol,
  String? nombreProvincia,
  String? nombreCanton,
  String? nombreDistrito,
  String? alternatePhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'rol': rol,
      'provincia': provincia,
      'canton': canton,
      'distrito': distrito,
      'estado': estado,
      'update_time_rol': updateTimeRol,
      'nombreProvincia': nombreProvincia,
      'nombreCanton': nombreCanton,
      'nombreDistrito': nombreDistrito,
      'alternate_photo': alternatePhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.rol == e2?.rol &&
        e1?.provincia == e2?.provincia &&
        e1?.canton == e2?.canton &&
        e1?.distrito == e2?.distrito &&
        e1?.estado == e2?.estado &&
        e1?.updateTimeRol == e2?.updateTimeRol &&
        e1?.nombreProvincia == e2?.nombreProvincia &&
        e1?.nombreCanton == e2?.nombreCanton &&
        e1?.nombreDistrito == e2?.nombreDistrito &&
        e1?.alternatePhoto == e2?.alternatePhoto &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.rol,
        e?.provincia,
        e?.canton,
        e?.distrito,
        e?.estado,
        e?.updateTimeRol,
        e?.nombreProvincia,
        e?.nombreCanton,
        e?.nombreDistrito,
        e?.alternatePhoto,
        e?.likes
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
