import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCagBpjNgFIYbzllYhdhuwaCG1U7r_Xy6Q",
            authDomain: "travel-mate-46b40.firebaseapp.com",
            projectId: "travel-mate-46b40",
            storageBucket: "travel-mate-46b40.appspot.com",
            messagingSenderId: "312214722509",
            appId: "1:312214722509:web:79e63751ebfe8a206c1684",
            measurementId: "G-GRN9HSM0RX"));
  } else {
    await Firebase.initializeApp();
  }
}
