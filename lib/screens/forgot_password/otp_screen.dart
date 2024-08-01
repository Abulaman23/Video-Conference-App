import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CO\nDE',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 81,
              ),
            ),
            Text(
              'Verification'.toUpperCase(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 40),
            Text(
              'Enter the verification code sent at abul2002aman@gmail.com',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black54.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.number,
              onSubmit: (otp) {
                // ignore: avoid_print
                print("OTP is : $otp");
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
