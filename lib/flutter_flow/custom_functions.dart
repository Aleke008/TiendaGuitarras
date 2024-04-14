import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? construirChatRoomId(
  String? userId,
  String? otherUserId,
) {
  if (userId == null || otherUserId == null) {
    return null;
  }

  // Ordenar los IDs de usuario alfabéticamente para garantizar consistencia en el ID de la sala de chat
  List<String> userIds = [userId, otherUserId];
  userIds.sort();

  // Concatenar los IDs de usuario ordenados para formar el ID de la sala de chat
  String chatRoomId = '${userIds[0]}_${userIds[1]}';

  return chatRoomId;
}

bool? calcularDifTiempoMsgEnviado(DateTime? fechaHoraEnvio) {
  try {
    if (fechaHoraEnvio == null) {
      throw ArgumentError('La fecha de envío no puede ser nula');
    }

    // Obtener la fecha y hora actual
    DateTime fechaActual = DateTime.now();

    // Calcular la diferencia de tiempo en minutos
    Duration diferencia = fechaActual.difference(fechaHoraEnvio);
    int minutosDiferencia =
        diferencia.inMinutes.abs(); // Obtener valor absoluto

    // Verificar si la diferencia es mayor a 5 minutos
    bool esMayorA5Minutos = minutosDiferencia > 5;

    return esMayorA5Minutos;
  } catch (e) {
    print('Error al calcular la diferencia de tiempo: $e');
    return false; // Manejar el error devolviendo false
  }
}
