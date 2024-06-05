// import 'dart:developer';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:discover/model/admin_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class TravelService {
//   String travelPackages = 'Travel';
//   late CollectionReference<AdminModel> travel;
//   final ImagePicker imagePicker = ImagePicker();
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   Reference storage = FirebaseStorage.instance.ref();
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   TravelService() {
//     travel = firebaseFirestore
//         .collection(travelPackages)
//         .withConverter<AdminModel>(fromFirestore: (snapshot, options) {
//       return AdminModel.fromJson(snapshot.id, snapshot.data()!);
//     }, toFirestore: (value, options) {
//       return value.toJson();
//     });
//   }

//   Future<void> addTravelPackage(AdminModel data) async {
//     try {
//       await travel.add(data);
//     } catch (error) {
//       log('error during adding travelPackage :$error');
//     }
//   }

//   Future<void> deleteTravelPackage(String id) async {
//     try {
//       await travel.doc(id).delete();
//     } catch (error) {
//       log('error during deleting travelPackage :$error');
//     }
//   }

//   Future<List<AdminModel>> getAllTravelPackage() async {
//     final snapshot = await travel.get();
//     return snapshot.docs.map((trip) => trip.data()).toList();
//   }

//   Future<void> wishListClicked(String id, bool status) async {
//     try {
//       if (status == true) {
//         await travel.doc(id).update({
//           'wishlist': FieldValue.arrayUnion([
//             firebaseAuth.currentUser!.email ??
//                 firebaseAuth.currentUser!.phoneNumber
//           ])
//         });
//       } else {
//         await travel.doc(id).update({
//           'wishlist': FieldValue.arrayRemove([
//             firebaseAuth.currentUser!.email ??
//                 firebaseAuth.currentUser!.phoneNumber
//           ])
//         });
//       }
//     } catch (e) {
//       log('got a error of :$e');
//     }
//   }

//   Future<String> uploadImage(imageName, imageFile) async {
//     Reference imageFolder = storage.child('productImage');
//     Reference? uploadImage = imageFolder.child('$imageName.jpg');

//     await uploadImage.putFile(imageFile);
//     String downloadURL = await uploadImage.getDownloadURL();
//     log('Image successfully uploaded to Firebase Storage.');
//     return downloadURL;
//   }

//   Future<File?> pickImage(ImageSource source) async {
//     final pickedFile = await imagePicker.pickImage(source: source);
//     if (pickedFile != null) {
//       return File(pickedFile.path);
//     }
//     return null;
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discover/model/admin_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class TravelService {
  String travelPackages = 'Travel';
  late CollectionReference<AdminModel> travel;
  final ImagePicker imagePicker = ImagePicker();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TravelService() {
    travel =
        firebaseFirestore.collection(travelPackages).withConverter<AdminModel>(
              fromFirestore: (snapshot, _) => AdminModel.fromJson(
                snapshot.id,
                snapshot.data()!,
              ),
              toFirestore: (model, _) => model.toJson(),
            );
  }

  Future<void> addTravelPackage(AdminModel travelPackage) async {
    try {
      await travel.add(travelPackage);
    } catch (e) {
      log('Error adding travel package: $e');
    }
  }

  Future<List<AdminModel>> getAllTravelPackage() async {
    final snapshot = await travel.get();
    return snapshot.docs.map((trip) => trip.data()).toList();
  }

  Future<void> deleteTravelPackage(String id) async {
    try {
      await travel.doc(id).delete();
    } catch (error) {
      log('error during deleting travelPackage :$error');
    }
  }

  Future<String?> uploadImage(File image, String? imageName) async {
    try {
      final reference = storage.child('Travel/$imageName');
      final uploadTask = reference.putFile(image);
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  Future<void> wishListClicked(String id, bool status) async {
    try {
      if (status == true) {
        await travel.doc(id).update({
          'wishlist': FieldValue.arrayUnion([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      } else {
        await travel.doc(id).update({
          'wishlist': FieldValue.arrayRemove([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      }
    } catch (e) {
      log('got a error of :$e');
    }
  }

  Future<List<AdminModel>> fetchAllPackages() async {
    try {
      final snapshot = await travel.get();
      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      log('Error fetching travel packages: $e');
      return [];
    }
  }
}
