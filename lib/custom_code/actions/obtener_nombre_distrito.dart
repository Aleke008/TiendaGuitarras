// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> obtenerNombreDistrito(String? idDistrito) async {
  // Add your function code here!
  try {
    if (idDistrito == null) {
      throw ArgumentError('ID de distrito requerido');
    }

    // Colección de distritos
    CollectionReference<Map<String, dynamic>> distritosRef =
        FirebaseFirestore.instance.collection('distrito');

    // Consultar el distrito por ID
    final distritoSnapshot =
        await distritosRef.where('idDistrito', isEqualTo: idDistrito).get();
    if (distritoSnapshot.docs.isEmpty) {
      throw Exception('No se encontró el distrito con el ID proporcionado');
    }

    // Obtener el nombre del distrito
    final distritoDoc = distritoSnapshot.docs.first;
    final String nombreDistrito = distritoDoc.get('nombre') ?? '';

    return nombreDistrito;
  } catch (e) {
    print('Error al obtener el nombre del distrito: $e');
    return ''; // Manejar el error devolviendo una cadena vacía
  }
}
