import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_1707/main.dart';
import 'package:sih_1707/models/SignUpModel/SignUp.model.dart';
import 'package:sih_1707/controllers/AuthController/AuthController.dart';
import 'package:sih_1707/models/ResponseModel/Response.model.dart';

final signUpControllerProvider = Provider<SignUpController>((ref) {
  return SignUpController(ref.read(authControllerProvider));
});

class SignUpController {
  SignUpModel model = SignUpModel();
  final AuthController authController;

  SignUpController(this.authController);

  // Getters
  String? get emailAddress => model.emailAddress;
  String? get password => model.password;
  String? get firstName => model.firstName;
  String? get lastName => model.lastName;
  String? get designation => model.designation;
  String? get department => model.department;
  String? get phoneNumber => model.phoneNumber;

  // Setters
  void setEmail(String email) {
    model.emailAddress = email;
  }

  void setPhoneNumber(String number) {
    model.phoneNumber = number;
  }

  void setPassword(String password) {
    model.password = password;
  }

  void setFirstName(String firstName) {
    model.firstName = firstName;
  }

  void setLastName(String lastName) {
    model.lastName = lastName;
  }

  void setDesignation(String designation) {
    model.designation = designation;
  }

  void setDepartment(String department) {
    model.department = department;
  }

  // Validators
  String? validateEmail() {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (emailAddress != null && emailRegex.hasMatch(emailAddress!)) {
      return null;
    }
    return "Invalid Email";
  }

  String? validatePassword() {
    if (password == null || password!.isEmpty) {
      return "Password is Required";
    }
    return null;
  }

  String? validateFirstName() {
    if (firstName == null || firstName!.isEmpty) {
      return "First Name is Required";
    }
    return null;
  }

  String? validateLastName() {
    if (lastName == null || lastName!.isEmpty) {
      return "Last Name is Required";
    }
    return null;
  }

  String? validateDesignation() {
    if (designation == null || designation!.isEmpty) {
      return "Designation is Required";
    }
    return null;
  }

  String? validateDepartment() {
    if (department == null || department!.isEmpty) {
      return "Department is Required";
    }
    return null;
  }

  String? validatePhoneNumber() {
    if(phoneNumber != null && phoneNumber!.length == 10
    && phoneNumber!.startsWith(RegExp(r'[6-9]'))){
      return null;
    }
    return "Invalid Phone Number";
  }

  Future<ResponseModel> signUp() async {
    if (validateEmail() == null &&
        validatePassword() == null &&
        validateFirstName() == null &&
        validateLastName() == null &&
        validateDesignation() == null &&
        validateDepartment() == null &&
        validatePhoneNumber() == null) {
      
      return await authController.signUp(model);
    } else {
      return ResponseModel("Invalid Input", null);
    }
  }
}
