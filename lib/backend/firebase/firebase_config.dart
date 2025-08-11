import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDd-dt5Qm9B7J7BevxY26VG9jS6V5dfoAU",
            authDomain: "patidoapp.firebaseapp.com",
            projectId: "patidoapp",
            storageBucket: "patidoapp.firebasestorage.app",
            messagingSenderId: "990607468101",
            appId: "1:990607468101:web:bb4adfd70ff62fa16b252c",
            measurementId: "G-RFJL2QXKP6"));
  } else {
    await Firebase.initializeApp();
  }
}
