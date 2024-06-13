import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:discover/model/authontication_model.dart';
import 'package:discover/service/authontication.dart';
import 'package:discover/widgets/admint_bottombar.dart';
import 'package:discover/widgets/bottombar.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  TextEditingController userNameController = TextEditingController();
  final createFullNameController = TextEditingController();
  final createEmailController = TextEditingController();
  final createPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController createAgeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final createFormKey = GlobalKey<FormState>();

  final otpFormKey = GlobalKey<FormState>();
  final forgotPasswordFormkey = GlobalKey<FormState>();
  bool isAdminHome = false;

  String? emailError;
  String? passwordError;
  // bool obscureText = true;
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

  bool loginObscureText = true;
  void loginObscureTextchange() {
    loginObscureText = !loginObscureText;
    notifyListeners();
  }

  bool createObscureText = true;
  void createObscureTextchange() {
    createObscureText = !createObscureText;
    notifyListeners();
  }

  Future<void> forgotPassword(context, {email}) async {
    authService.passwordReset(email: email, context: context);
  }

  void clearPhoneController() {
    phoneController.clear();
  }

  void clearOtpController() {
    otpController.clear();
  }

  void clearSignupControllers() {
    createFullNameController.clear();
    createEmailController.clear();
    createPasswordController.clear();
    createAgeController.clear();
    phoneController.clear();
  }

  void clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
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

  Future<UserCredential> loginWithEmail(String email, String password) async {
    return await authService.signInWithEmail(email, password);
  }

  // Future<void> signOutWithEmail() async {
  //   return await authService.signOutEmail();
  // }

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
    loginEmailController.clear();
    loginPasswordController.clear();
    createAgeController.clear();
    phoneController.clear();
    otpController.clear();
    notifyListeners();
  }

  onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  adminKey(context, SnackBarWidget snackBarWidget, {String? message}) async {
    try {
      if (loginEmailController.text == 'discover@gmail.com' &&
          loginPasswordController.text == '12345') {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AdminBottomBar()),
            (route) => false);
        clearControllers();
      } else {
        await loginWithEmail(
            loginEmailController.text, loginPasswordController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => UserBottomScreen()),
            (route) => false);
        clearControllers();
      }
    } catch (error) {
      snackBarWidget.showErrorSnackbar(context, message!);
    }
  }
}
