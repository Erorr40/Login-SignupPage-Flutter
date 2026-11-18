import 'package:flutter/material.dart';
import 'package:signuploginpages/Models/auth_model.dart';
import 'package:signuploginpages/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? auth;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    auth = await AuthService.login(email: email, password: password);
    notifyListeners();
  }

  Future<void> userSignUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    auth = await AuthService.signUp(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    notifyListeners();
  }
}
