import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_1707/controllers/SignUpController/SignUpController.dart';
import 'package:sih_1707/models/SignUpModel/SignUp.model.dart';

class SignUpDepartmentField extends ConsumerWidget {
  const SignUpDepartmentField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpControllerProvider);

    return FormField<String>(
      initialValue: controller.department,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a department";
        }
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Department",
              style: Theme.of(context).textTheme.displaySmall
            ),
            const SizedBox(height: 13),
            Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: state.hasError ? Colors.red : const Color.fromRGBO(216, 218, 220, 1),
                  width: 1,
                ),
                color: Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.department,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
                  dropdownColor: Colors.white,
                  onChanged: (String? newValue) {
                    ref.read(signUpControllerProvider).setDepartment(newValue!);
                    state.didChange(newValue); // Update FormField state
                  },
                  items: SignUpModel.departments.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    'Choose department',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(128, 128, 128, 1),
                    ),
                  ),
                  isExpanded: true,
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  state.errorText ?? "",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
