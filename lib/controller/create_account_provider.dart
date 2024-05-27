// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CreateAccountProvider extends ChangeNotifier  {

//   final formKey = GlobalKey<FormState>();
//   bool obscureText = true;
//   final fullNameController = TextEditingController();
//   // final ageController = TextEditingController();
//   // final countryCodeController = TextEditingController();
//   // final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();



//    signUp(context) async {
//     showDialog(
//       context: context,
//       builder: (context) => const Center(child: CircularProgressIndicator()),
//     );
//     //make sure password match
//     // if (passwordController.text) {
//     //   // Navigator.pop(context);
//     //   //show error to user
//     //   displayMessage('Passwords don\'t match', context);
//     //   notifyListeners();
//     //   return;
//     // }

//     try {
//       //create the user
//       // UserCredential userCredential = await FirebaseAuth.instance
//       //     .createUserWithEmailAndPassword(
//       //         email: emailController.text, password: passwordController.text);

//       // after creating the user, create a new document in cloud firestore called Users
//       // FirebaseFirestore.instance
//       //     .collection('Users')
//       //     .doc(userCredential.user!.email)
//       //     .set({
//       //   'username': emailController.text.split('@')[0], //initial username
//       //   'bio': 'empty bio' //initially empty bio
//       //   //add any additional; fields as needed
//       // });
//       // notifyListeners();

//       //pop loading circle
//       if (context.mounted) Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       //pop loading circle
//       Navigator.pop(context);
//       //show error to user
//       displayMessage(e.code, context);
//       notifyListeners();
//     }
//     notifyListeners();
//   }

//   //display dialogue message to user
//   void displayMessage(String message, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(message),
//       ),
//     );
//     notifyListeners();
//   }

//   void togglePasswordVisibility() {
//    // setState(() {
//       obscureText = !obscureText;
//   //  });
//   }

//    void clear() {
//     fullNameController.clear();
//     emailController.clear();
//     passwordController.clear();
//    // conformPasswordController.clear();
//   }
  
// }