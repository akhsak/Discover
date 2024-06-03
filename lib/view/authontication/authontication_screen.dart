import 'package:discover/view/authontication/Login/login_page.dart';
import 'package:discover/widgets/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: currentUser != null ? UserBottomScreen() : const LoginScreen(),
    );
  }
}
