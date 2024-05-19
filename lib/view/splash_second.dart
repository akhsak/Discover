import 'package:discover/view/welcome_screen1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/splash_icon.png'),
            
          )),
        ),
      ),
    );
  }

  Future<void> login() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return const WelcomeScreen1();
        },
      ),
    );
  }
}
