
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                // ElevatedButton.icon(
                //   onPressed: () {
                //     // Handle Google sign-in
                //   },
                //   icon: Image.asset(
                //     'assets/Google.png', // Replace with Google icon URL
                //     height: screenHeight * 0.025,
                //   ),
                //   label: Text('Sign in with Google'),
                //   style: ElevatedButton.styleFrom(
                //     foregroundColor: Colors.black,
                //     backgroundColor: Colors.white,
                //     padding: EdgeInsets.symmetric(
                //         horizontal: screenWidth * 0.15,
                //         vertical: screenHeight * 0.025),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //   ),
                // ),ElevatedButton.icon(
                //   onPressed: () {
                //     // Handle Google sign-in
                //   },
                //   icon: Image.asset(
                //     'assets/phonecall-img.png', // Replace with Google icon URL
                //     height: screenHeight * 0.025,
                //   ),
                //   label: Text('Sign in with phone'),
                //   style: ElevatedButton.styleFrom(
                //     foregroundColor: Colors.black,
                //     backgroundColor: Colors.white,
                //     padding: EdgeInsets.symmetric(
                //         horizontal: screenWidth * 0.15,
                //         vertical: screenHeight * 0.025),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //   ),
                // ),
              SizedBox(height: screenHeight * 0.02),

                TextButton.icon(
                  onPressed: () {
                    // Handle Google sign-in
                  },
                  icon: Image.asset(
                    'assets/Google.png', // Replace with Google icon URL
                    height: screenHeight * 0.025,
                  ),
                  label: Text('Sign in with Google'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: screenWidth * 0.15,
                    //     vertical: screenHeight * 0.025),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(16),
                    // ),
                  ),
                ),
               // SizedBox(height: screenHeight * 0.02),
                TextButton.icon(
                  onPressed: () {
                    // Handle phone sign-in
                  },
                  icon: Image.asset(
                    'assets/phonecall-img.png', // Replace with phone icon URL
                    height: screenHeight * 0.025,
                  ),
                  label: Text('Sign in with phone'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,

                  ),
                ),

              //  Padding(
              //     padding: const EdgeInsets.only(left: 120),
              //     child: Row(
              //       children: [
              //         IconButton(
              //             onPressed: () {}, 
              //             icon: Image.asset(
              //               'assets/Google.png',
              //               height: screenHeight * 0.050,
              //             )),
              //             SizedBox(width: 30,),
              //         IconButton(
              //             onPressed: () {},
              //             icon: Image.asset(
              //               'assets/phonecall-img.png',
              //               height: screenHeight * 0.050,
              //             ))
              //       ],
              //     ),
              //   ),
               // SizedBox(height: screenHeight * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Doesn't have an account on Discover?",
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
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
