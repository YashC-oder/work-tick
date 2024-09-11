import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_1707/controllers/SignUpController/SignUpController.dart';
import 'package:sih_1707/views/SignUpPage/components/SIgnUpDesignationField.dart';
import 'package:sih_1707/views/SignUpPage/components/SignUpDepartmentField.dart';
import 'package:sih_1707/views/SignUpPage/components/SignUpEmailField.dart';
import 'package:sih_1707/views/SignUpPage/components/SignUpFirstNameField.dart';
import 'package:sih_1707/views/SignUpPage/components/SignUpLastNameField.dart';
import 'package:sih_1707/views/SignUpPage/components/SignUpPasswordField.dart';
import 'package:sih_1707/views/SignUpPage/components/SignUpPhoneNoField.dart';
import 'package:sih_1707/widgets/Button.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(signUpControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Column(
              children: [
                Text(
                  "Personal Details",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 30),
                const SignUpFirstNameField(),
                const SizedBox(height: 20),
                const SignUpLastNameField(),
                const SizedBox(height: 20),
                const SignUpPhoneNoField(),
                const SizedBox(height: 20,),
                const SignUpDepartmentField(),
                const SizedBox(height: 20,),
                const SignUpDesignationField(),
                const SizedBox(height: 20,),
                const SignUpEmailField(),
                const SizedBox(height: 20),
                const SignUpPasswordField(),
                const SizedBox(height: 30),
                Button(
                  onPressed: controller.signUp,
                  text: "Sign Up",
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Already have Account with us... ',
                      style: GoogleFonts.ubuntu(
                        color: const Color.fromRGBO(27, 27, 27, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: GoogleFonts.ubuntu(
                              color: const Color.fromRGBO(27, 27, 27, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pop();
                            },
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
