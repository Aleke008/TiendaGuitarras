// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future cambiarEstadoMensaje(
  String? chatRoomId,
  String? authUserId,
) async {
  // Add your function code here!
  try {
    // Obtener referencia a la colección 'mensajes' en Firestore
    CollectionReference<Map<String, dynamic>> coleccion =
        FirebaseFirestore.instance.collection('mensajes');

    // Consulta para obtener mensajes no leídos con el criterio de filtro de chatRoomId, receiverId y estado
    QuerySnapshot<Map<String, dynamic>> snapshot = await coleccion
        .where('chatRoomId', isEqualTo: chatRoomId)
        .where('receiverId', isEqualTo: authUserId)
        .where('estado', isEqualTo: false)
        .get();

    // Iterar sobre los documentos obtenidos en el snapshot
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      // Marcar el mensaje como leído actualizando el estado a true
      await coleccion.doc(doc.id).update({'estado': true});
    }

    print('Mensajes no leídos evaluados correctamente.');
  } catch (e) {
    print('Error al evaluar mensajes no leídos: $e');
    // Puedes manejar errores según sea necesario
  }
}
