import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:speed_vision/api/auth_api.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthAPI _authAPI = AuthAPI();
  RxBool isLoading = false.obs;
  User? user = FirebaseAuth.instance.currentUser;

  bool get loading => isLoading.value;

  void setLoading(bool value) {
    isLoading.value = value;
    update();
  }

  Future<void> signUp(String email, String password) async {
    try {
      User? signUpUser = await _authAPI.signUp(email, password);
      if (signUpUser != null) {
        log("Sign up success");
        user = signUpUser;
      } else {
        log("Sign up failed");
      }
      notifyChildrens();
    } catch (e) {
      log("Error during sign up: $e");
    }
  }

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      User? loginUser = await _authAPI.login(email, password);
      if (loginUser != null) {
        log("Login success");
        user = loginUser;
      } else {
        log("Login failed");
      }
    } catch (e) {
      log("Error during login: $e");
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {
    try {
      await _authAPI.signOut();
      user = null;
      notifyChildrens();
    } catch (e) {
      log("Error during sign out: $e");
    }
  }
}
