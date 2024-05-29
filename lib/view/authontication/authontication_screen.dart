// import 'package:discover/view/user/Login/login_page.dart';
// import 'package:discover/widgets/bottombar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           // user is logged in
//           if (snapshot.hasData) {
//             return BottomScreen();
//           } else {
//             //user not logged in
//             return const LoginScreen();
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:discover/view/user/Login/login_page.dart';
// import 'package:discover/widgets/bottombar.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthenticationNavigate extends StatelessWidget {
//   const AuthenticationNavigate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     return Scaffold(
//       body: currentUser != null ? BottomScreen() : const LoginScreen(),
//     );
//   }
// }

import 'package:discover/view/user/Login/login_page.dart';
import 'package:discover/widgets/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
   // return Scaffold(
      // body: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     // user is logged in
      //     if (snapshot.hasData) {
      //       return BottomScreen();
      //     } else {
      //       //user not logged in
      //       return const LoginScreen();
      //     }
      //   },
      // ),




  //  );
   User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: currentUser != null ? BottomScreen() : const LoginScreen(),
    );
  }
}
