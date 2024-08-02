import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/login_screen_2.dart';
import 'package:video_conference_app/utils/colors.dart';
import 'package:video_conference_app/widgets/signup_form.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage('assets/images/login_page.png'),
                  height: size.height * 0.2,
                ),
                const Text(
                  'Get on Board!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Create your profile to start your journey.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SignUpform(),
                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.08,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        icon: const Image(
                          image: AssetImage('assets/images/google_logo.png'),
                          width: 50,
                        ),
                        onPressed: () {},
                        label: Text(
                          'Sign-in with Google',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen2(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account?",
                          style: Theme.of(context).textTheme.titleSmall,
                          children: [
                            TextSpan(
                              text: 'Login'.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
