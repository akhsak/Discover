// // import 'package:country_picker/country_picker.dart';
// // import 'package:discover/service/authontication.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class AuthenticationProvider extends ChangeNotifier {
// //   TextEditingController userNameController = TextEditingController();
// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController passwordController = TextEditingController();
// //   TextEditingController confirmPasswordController = TextEditingController();

// //   TextEditingController signInEmailController = TextEditingController();
// //   TextEditingController signInPasswordController = TextEditingController();

// //   TextEditingController fullNameController = TextEditingController();
// //   TextEditingController ageController = TextEditingController();
// //   TextEditingController profileEmailController = TextEditingController();
// //   TextEditingController phoneNumberController = TextEditingController();
// //   TextEditingController genderController = TextEditingController();

// //   TextEditingController phoneController = TextEditingController();
// //   TextEditingController otpController = TextEditingController();

// //   final otpFormkey = GlobalKey<FormState>();
// //   final phoneFormkey = GlobalKey<FormState>();
// //   final signInFormkey = GlobalKey<FormState>();
// //   final doctorAddFormKey = GlobalKey<FormState>();
// //   final fillAccountFormkey = GlobalKey<FormState>();
// //   final createAccountFormkey = GlobalKey<FormState>();
// //   final forgotPasswordFormkey = GlobalKey<FormState>();

// //   final AuthenticationService authenticationService = AuthenticationService();

// //   Country selectCountry = Country(
// //       phoneCode: '91',
// //       countryCode: "IN",
// //       e164Sc: 0,
// //       geographic: true,
// //       level: 1,
// //       name: "INDIA",
// //       example: "INDIA",
// //       displayName: "INDIA",
// //       displayNameNoCountryCode: "IN",
// //       e164Key: "");

// //   void notifyCountryChanged() {
// //     notifyListeners();
// //   }

// //   bool showOtpField = false;

// //   void showOtpFieldTrue() {
// //     showOtpField = true;
// //     notifyListeners();
// //   }

// //   // String? selectedGender;
// //   // List<String> genders = ['Male', 'Female'];

// //   bool signInObscureText = true;
// //   void signInObscureChange() {
// //     signInObscureText = !signInObscureText;
// //     notifyListeners();
// //   }

// //   bool createAccountObscureText = true;
// //   void createAccountObscureChange() {
// //     createAccountObscureText = !createAccountObscureText;
// //     notifyListeners();
// //   }

// //   bool createAccountConfirmObscureText = true;
// //   void createAccountConfirmObscureChange() {
// //     createAccountConfirmObscureText = !createAccountConfirmObscureText;
// //     notifyListeners();
// //   }

// //   // adminKey(context, SnackBarWidget snackBarWidget, {String? message}) async {
// //   //   try {
// //   //     if (signInEmailController.text == 'medHeal@gmail.com' &&
// //   //         signInPasswordController.text == '12345') {
// //   //       Navigator.pushAndRemoveUntil(
// //   //           context,
// //   //           MaterialPageRoute(builder: (context) => const AdminBottomBar()),
// //   //           (route) => false);
// //   //       clearSignInControllers();
// //   //     } else {
// //   //       await emailSignIn(
// //   //           signInEmailController.text, signInPasswordController.text);
// //   //       Navigator.pushAndRemoveUntil(
// //   //           context,
// //   //           MaterialPageRoute(builder: (context) => const UserBottomBar()),
// //   //           (route) => false);
// //   //       clearSignInControllers();
// //   //     }
// //   //   } catch (error) {
// //   //     snackBarWidget.showErrorSnackbar(context, message!);
// //   //   }
// //   // }

// //   void deniedAdminKey() {
// //     emailController.text == 'medheal';
// //   }

// //   void clearSignInControllers() {
// //     signInEmailController.clear();
// //     signInPasswordController.clear();
// //   }

// //   void clearCreateAccountControllers() {
// //     userNameController.clear();
// //     emailController.clear();
// //     passwordController.clear();
// //     confirmPasswordController.clear();
// //   }

// //   void clearFillProfileControllers() {
// //     fullNameController.clear();
// //     ageController.clear();
// //     profileEmailController.clear();
// //     phoneNumberController.clear();
// //     genderController.clear();
// //   }

// //   void clearPhoneVerificationController() {
// //     phoneController.clear();
// //     otpController.clear();
// //   }

// //   Future<UserCredential> accountCreate(String email, String password) async {
// //     return await authenticationService.userEmailCreate(email, password);
// //   }

// //   Future<UserCredential> emailSignIn(String email, String password) async {
// //     return await authenticationService.userEmailSignIn(email, password);
// //   }

// //   Future<void> logOut() async {
// //     await authenticationService.logOut();
// //   }

// //   Future<void> googleSignIn() async {
// //     await authenticationService.googleSignIn();
// //     notifyListeners();
// //   }

// //   Future<void> googleSignOut() async {
// //     await authenticationService.googleSignOut();
// //     notifyListeners();
// //   }

// //   Future<void> getOtp(phoneNumber) async {
// //     await authenticationService.getOtp(phoneNumber);
// //     notifyListeners();
// //   }

// //   Future<void> verifyOtp(otp, context, {error}) async {
// //     await authenticationService.verifyOtp(otp, context, error);
// //     notifyListeners();
// //   }

// //   Future<void> forgotPassword(context, {email}) async {
// //     authenticationService.passwordReset(email: email, context: context);
// //   }
// // }

// import 'dart:developer';

// import 'package:discover/service/authontication.dart';
// import 'package:discover/widgets/bottombar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// // Import your bottom bar screen

// class LoginProvider extends ChangeNotifier {
//   final TextEditingController emailControler = TextEditingController();
//   final TextEditingController passwordControler = TextEditingController();
//   final AuthenticationService authenticationService = AuthenticationService();
//   bool passwordVisible = false;

//   void togglePasswordVisibility() {
//     passwordVisible = !passwordVisible;
//     notifyListeners();
//   }

//   void signInWithEmailAndPassword(BuildContext context) async {
//     showDialog(
//       context: context,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       await authenticationService.signInWithEmailAndPassword(
//           emailControler.text, passwordControler.text);

//       if (context.mounted) Navigator.pop(context);

//       // Navigate to the bottom bar screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 BottomScreen()), // Replace with your bottom bar screen
//       );
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       displayMessage(e.code, context);
//     }
//   }

//   Future<void> signInWithGoogle(BuildContext context) async {
//     try {
//       await authenticationService.signInWithGoogle();
//       notifyListeners();

//       // Navigate to the bottom bar screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => BottomScreen()),
//       );
//     } catch (e) {
//       log(e.toString());
//       displayMessage(e.toString(), context);
//     }
//   }

//   void displayMessage(String message, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(message),
//       ),
//     );
//   }

//   void clear() {[]
//     emailControler.clear();
//     passwordControler.clear();
//   }
// }

// import 'dart:developer';

// import 'package:discover/service/authontication.dart';
// import 'package:discover/widgets/bottombar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthenProvider with ChangeNotifier {
//   final createEmailController = TextEditingController();
//   final createPasswordController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//    final formKey = GlobalKey<FormState>();
//   final fullNameController = TextEditingController();
//   // final ageController = TextEditingController();
//   // final countryCodeController = TextEditingController();
//   // final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   final AuthenticationService authenticationService = AuthenticationService();

//   bool obscureText = true;
//   String? emailError;
//   String? passwordError;
//     final otpFormKey = GlobalKey<FormState>();

//   // TextEditingController get emailController => _emailController;
//   // TextEditingController get passwordController => _passwordController;

//   //  void clearAdminController() {
//   //   adminController.clear();
//   //   adminPassController.clear();
//   // }

//   void clearPhoneController() {
//     phoneController.clear();
//   }

//   void clearLoginControllers() {
//     createEmailController.clear();
//     createPasswordController.clear();
//   }

//   void clearSignupControllers() {
//     fullNameController.clear();
//     createEmailController.clear();
//     createPasswordController.clear();
//     //confirmPasswordController.clear();
//   }

//   void togglePasswordVisibility() {
//     obscureText = !obscureText;
//     notifyListeners();
//   }

//   void validateEmail(String value) {
//     if (value.isEmpty) {
//       emailError = 'Please enter your email';
//     } else if (!RegExp(r'^[\w-\.]+@gmail\.com$').hasMatch(value)) {
//       emailError = 'Please enter a valid @gmail.com email address';
//     } else {
//       emailError = null;
//     }
//     notifyListeners();
//   }

//   void validatePassword(String value) {
//     if (value.isEmpty) {
//       passwordError = 'Please enter your password';
//     } else {
//       passwordError = null;
//     }
//     notifyListeners();
//   }

//   Future<void> signInWithEmailAndPassword(BuildContext context) async {
//      showDialog(
//       context: context,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       await authenticationService.userEmailLogin(
//           createEmailController.text, createPasswordController.text);

//       if (context.mounted) Navigator.pop(context);

//       // Navigate to the bottom bar screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 BottomScreen()), // Replace with your bottom bar screen
//       );
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       displayMessage(e.code, context);
//     }
//   }

//    Future<void> logOut() async {
//     await authenticationService.logOut();
//   }

//   // Future<void> googleSignIn() async {
//   //   await authenticationService.googleSignIn();
//   //   notifyListeners();
//   // }

//   Future<void> googleSignOut() async {
//     await authenticationService.googleSignOut();
//     notifyListeners();
//   }

//   Future<void> googleSignIn(BuildContext context) async {
//     try {
//       await authenticationService.googleSignIn(context);
//       notifyListeners();

//       // Navigate to the bottom bar screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => BottomScreen()),
//       );
//     } catch (e) {
//       log(e.toString());
//       displayMessage(e.toString(), context);
//     }
//   }

//   void displayMessage(String message, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(message),
//       ),
//     );
//   }

//   void clearCreate() {[];
//     createEmailController.clear();
//     createPasswordController.clear();
//   }

//   void obscureChange() {
//     obscureText = !obscureText;
//     notifyListeners();
//   }

//   Future<void> getOtp(context, phoneCon) async {
//     await authenticationService.getOtp(context, phoneCon);
//     notifyListeners();
//   }

//   Future<void> verifyOtp(otp, context) async {
//     await authenticationService.verifyOtp(otp, context);
//     notifyListeners();
//   }

//   void getUserData() {}

//    signUp(context) async {
//     showDialog(
//       context: context,
//       builder: (context) => const Center(child: CircularProgressIndicator()),
//     );

// }

// Future<UserCredential> signupUser(String email, String password) async {
//     return await authenticationService.userEmailSignup(email, password);
//   }

//   Future<UserCredential> loginUser(String email, String password) async {
//     return await authenticationService.userEmailLogin(email, password);
//   }
//     // Your authentication logic here
// }

// // ignore_for_file: use_build_context_synchronously

// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rexparts/model/user_model.dart';
// import 'package:rexparts/service/auth_service.dart';
// import 'package:rexparts/view/bottom_bar/bottom_bar.dart';

// // Import your bottom bar screen

// class LoginProvider extends ChangeNotifier {
//   final TextEditingController emailControler = TextEditingController();
//   final TextEditingController passwordControler = TextEditingController();
//   final AuthenticationService authenticationService = AuthenticationService();
//   final AuthenticationService authService = AuthenticationService();
//   UserModel? currentUser;
//   bool passwordVisible = false;

//   void togglePasswordVisibility() {
//     passwordVisible = !passwordVisible;
//     notifyListeners();
//   }

//   void signInWithEmailAndPassword(BuildContext context) async {
//     showDialog(
//       context: context,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       await authenticationService.signInWithEmailAndPassword(
//           emailControler.text, passwordControler.text);

//       if (context.mounted) Navigator.pop(context);

//       // Navigate to the bottom bar screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 BottomNavBar()), // Replace with your bottom bar screen
//       );
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       displayMessage(e.code, context);
//     }
//   }

//   Future<void> signInWithGoogle(BuildContext context) async {
//     try {
//       await authenticationService.signInWithGoogle();
//       notifyListeners();

//       // Navigate to the bottom bar screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => BottomNavBar()),
//       );
//     } catch (e) {
//       log(e.toString());
//       displayMessage(e.toString(), context);
//     }
//   }

//   void displayMessage(String message, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(message),
//       ),
//     );
//   }

//   void clear() {
//     emailControler.clear();
//     passwordControler.clear();
//   }
// }

import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:discover/model/authontication_model.dart';
import 'package:discover/service/authontication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  TextEditingController userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final createEmailController = TextEditingController();
  final createPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  String? emailError;
  String? passwordError;
  bool obscureText = true;
  int currentIndex = 0;
  UserModel? currentUser;
  bool showPassword = true;
  bool showOtpField = false;
  Country selectCountry = Country(
      phoneCode: '91',
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "INDIA",
      example: "INDIA",
      displayName: "INDIA",
      displayNameNoCountryCode: "IN",
      e164Key: "");

  void clearPhoneController() {
    phoneController.clear();
  }

  void clearSignupControllers() {
    fullNameController.clear();
    createEmailController.clear();
    createPasswordController.clear();
    //confirmPasswordController.clear();
  }

  void clearLoginControllers() {
    createEmailController.clear();
    createPasswordController.clear();
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError = 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@gmail\.com$').hasMatch(value)) {
      emailError = 'Please enter a valid @gmail.com email address';
    } else {
      emailError = null;
    }
    notifyListeners();
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = 'Please enter your password';
    } else {
      passwordError = null;
    }
    notifyListeners();
  }

  Future<UserCredential> signupUser(String email, String password) async {
    return await authService.signUpWithEmail(email, password);
  }

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await authService.signUpWithEmail(email, password);
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await authService.signInWithEmail(email, password);
  }

  Future<void> signOutWithEmail() async {
    return await authService.signOutEmail();
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      await authService.signInWithGoogle(context);
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<void> googleSignOut() async {
    await authService.signOutWithGoogle();

    notifyListeners();
  }

  Future<void> getUser() async {
    currentUser = await authService.getCurrentUser();
    if (currentUser != null) {
      log(currentUser!.email!);
    }
    notifyListeners();
  }

  Future<void> togglePasswordVisibility() async {
    showPassword = !showPassword;
    notifyListeners();
  }

  // Future<void> getOtp(phoneNumber) async {
  //   await authService.getOtp(phoneNumber,phoneNumber );
  //   notifyListeners();
  // }

  // Future<void> verifyOtp(otp, context) async {
  //   await authService.verifyOtp(otp, context);
  //   notifyListeners();
  // }

  Future<void> getOtp(context, phoneCon) async {
    await authService.getOtp(context, phoneCon);
    notifyListeners();
  }

  Future<void> verifyOtp(otp, context) async {
    await authService.verifyOtp(otp, context);
    notifyListeners();
  }

  countrySelection(value) {
    selectCountry = value;
    notifyListeners();
  }

  Future<void> showOtp() async {
    showOtpField = true;
    notifyListeners();
  }

  Future clearControllers() async {
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    otpController.clear();
    notifyListeners();
  }

  onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
