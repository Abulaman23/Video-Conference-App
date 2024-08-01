import 'package:flutter/material.dart';
import 'package:video_conference_app/screens/login_screen_2.dart';
import 'package:video_conference_app/screens/signup_screen_2.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDark = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? Colors.black87 : Colors.white,
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: const AssetImage('assets/images/welcome_screen.jpg'),
                height: size.height * 0.45,
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'All Your Meetings, One App',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    'Organize, schedule, and join meetings from a single app.',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen2(),
                          ),
                        );
                      },
                      child: Text('Login'.toUpperCase()),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen2(),
                          ),
                        );
                      },
                      child: Text('Signup'.toUpperCase()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
