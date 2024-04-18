// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> obtenerNombreCanton(String? idCanton) async {
  // Add your function code here!
  try {
    if (idCanton == null) {
      throw ArgumentError('ID de cantón requerido');
    }

    // Colección de cantones
    CollectionReference<Map<String, dynamic>> cantonesRef =
        FirebaseFirestore.instance.collection('canton');

    // Consultar el cantón por ID
    final cantonSnapshot =
        await cantonesRef.where('idCanton', isEqualTo: idCanton).get();
    if (cantonSnapshot.docs.isEmpty) {
      throw Exception('No se encontró el cantón con el ID proporcionado');
    }

    // Obtener el nombre del cantón
    final cantonDoc = cantonSnapshot.docs.first;
    final String nombreCanton = cantonDoc.get('nombre') ?? '';

    return nombreCanton;
  } catch (e) {
    print('Error al obtener el nombre del cantón: $e');
    return null; // Manejar el error devolviendo una cadena vacía
  }
}
