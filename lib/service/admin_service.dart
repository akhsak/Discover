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
  List<String> downloadUrls = [];

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

  // Future<String?> uploadImage(File image, String? imageName) async {
  //   try {
  //     final reference = storage.child('Travel/$imageName');
  //     final uploadTask = reference.putFile(image);
  //     final snapshot = await uploadTask;
  //     return await snapshot.ref.getDownloadURL();
  //   } catch (e) {
  //     log('Error uploading image: $e');
  //     return null;
  //   }
  // }

  uploadImages(file, {String? filePath}) async {
    String fileName = await DateTime.now().millisecondsSinceEpoch.toString();
    try {
      Reference fileFolder = storage.child('Item Image').child('$fileName');

      if (filePath != null) {
        Reference deletefile = storage.child(filePath);
        await deletefile.delete();
        log('The current file Successfully deleted from Firebase Storage.');
      }
      await fileFolder.putFile(file);
      log('file successfully uploaded to Firebase Storage.');
      return fileFolder;
    } catch (e) {
      throw 'Error in Update profile pic : $e';
    }
  }

  //
  Future<void> favListClicked(String id, bool status) async {
    try {
      if (status == true) {
        await travel.doc(id).update(
          {
            'wishlist': FieldValue.arrayUnion(
              [
                firebaseAuth.currentUser!.email ??
                    firebaseAuth.currentUser!.phoneNumber
              ],
            )
          },
        );
      } else {
        await travel.doc(id).update(
          {
            'wishlist': FieldValue.arrayRemove(
              [
                firebaseAuth.currentUser!.email ??
                    firebaseAuth.currentUser!.phoneNumber
              ],
            )
          },
        );
      }
    } catch (e) {
      log("error is $e");
    }
  }

  // Future<List<AdminModel>> fetchAllPackages() async {
  //   try {
  //     final snapshot = await travel.get();
  //     return snapshot.docs.map((e) => e.data()).toList();
  //   } catch (e) {
  //     log('Error fetching travel packages: $e');
  //     return [];
  //   }
  // }
}
