// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future cambiarEstadoDesconectadoUsuario(String? authUserId) async {
  // Add your function code here!
  try {
    // Obtener referencia al documento del usuario en Firestore
    DocumentReference<Map<String, dynamic>> usuarioRef =
        FirebaseFirestore.instance.collection('users').doc(authUserId);

    // Actualizar el estado del usuario a "Desconectado"
    await usuarioRef.update({'estado': 'Desconectado'});

    print('Estado del usuario actualizado a "Desconectado" correctamente.');
  } catch (e) {
    print('Error al actualizar el estado del usuario: $e');
    // Puedes manejar errores según sea necesario
  }
}
