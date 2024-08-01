import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/splash_screen_tologin.dart';

class SignUpform extends StatefulWidget {
  const SignUpform({
    super.key,
  });

  @override
  State<SignUpform> createState() => _SignUpformState();
}

class _SignUpformState extends State<SignUpform> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('Full Name'),
                prefixIcon: Icon(Icons.person_2_outlined),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: mailController,
              decoration: const InputDecoration(
                label: Text('E-Mail'),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                label: Text('Phone No.'),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                label: const Text('Password'),
                prefixIcon: const Icon(Icons.fingerprint_outlined),
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
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
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
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: Text(
                  'Sign Up'.toUpperCase(),
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
