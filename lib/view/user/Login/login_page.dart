import 'package:discover/controller/authentication_provider.dart';
import 'package:discover/view/authontication/phone.dart';
import 'package:discover/widgets/bottombar.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_account.dart';
import 'forget_pswrd/forget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context, listen: false);
    // Get the screen size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Form(
            key: GlobalKey<FormState>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(
                  child: Image.asset(
                    'assets/icon_color.png',
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
                Consumer<LoginProvider>(
                  builder: (context, authProvider, child) {
                    return Column(
                      children: [
                        TextFormField(
                          controller: authProvider.createEmailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorText: authProvider.emailError,
                          ),
                          onChanged: authProvider.validateEmail,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          controller: authProvider.createPasswordController,
                          obscureText: authProvider.obscureText,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(authProvider.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: authProvider.togglePasswordVisibility,
                            ),
                            errorText: authProvider.passwordError,
                          ),
                          onChanged: authProvider.validatePassword,
                        ),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
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
                    if (authProvider.formKey.currentState!.validate()) {
                      try {
                        authProvider.signInWithEmail(
                            authProvider.emailController.text,
                            authProvider.passwordController.text);

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomScreen()),
                            (route) => false);
                        SnackBarWidget()
                            .showSuccessSnackbar(context, 'login successfull');
                        authProvider.clearLoginControllers();
                      } catch (e) {
                        SnackBarWidget().showErrorSnackbar(
                            context, 'Email or Password is incorrect');
                      }
                    }

                    // final authProvider = context.read<AuthenProvider>();
                    // if (authProvider.emailError == null &&
                    //     authProvider.passwordError == null) {
                    //   authProvider.signInWithEmailAndPassword(context);
                    //   authProvider.clearCreate();
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.4,
                      vertical: screenHeight * 0.025,
                    ),
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
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        authProvider.googleSignIn(context);
                        // Handle Google sign-in
                      },
                      icon: Image.asset(
                        'assets/Google.png',
                        height: screenHeight * 0.025,
                      ),
                      label: Text('   Google   '),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.09,
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    ElevatedButton.icon(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneScreen()));
                        //  authProvider.
                        // Handle phone sign-in
                      },
                      icon: Image.asset(
                        'assets/phonecall-img.png',
                        height: screenHeight * 0.023,
                      ),
                      label: Text('    Phone    '),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.09,
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.only(),
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
                              builder: (context) => CreateAccount(),
                            ),
                          );
                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
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
