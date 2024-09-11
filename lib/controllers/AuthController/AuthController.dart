import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:sih_1707/constants/auth.dart';
import 'package:sih_1707/controllers/LocalStorageController/LocalStorageController.dart';
import 'package:sih_1707/models/ResponseModel/Response.model.dart';
import 'package:sih_1707/models/UserModel/User.model.dart';
import 'package:sih_1707/models/SignUpModel/SignUp.model.dart';
// final authContollerProvider = Provider((ref) => AuthController(client: Client(), localStorageController: LocalStorageController()));
// final userProvider = StateProvider<UserModel?>((ref) => null);
class AuthController {
  final Client _client;
  final LocalStorageController _localStorageController;

  AuthController({
    required Client client,
    required LocalStorageController localStorageController,
  }) : _client = client,
       _localStorageController = localStorageController;

  Future<ResponseModel> getUserData() async {
    ResponseModel error = ResponseModel(
      'Some unexpected error occurred.', null
    );
    try {
      String? token = await _localStorageController.getToken();

      if (token != null) {
        var res = await _client.get(Uri.parse('$host/employees/getuser'), headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });
        switch (res.statusCode) {
          case 200:
            final newUser = UserModel.fromJson(
              jsonDecode(res.body)['user'] as Map<String, dynamic>,
            ).update(token: token);
            error = ResponseModel(null, newUser);
            _localStorageController.setToken(newUser.token!); 
            break;
          default:
            error = ResponseModel('Failed to fetch user data', null);
        }
      }
    } catch (e) {
      error = ResponseModel(
        e.toString(), null,
      );
    }
    return error;
  }

  Future<ResponseModel> signUp(SignUpModel signUpModel) async {
    ResponseModel error = ResponseModel(
      'Some unexpected error occurred.', null
    );
    try {
      var res = await _client.post(
        Uri.parse('$host/employees/signup'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(signUpModel.toJson()),
      );

      switch (res.statusCode) {
        case 201:
          final user = UserModel.fromJson(
            jsonDecode(res.body)['user'] as Map<String, dynamic>,
          );
          error = ResponseModel(null, user);
          break;
        case 400:
          error = ResponseModel('Invalid signup data', null);
          break;
        default:
          error = ResponseModel('Failed to sign up', null);
      }
    } catch (e) {
      error = ResponseModel(
        e.toString(), null,
      );
    }
    return error;
  }

  Future<ResponseModel> login(String email, String password) async {
    ResponseModel error = ResponseModel(
      'Some unexpected error occurred.', null
    );
    try {
      var res = await _client.post(
        Uri.parse('$host/employees/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      switch (res.statusCode) {
        case 200:
          final user = UserModel.fromJson(
            jsonDecode(res.body)['user'] as Map<String, dynamic>,
          );
          final token = jsonDecode(res.body)['token'] as String?;
          user.token = token; 
          _localStorageController.setToken(token ?? '');
          error = ResponseModel(null, user);
          break;
        case 401:
          error = ResponseModel('Invalid email or password', null);
          break;
        default:
          error = ResponseModel('Failed to login', null);
      }
    } catch (e) {
      error = ResponseModel(
        e.toString(), null,
      );
    }
    return error;
  }

  void signOut() async {
    _localStorageController.setToken('');
  }
}
