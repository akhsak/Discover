import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final guestNameController = TextEditingController();
  final guestNumberController = TextEditingController();
  final countryCodeController = TextEditingController(text: '+91');
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final idNumberController = TextEditingController();

  bool obscureText = true;

  idPasswordVisibility() {
    // setState(() {
    obscureText = !obscureText;
    notifyListeners();
    // });
  }
}
