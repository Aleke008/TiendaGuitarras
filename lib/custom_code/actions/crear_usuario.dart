// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future crearUsuario(
    String emailAdress, String name, String password, String randomApp) async {
  DateTime hoy = DateTime.now();
  FirebaseApp app = await Firebase.initializeApp(
      name: randomApp, options: Firebase.app().options);

  UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
      .createUserWithEmailAndPassword(email: emailAdress, password: password);

  String? uid = userCredential.user?.uid;
  final CollectionReference<Map<String, dynamic>> coleccion =
      FirebaseFirestore.instance.collection('users');

  coleccion.doc(uid).set({
    'uid': uid,
    'display_name': name,
    'email': emailAdress,
    'created_time': hoy,
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
