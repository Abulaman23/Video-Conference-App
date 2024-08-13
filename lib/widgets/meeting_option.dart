import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  const MeetingOption(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width * 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
              ),
            ),
          ),
          Switch.adaptive(
            value: isMute,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
