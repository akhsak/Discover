// import 'package:discover/controller/authentication_provider.dart';
// import 'package:discover/view/authontication/Login/login_page.dart';
// import 'package:discover/widgets/admint_bottombar.dart';
// import 'package:discover/widgets/snackbar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AdminProfileScreen extends StatelessWidget {
//   const AdminProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final authProvider = Provider.of<LoginProvider>(context, listen: false);

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: size.width * 0.7,
//             height: 60,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.black,
//                 backgroundColor: Colors.white,
//                 side: BorderSide(color: Color.fromARGB(255, 5, 4, 4)),
//               ),
//               onPressed: () {
//                 alertSheet(
//                   context,
//                   alertMessage: 'ARE YOU SURE TO LOGOUT ?',
//                   onPressed: () async {
//                     authProvider.googleSignOut();
//                     //bottomProvider.setInitIndex(0);
//                     await FirebaseAuth.instance.signOut();

//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginScreen(),
//                       ),
//                       (route) => false,
//                     );
//                     // AdminBottomBar.currentIndex = 0;
//                   },
//                   confirmButtonLabel: 'LOGOUT',
//                 );
//               },
//               child: const Text(
//                 'Logout',
//                 style: TextStyle(decoration: TextDecoration.underline),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
