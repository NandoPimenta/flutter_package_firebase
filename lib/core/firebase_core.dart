import 'package:firebase_core/firebase_core.dart';

class FirebaseCoreApp {
  static init(defaultFirebaseOptions) async {
    await Firebase.initializeApp(
    options: defaultFirebaseOptions,
);
  }
}
