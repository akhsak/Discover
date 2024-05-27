import 'package:discover/controller/authontication_provider.dart';
import 'package:discover/controller/create_account_provider.dart';
import 'package:discover/view/user/Login/login_page.dart';
import 'package:discover/view/user/Login/success_create.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatelessWidget {
    bool isLoading = false;

   CreateAccount({super.key});

  // final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      final createprovider=Provider.of<AuthenProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: createprovider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Get the best out of derleng by creating an account',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller:createprovider.fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
               
                SizedBox(height: 10),
                Row(
                  children: [
                    // Container(
                    //   width: 80,
                    //   child: TextFormField(
                    //     controller:createprovider.countryCodeController,
                    //     decoration: InputDecoration(
                    //       labelText: '+91',
                    //       border: OutlineInputBorder(),
                    //     ),
                    //     // validator: (value) {
                    //     //   if (value == null || value.isEmpty) {
                    //     //     return 'Please enter country code';
                    //     //   }
                    //     //   return null;
                    //     // },
                    //   ),
                    // ),
                    SizedBox(width: 10),
                    // Expanded(
                    //   child: TextFormField(
                    //     controller:createprovider.phoneController,
                    //     decoration: InputDecoration(
                    //       labelText: 'Phone',
                    //       border: OutlineInputBorder(),
                    //     ),
                    //     validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         return 'Please enter your phone number';
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                 SizedBox(height: 10),
                // TextFormField(
                //   controller:createprovider.ageController,
                //   decoration: InputDecoration(
                //     labelText: 'Age',
                //     border: OutlineInputBorder(),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter your age';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 10),
                TextFormField(
                  controller:createprovider.createEmailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@gmail\.com$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  
                  controller:createprovider.createPasswordController,
                  obscureText:createprovider. obscureText,
                  decoration: InputDecoration(
                    prefixIcon:const Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                       createprovider. obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed:createprovider. togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () async{
                         if (createprovider.formKey.currentState!
                                .validate()) {
                              try {
                               {
                                  await createprovider.signupUser(
                                      createprovider.createEmailController.text,
                                      createprovider
                                          .createPasswordController.text);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SuccessAccount()));

                                  createprovider.clearSignupControllers();
                                  SnackBarWidget().showSuccessSnackbar(
                                      context, 'Registration success');
                                } 
                              } catch (e) {
                                SnackBarWidget().showErrorSnackbar(context,
                                    'Already existed E-mail or invalid E-mail');
                              }
                            }
                       //if (
                        // createprovider.formKey.currentState?.validate() ?? false
                        // ) {
                        // //   // Handle account creation logic
                        //  }
                       // Navigator.push(context, MaterialPageRoute(builder: ((context) =>SuccessAccount() )));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      Text("Already have an account?"),
                      TextButton(onPressed: (){
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      }, child: Text('sign in',style: TextStyle(color: Colors.black),))
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


