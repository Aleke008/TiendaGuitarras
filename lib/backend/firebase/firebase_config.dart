import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBdmPa1qEigHJthYn5iyCkVPgBbTZPM1Ks",
            authDomain: "tiendaguitarras.firebaseapp.com",
            projectId: "tiendaguitarras",
            storageBucket: "tiendaguitarras.appspot.com",
            messagingSenderId: "29686641880",
            appId: "1:29686641880:web:904c063b82a7121c33d3ad",
            measurementId: "G-MDC2FPKRMF"));
  } else {
    await Firebase.initializeApp();
  }
}
