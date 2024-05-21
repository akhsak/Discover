

// import 'package:discover/view/user/Login/create_account.dart';
// import 'package:discover/view/user/Login/forget_pswrd/forget.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   bool _obscureText = true;
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 60), // To simulate the status bar space
//                 Center(
//                   child: Image.asset(
//                     'assets/icon_color.png', // Replace with your logo URL
//                     height: 100,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Welcome to Discover',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Please choose your login option below',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     hintText: 'Enter your email address',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     } else if (!RegExp(r'^[\w-\.]+@gmail\.com$')
//                         .hasMatch(value)) {
//                       return 'Please enter a valid @gmail.com email address';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: _obscureText,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     hintText: 'Enter your password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscureText ? Icons.visibility : Icons.visibility_off,
//                       ),
//                       onPressed: _togglePasswordVisibility,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));

//                     },
//                     child: Text(
//                       'Forgot password?',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 9, 122, 215),
//                         decoration: TextDecoration.underline,
//                         decorationColor: Color.fromARGB(255, 9, 122, 215),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Handle login
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     padding: EdgeInsets.symmetric(horizontal: 170, vertical: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         thickness: 1,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Text(
//                         'Or login with',
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 118, 114, 114)),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         thickness: 1,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30),
//                 // Row(
//                 //   children: [
//                 //     Image.asset('assets/Google.png'),
//                 //     TextButton(onPressed: (){}, child:Text('Sign in with Google'))
//                 //   ],

//                 // ),
//                 ElevatedButton.icon(
//                   onPressed: () {

//                     // Handle Google sign-in
//                   },
//                   icon: Image.asset(
//                     'assets/Google.png', // Replace with Google icon URL
//                     height: 20,
//                   ),
//                   label: Text('Sign in with Google'),
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       // side: BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Padding(
//                   padding: const EdgeInsets.all(13),
//                   child: Row(
//                     children: [
//                       Text("Doesn't have an account on Discover?",style: TextStyle(fontSize: 13),),
//                       TextButton(onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
//                       }, child: Text('Create Account',style: TextStyle(color: Colors.black,fontSize: 13),))
//                     ],
//                   ),
//                 ),
              
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
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
                SizedBox(height: screenHeight * 0.1), // To simulate the status bar space
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@gmail\.com$')
                        .hasMatch(value)) {
                      return 'Please enter a valid @gmail.com email address';
                    }
                    return null;
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
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
                    if (_formKey.currentState!.validate()) {
                      // Handle login
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.4, vertical: screenHeight * 0.025),
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
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
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
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Google sign-in
                  },
                  icon: Image.asset(
                    'assets/Google.png', // Replace with Google icon URL
                    height: screenHeight * 0.025,
                  ),
                  label: Text('Sign in with Google'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15, vertical: screenHeight * 0.025),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Doesn't have an account on Discover?",
                     // style: TextStyle(fontSize: screenHeight * 0.018),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
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


