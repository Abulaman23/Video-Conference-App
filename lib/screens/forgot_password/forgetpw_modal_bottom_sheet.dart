import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/forgot_password/forgetpw_mail.dart';
import 'package:video_conference_app/screens/forgot_password/forgetpw_phone.dart';
import 'package:video_conference_app/widgets/forget_passwordbtn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Make selection!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Select one of the options given below to reset your password.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 30),
            ForgetPwBtnWidget(
              title: 'E-Mail',
              subTitle: 'Reset via Mail Verification',
              iconBtn: Icons.email_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetPasswordMailScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ForgetPwBtnWidget(
              title: 'Phone No',
              subTitle: 'Reset via Phone Verification',
              iconBtn: Icons.mobile_friendly_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetPasswordPhoneScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
