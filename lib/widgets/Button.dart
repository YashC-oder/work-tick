import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disable;
  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    this.disable = false,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: TextButton(
        onPressed: widget.disable?null: widget.onPressed,
        onHover: (value) {
        },
        style: TextButton.styleFrom(
          disabledBackgroundColor: const Color.fromRGBO(247, 249, 250, 1),
          disabledForegroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor:Colors.white,
        ),
        child:Text(
          widget.text,
          style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
        ),
      ),
    );
  }
}
