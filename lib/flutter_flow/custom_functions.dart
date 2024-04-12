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
