import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBymKr-8npc8uZpMoKRQLjK45OzfkLVXZc",
            authDomain: "audio-test-7d63a.firebaseapp.com",
            projectId: "audio-test-7d63a",
            storageBucket: "audio-test-7d63a.appspot.com",
            messagingSenderId: "876899813106",
            appId: "1:876899813106:web:22fd3f3e8b28602309b26b"));
  } else {
    await Firebase.initializeApp();
  }
}
