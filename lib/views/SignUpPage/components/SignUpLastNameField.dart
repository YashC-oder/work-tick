import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_1707/controllers/SignUpController/SignUpController.dart';

class SignUpLastNameField extends ConsumerStatefulWidget {
  const SignUpLastNameField({super.key});

  @override
  ConsumerState<SignUpLastNameField> createState() => _SignUpLastNameFieldState();
}

class _SignUpLastNameFieldState extends ConsumerState<SignUpLastNameField> {
  String? error;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(signUpControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name",
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
                    hintText: "Enter your Last Name",
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
                  onChanged: controller.setLastName,
                  onEditingComplete: (){
                    setState(() {
                      error = controller.validateLastName();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        if(error != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            error!,
            style: GoogleFonts.ubuntu(
              color: Colors.red,
              fontSize: 11,
              fontWeight: FontWeight.normal
            ),
          ),
        )
      ],
    );
  }
}
