// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> obtenerNombreProvincia(String? idProvincia) async {
  // Add your function code here!
  try {
    if (idProvincia == null) {
      throw ArgumentError('ID de provincia requerido');
    }

    // Colección de provincias
    CollectionReference<Map<String, dynamic>> provinciasRef =
        FirebaseFirestore.instance.collection('provincia');

    // Consultar la provincia por ID
    final provinciaSnapshot =
        await provinciasRef.where('idProvincia', isEqualTo: idProvincia).get();
    if (provinciaSnapshot.docs.isEmpty) {
      throw Exception('No se encontró la provincia con el ID proporcionado');
    }

    // Obtener el nombre de la provincia
    final provinciaDoc = provinciaSnapshot.docs.first;
    final String nombreProvincia = provinciaDoc.get('nombre') ?? '';

    return nombreProvincia;
  } catch (e) {
    print('Error al obtener el nombre de la provincia: $e');
    return null; // Manejar el error devolviendo una cadena vacía
  }
}
