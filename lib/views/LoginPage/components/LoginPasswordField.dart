import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_1707/controllers/LoginController/LoginController.dart';

class LoginPasswordField extends ConsumerStatefulWidget {
  const LoginPasswordField({super.key});

  @override
  ConsumerState<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends ConsumerState<LoginPasswordField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: Theme.of(context).textTheme.displaySmall
        ),
        const SizedBox(height: 13),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(216, 218, 220, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(128, 128, 128, 1),
                    ),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  obscureText: obscureText,
                  onChanged: controller.setPassword,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: obscureText
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
