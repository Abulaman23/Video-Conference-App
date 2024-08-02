import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/signup_screen_2.dart';
import 'package:video_conference_app/utils/colors.dart';
import 'package:video_conference_app/widgets/login_form.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 22, right: 20, top: 25, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage('assets/images/login_page.png'),
                  height: size.height * 0.2,
                ),
                Text(
                  'Welcome Back,',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'Make it work, make it right, make it fast.',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const LoginForm(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            builder: (context) => const SignUpScreen2(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account?",
                          style: Theme.of(context).textTheme.titleSmall,
                          children: [
                            TextSpan(
                              text: 'Sign Up'.toUpperCase(),
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
