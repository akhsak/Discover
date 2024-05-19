// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CreateAccount extends StatefulWidget {
//   const CreateAccount({super.key});

//   @override
//   State<CreateAccount> createState() => _CreateAccountState();
// }

// class _CreateAccountState extends State<CreateAccount> {
//     final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Create Account',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Get the best out of derleng by creating an account',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Full name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter guest name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Age',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter Age';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Container(
//                       width: 80,
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           prefixText: '+91',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter country code';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Phone',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Phone number';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.visibility),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter Password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 50),
                
//                 SizedBox(
//                   width: 200,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() ?? false) {}
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => BookingSucsess()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 70, vertical: 20),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     child: Text(
//                       'Create Account',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                      SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
//                     },
//                     child: Text.rich(
//                       TextSpan(
//                         text: "Doesn't have an account on Discover? ",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 118, 114, 114),
//                             fontSize: 11),
//                         children: [
//                           TextSpan(
//                             text: 'Create Account',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

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

import 'package:discover/view/user/Login/success_create.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _countryCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
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
                  controller: _fullNameController,
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
                    Container(
                      width: 80,
                      child: TextFormField(
                        controller: _countryCodeController,
                        decoration: InputDecoration(
                          prefixText: '+91',
                          border: OutlineInputBorder(),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter country code';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 10),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
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
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
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
                SizedBox(height: 50),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState?.validate() ?? false) {
                      //   // Handle account creation logic
                      // }
                      Navigator.push(context, MaterialPageRoute(builder: ((context) =>SuccessAccount() )));
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
                //SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        // Navigate to create account screen
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 118, 114, 114),
                            fontSize: 11,
                          ),
                          children: [
                            TextSpan(
                              text: 'sign in',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
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


