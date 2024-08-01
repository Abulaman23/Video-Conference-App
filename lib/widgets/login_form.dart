import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/splash_screen_tologin.dart';
import 'package:video_conference_app/utils/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void dispose() {
    super.dispose();
    mailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: mailController,
              decoration: const InputDecoration(
                labelText: 'E-Mail',
                hintText: 'E-Mail',
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                prefixIcon: const Icon(
                  Icons.fingerprint,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreenToLogin(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
                child: Text(
                  'Login'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
