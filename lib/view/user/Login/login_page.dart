import 'package:discover/view/user/Login/create_account.dart';
import 'package:discover/view/user/Login/forget_pswrd/forget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = 'Please enter your email';
      } else if (!RegExp(r'^[\w-\.]+@gmail\.com$').hasMatch(value)) {
        _emailError = 'Please enter a valid @gmail.com email address';
      } else {
        _emailError = null;
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordError = 'Please enter your password';
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height:
                        screenHeight * 0.1), // To simulate the status bar space
                Center(
                  child: Image.asset(
                    'assets/icon_color.png', // Replace with your logo URL
                    height: screenHeight * 0.12,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Welcome to Discover',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Please choose your login option below',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorText: _emailError,
                  ),
                  onChanged: (value) {
                    _validateEmail(value);
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                    errorText: _passwordError,
                  ),
                  onChanged: (value) {
                    _validatePassword(value);
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 9, 122, 215),
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 9, 122, 215),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _emailError == null &&
                        _passwordError == null) {
                      // Handle login
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.4,
                        vertical: screenHeight * 0.025),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Text(
                        'Or login with',
                        style: TextStyle(
                          color: Color.fromARGB(255, 118, 114, 114),
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Google sign-in
                      },
                      icon: Image.asset(
                        'assets/Google.png', // Replace with Google icon URL
                        height: screenHeight * 0.025,
                      ),
                      label: Text('Google'),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.02),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: BorderSide(color: Colors.grey)),
                    ),
                    SizedBox(
                        width: screenWidth *
                            0.02), // Adjust the width to reduce space
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle phone sign-in
                      },
                      icon: Image.asset(
                        'assets/phonecall-img.png', // Replace with phone icon URL
                        height: screenHeight * 0.025,
                      ),
                      label: Text('Phone'),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.02),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          side: BorderSide(color: Colors.grey)),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.only(
                      // left: screenWidth * 0.03,
                      // right: screenWidth * 0.4,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Doesn't have an account on Discover?",
                        style: TextStyle(fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
