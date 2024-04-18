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

String? obtenerNombreUsuario(String? correo) {
  try {
    if (correo == null || !correo.contains('@')) {
      // Si el correo es nulo o no contiene '@', devolver null o mensaje de error
      return null; // O lanzar una excepción, según tus necesidades
    }

    // Dividir el correo en dos partes usando '@' como separador
    List<String> partes = correo.split('@');

    // La parte antes de '@' es el nombre de usuario
    String nombreUsuario = partes[0];

    return nombreUsuario;
  } catch (e) {
    print('Error al obtener el nombre de usuario: $e');
    return null; // Manejar el error devolviendo null
  }
}

int? calcularAnosVendedor(DateTime? fechaRegistroVendedor) {
  if (fechaRegistroVendedor == null) {
    return 0;
  }

  DateTime fechaActual = DateTime.now();
  Duration duracion = fechaActual.difference(fechaRegistroVendedor);

  // Calcula el número de años transcurridos
  double anosTranscurridos = duracion.inDays / 365;

  // Si han pasado menos de un año, devuelve 0
  if (anosTranscurridos < 1) {
    return 0;
  }

  // Devuelve el número de años transcurridos redondeado hacia abajo
  return anosTranscurridos.floor();
}

int? calcularCalificacionVendedor(
  String? cantidadLikes,
  String? cantidadProductosVendidos,
) {
  // Verificar que los parámetros no sean nulos ni vacíos
  if (cantidadLikes == null ||
      cantidadProductosVendidos == null ||
      cantidadLikes.isEmpty ||
      cantidadProductosVendidos.isEmpty) {
    return 0; // En caso de parámetros inválidos, retornar una calificación de 0
  }

  // Convertir los valores de cantidadLikes y cantidadProductosVendidos a enteros
  int likes = int.tryParse(cantidadLikes) ?? 0;
  int productosVendidos = int.tryParse(cantidadProductosVendidos) ?? 0;

  try {
    // Calcular la calificación ponderada
    double calificacion = (likes / productosVendidos) * 5; // Escala de 1 a 5

    // Redondear y devolver el valor como un entero
    return calificacion
        .round()
        .clamp(1, 5); // Asegurar que la calificación esté entre 1 y 5
  } catch (e) {
    print('Error al calcular la calificación: $e');
    return 0; // Devolver 0 en caso de error (por ejemplo, división entre cero)
  }
}
