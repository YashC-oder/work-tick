import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_1707/main.dart';
import 'package:sih_1707/models/LoginModel/Login.model.dart';
import 'package:sih_1707/controllers/AuthController/AuthController.dart';
import 'package:sih_1707/models/ResponseModel/Response.model.dart';

final loginControllerProvider = Provider<LoginController>((ref) {
  return LoginController(ref.read(authControllerProvider));
});

class LoginController {
  LoginModel model = LoginModel();
  final AuthController authController;

  LoginController(this.authController);

  String? get emailAddress => model.emailAddress;
  String? get password => model.password;

  void setEmail(String email) {
    model.emailAddress = email;
  }

  void setPassword(String password) {
    model.password = password;
  }

  String? validateEmail() {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (emailAddress != null && emailRegex.hasMatch(emailAddress!)) {
      return null;
    }
    return "Invalid Email";
  }

  String? validatePassword() {
    if (password == null) {
      return "Password is Required";
    }
    return null;
  }

  Future<ResponseModel> login() async {
    final emailError = validateEmail();
    final passwordError = validatePassword();

    if (emailError != null) {
      return ResponseModel(emailError, null);
    }
    if (passwordError != null) {
      return ResponseModel(passwordError, null);
    }

    try {
      ResponseModel response = await authController.login(model.emailAddress!, model.password!);
      return response;
    } catch (e) {
      return ResponseModel("Login failed: ${e.toString()}", null);
    }
  }
}
