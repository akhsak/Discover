// // import 'dart:developer';
// // import 'package:discover/widgets/bottombar.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:google_sign_in/google_sign_in.dart';

// // class AuthenticationService {
// //   String collection = 'user';
// //   String? verificationid;

// //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// //   FirebaseFirestore fireStore = FirebaseFirestore.instance;

// //   Future<UserCredential> userEmailCreate(String email, String password) async {
// //     try {
// //       UserCredential userCredential = await firebaseAuth
// //           .createUserWithEmailAndPassword(email: email, password: password);
// //       log('Account created');

// //       return userCredential;
// //     } catch (error) {
// //       log('error got in creating account $error ');
// //       rethrow;
// //     }
// //   }

// //   Future<UserCredential> userEmailSignIn(String email, String password) async {
// //     try {
// //       UserCredential userCredential = await firebaseAuth
// //           .signInWithEmailAndPassword(email: email, password: password);
// //       log('Signed In');
// //       return userCredential;
// //     } on FirebaseAuthMultiFactorException catch (error) {
// //       throw Exception(error.code);
// //     }
// //   }

// //   Future<void> logOut() async {
// //     await firebaseAuth.signOut();
// //   }

// //   Future<void> googleSignIn() async {
// //     try {
// //       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
// //       final GoogleSignInAuthentication? googleAuth =
// //           await googleUser?.authentication;

// //       if (googleAuth == null) {
// //         log('Google authentication failed');
// //         throw Exception('Google authentication failed');
// //       }

// //       final credential = GoogleAuthProvider.credential(
// //         accessToken: googleAuth.accessToken,
// //         idToken: googleAuth.idToken,
// //       );

// //       final UserCredential userCredential =
// //           await FirebaseAuth.instance.signInWithCredential(credential);

// //       final User? guser = userCredential.user;
// //       log("${guser?.displayName}");
// //     } catch (error) {
// //       log('Google SignIn error : $error');
// //       rethrow;
// //     }
// //   }

// //   Future googleSignOut() async {
// //     return await GoogleSignIn().signOut();
// //   }

// //   Future<void> getOtp(String phoneNumber) async {
// //     try {
// //       await firebaseAuth.verifyPhoneNumber(
// //         phoneNumber: phoneNumber,
// //         verificationCompleted: (phoneAuthCredential) async {
// //           await firebaseAuth.signInWithCredential(phoneAuthCredential);
// //           User? user = FirebaseAuth.instance.currentUser;
// //           if (user != null) {
// //             await user.updatePhoneNumber(phoneAuthCredential);
// //           }
// //         },
// //         verificationFailed: (error) {
// //           log("verification failed error : $error");
// //         },
// //         codeSent: (verificationId, forceResendingToken) {
// //           verificationid = verificationId;
// //         },
// //         codeAutoRetrievalTimeout: (verificationId) {
// //           verificationid = verificationId;
// //         },
// //         timeout: const Duration(seconds: 60),
// //       );
// //     } catch (e) {
// //       log("sign in error : $e");
// //     }
// //   }

// //   Future<PhoneAuthCredential?> verifyOtp(
// //       otp, context, Function? snackBarError) async {
// //     try {
// //       log('message');
// //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
// //           verificationId: verificationid!, smsCode: otp);
// //       await firebaseAuth.signInWithCredential(credential);
// //       log('message');
// //       Navigator.pushAndRemoveUntil(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) =>BottomScreen(),
// //           ),
// //           (route) => false);
// //     } catch (e) {
// //       snackBarError;
// //       log("verify otp error $e");
// //       return null;
// //     }
// //     return null;
// //   }

// //   void passwordReset({required email, context}) async {
// //     try {
// //       log('start');
// //       await firebaseAuth.sendPasswordResetEmail(email: email);
// //       log('success');
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Password reset email sent"),
// //         ),
// //       );
// //     } on FirebaseAuthException catch (e) {
// //       log('error occure');
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text(
// //             e.message.toString(),
// //           ),
// //         ),
// //       );
// //     }
// //   }

// //   // updateUser(userid, UserModel data) async {
// //   //   try {
// //   //     await user.doc(userid).update(data.toJson());
// //   //   } catch (e) {
// //   //     log("error in updating product : $e");
// //   //   }
// //   // }
// // }

// // import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthenticationService {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<UserCredential> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException {
//       rethrow;
//     }
//   }

//   Future<UserCredential> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth.accessToken,
//         idToken: gAuth.idToken,
//       );
//       return await firebaseAuth.signInWithCredential(credential);
//     } catch (e) {
//       rethrow;
//     }
//   }

// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

// import 'dart:developer';
// import 'package:discover/view/authontication/otp_screen.dart';
// import 'package:discover/widgets/bottombar.dart';
// import 'package:discover/widgets/snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthenticationService {
//   String collection = 'user';
//   String? verificationid;
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<UserCredential> userEmailSignup(String email, String password) async {
//     try {
//       UserCredential userCredential = await firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       log('Account created');

//       return userCredential;
//     } catch (e) {
//       log('error got with : $e');
//       rethrow;
//     }
//   }

//   Future<UserCredential> userEmailLogin(String email, String password) async {
//     try {
//       UserCredential userCredential = await firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//       log('user loged in');
//       return userCredential;
//     } on FirebaseAuthMultiFactorException catch (e) {
//       throw Exception(e.code);
//     }
//   }

//   Future<void> logOut() async {
//     await firebaseAuth.signOut();
//   }

//   Future<void> googleSignIn(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       if (googleAuth == null) {
//         log('Google authentication failed');
//         throw Exception('Google authentication failed');
//       }

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       final User? guser = userCredential.user;
//       log("${guser?.displayName}");
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomScreen()));
//     } catch (e) {
//       log('Google Sign-In Error: $e');
//       rethrow;
//     }
//   }

//   Future googleSignOut() async {
//     return await GoogleSignIn().signOut();
//   }

//   Future<void> getOtp(context, phoneNumberCon) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         verificationCompleted: (PhoneAuthCredential credential) {},
//         verificationFailed: (FirebaseAuthException ex) {},
//         codeSent: (String verificationId, int? resendtoken) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => OtpScreen(
//                         verificationId: verificationId,
//                       )));
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//         phoneNumber: phoneNumberCon);
//   }

//   Future<PhoneAuthCredential?> verifyOtp(String otp, context) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationid!, smsCode: otp);

//       await firebaseAuth.signInWithCredential(credential);
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BottomScreen(),
//           ),
//           (route) => false);
//       SnackBarWidget().showSuccessSnackbar(context, "OTP validated");
//     } catch (e) {
//       log("verify otp error $e");
//       return null;
//     }
//     return null;
//   }
// }

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discover/model/authontication_model.dart';
import 'package:discover/widgets/bottombar.dart';
import 'package:discover/widgets/popup_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  String? verificationid;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String collection = 'User';
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<UserModel> user;

  AuthService() {
    user = FirebaseFirestore.instance
        .collection(collection)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(
          snapshot.data()!,
        );
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  Future<void> addUser(UserModel data) async {
    try {
      if (firebaseAuth.currentUser != null) {
        await user.doc(firebaseAuth.currentUser!.uid).set(data);
      } else {
        throw Exception('No current user found');
      }
    } catch (e) {
      log('Error adding post :$e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      if (firebaseAuth.currentUser == null) {
        throw Exception('No current user found');
      }
      final snapshot = await firestore
          .collection(collection)
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      if (snapshot.exists && snapshot.data() != null) {
        return UserModel.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      log('Error getting current user: $e');
      throw e;
    }
  }

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Account created');
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('User logged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOutEmail() async {
    await firebaseAuth.signOut();
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? guser = userCredential.user;
      log("User display Name: ${guser?.displayName}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomScreen()));
      return guser;
    } catch (e) {
      log('Google Sign-In Error: $e');
      throw e;
    }
  }

  Future<void> signOutWithGoogle() async {
    await GoogleSignIn().signOut();
  }

  Future<void> getOtp(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            await user.updatePhoneNumber(phoneAuthCredential);
          }
        },
        verificationFailed: (error) {
          log("verification failed error : $error");
        },
        codeSent: (verificationId, forceResendingToken) {
          verificationid = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationid = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      log("sign in error : $e");
    }
  }

  Future<PhoneAuthCredential?> verifyOtp(String otp, context) async {
    try {
      if (verificationid == null) {
        throw Exception('Verification ID is null');
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationid!, smsCode: otp);
      await firebaseAuth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomScreen()),
        (route) => false,
      );
      PopupWidgets().showSuccessSnackbar(context, "OTP Validated");
    } catch (e) {
      PopupWidgets().showErrorSnackbar(context, "Invalid OTP");
      log("verify otp error $e");
      return null;
    }
    return null;
  }
}
