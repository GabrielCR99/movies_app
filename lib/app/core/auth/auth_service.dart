import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  User? user;

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      this.user = user;

      if (user == null) {
        Get.offAllNamed<void>('/login');
      } else {
        Get.offAllNamed<void>('/home');
      }
    });
  }
}
