import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckInStatus extends StatelessWidget {
  final bool isCheckedIn;

  const CheckInStatus({super.key, required this.isCheckedIn});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Check-In Status :",
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: isCheckedIn
                  ? Colors.green.withOpacity(0.2)
                  : Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                isCheckedIn ? 'Checked In' : 'Not Checked In',
                style: TextStyle(
                  color: isCheckedIn ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
