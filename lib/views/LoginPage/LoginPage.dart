import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_1707/controllers/LoginController/LoginController.dart';
import 'package:sih_1707/views/LoginPage/components/LoginEmailField.dart';
import 'package:sih_1707/views/LoginPage/components/LoginPasswordField.dart';
import 'package:sih_1707/views/SignUpPage/SignUpPage.dart';
import 'package:sih_1707/widgets/Button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Access the Logincontroller provider using ref.watch
    final controller = ref.watch(loginControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/LoginAssets/loginImage.jpg",
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 50),
                    const LoginEmailField(),
                    const SizedBox(height: 20),
                    const LoginPasswordField(),
                    const SizedBox(height: 30),
                    Button(
                      onPressed: controller.login,
                      text: "Login",
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Don\'t have Account with us... ',
                        style: GoogleFonts.ubuntu(
                          color: const Color.fromRGBO(27, 27, 27, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: GoogleFonts.ubuntu(
                                  color: const Color.fromRGBO(27, 27, 27, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
                                },
                            )
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
