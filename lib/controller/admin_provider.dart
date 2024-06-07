// import 'dart:developer';
// import 'dart:io';

// import 'package:discover/model/admin_model.dart';
// import 'package:discover/service/admin_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AdminProvider extends ChangeNotifier {
//   final TravelService travelService = TravelService();

//   List<AdminModel> allPackageList = [];
//   List<AdminModel> searchList = [];
//   List<String> downloadUrls = [];
//   List<String> imagePaths = [];
//   bool isLoading = false;

//   final TextEditingController searchController = TextEditingController();
//   final TextEditingController placeNameController = TextEditingController();
//   final TextEditingController placeAboutController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();

//   final TextEditingController durationController = TextEditingController();
//   final TextEditingController transportationController =
//       TextEditingController();

//   final GlobalKey<FormState> packageAddFormkey = GlobalKey<FormState>();

//   String? imageName;
//   File? pickedImage;
//   List<File> travelImages = [];
//   String imageNamePrefix = DateTime.now().microsecondsSinceEpoch.toString();
//   Reference? reference;

//   var wishlist;

//   // AdminProvider() {
//   //   fetchAllDoctors();
//   // }

//   void setLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   Future<void> getImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedImages = await picker.pickMultiImage();
//     if (pickedImages.isNotEmpty) {
//       travelImages.clear();
//       travelImages.addAll(
//         pickedImages.map(
//           (image) => File(image.path),
//         ),
//       );
//       pickedImage = travelImages.first;
//       notifyListeners();
//     }
//   }

//   uploadImages() async {
//     if (travelImages.isNotEmpty) {
//       try {
//         for (final element in travelImages) {
//           Reference videoReference = travelService.uploadImages(element);
//           String downloadUrl = await videoReference.getDownloadURL();
//           String Path = await videoReference.fullPath;
//           imagePaths.add(Path);
//           downloadUrls.add(downloadUrl);
//           log('File successfully uploaded to Firebase Storage. Download URL: $downloadUrl');
//         }
//         travelImages.clear();
//       } catch (e) {
//         log('Error uploading files: $e');
//       }
//     } else {
//       log('No files selected.');
//     }
//   }

//   void clearTravelPackageAddingControllers() {
//     placeNameController.clear();
//     placeAboutController.clear();
//     durationController.clear();
//     transportationController.clear();
//     locationController.clear;
//     searchController.clear();
//     notifyListeners();
//   }

//   Future<void> favouritesClicked(String id, bool status) async {
//     await travelService.favListClicked(id, status);
//     notifyListeners();
//     await getAllTravelPackage();
//   }

//   bool favListCheck(AdminModel product) {
//     final currentuser = FirebaseAuth.instance.currentUser;
//     final user = currentuser?.email ?? currentuser?.phoneNumber;
//     return !product.wishList!.contains(user);
//   }

//   Future<void> fetchAllDoctors() async {
//     setLoading(true);
//     allPackageList = await travelService.fetchAllPackages();
//     setLoading(false);
//   }

//   Future<void> addTravelPackage(AdminModel travelPackage) async {
//     await travelService.addTravelPackage(travelPackage);
//     fetchAllDoctors();
//   }

//   Future<void> getAllTravelPackage() async {
//     allPackageList = await travelService.getAllTravelPackage();
//     notifyListeners();
//   }

//   startLoading(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   Future<void> deleteTravelPackage(String id) async {
//     log('start deleting');
//     await travelService.deleteTravelPackage(id);
//     log('end deleting');
//     await getAllTravelPackage();
//   }

//   void search(String value) {
//     searchList = allPackageList
//         .where(
//           (package) => package.fullName!.toLowerCase().contains(
//                 value.toLowerCase(),
//               ),
//         )
//         .toList();
//     notifyListeners();
//   }

//   // void search(String value) {
//   //   if (value.isEmpty) {
//   //     searchList = [];
//   //   } else {
//   //     searchList = allPackageList
//   //         .where((AdminModel package) =>
//   //             package.fullName!.toLowerCase().contains(value.toLowerCase()))
//   //         .toList();
//   //   }
//   //   notifyListeners();
//   // }
// }
import 'dart:developer';
import 'dart:io';

import 'package:discover/model/admin_model.dart';
import 'package:discover/service/admin_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminProvider extends ChangeNotifier {
  final TravelService travelService = TravelService();

  List<AdminModel> allPackageList = [];
  List<AdminModel> searchList = [];
  List<String> downloadUrls = [];
  List<String> imagePaths = [];
  bool isLoading = false;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController placeAboutController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController transportationController =
      TextEditingController();

  final GlobalKey<FormState> packageAddFormkey = GlobalKey<FormState>();

  String? imageName;
  File? pickedImage;
  List<File> travelImages = [];
  String imageNamePrefix = DateTime.now().microsecondsSinceEpoch.toString();
  Reference? reference;

  var wishlist;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      travelImages.clear();
      travelImages.addAll(
        pickedImages.map(
          (image) => File(image.path),
        ),
      );
      pickedImage = travelImages.first;
      notifyListeners();
    }
  }

  Future<void> uploadImages() async {
    if (travelImages.isNotEmpty) {
      try {
        for (final element in travelImages) {
          final videoReference = await travelService.uploadImages(element);
          final downloadUrl = await videoReference.getDownloadURL();
          final path = await videoReference.fullPath;
          imagePaths.add(path);
          downloadUrls.add(downloadUrl);
          log('File successfully uploaded to Firebase Storage. Download URL: $downloadUrl');
        }
        travelImages.clear();
      } catch (e) {
        log('Error uploading files: $e');
      }
    } else {
      log('No files selected.');
    }
  }

  void clearTravelPackageAddingControllers() {
    placeNameController.clear();
    placeAboutController.clear();
    durationController.clear();
    transportationController.clear();
    locationController.clear();
    searchController.clear();
    notifyListeners();
  }

  Future<void> favouritesClicked(String id, bool status) async {
    await travelService.favListClicked(id, status);
    notifyListeners();
    await getAllTravelPackages();
  }

  bool favListCheck(AdminModel product) {
    final currentuser = FirebaseAuth.instance.currentUser;
    final user = currentuser?.email ?? currentuser?.phoneNumber;
    return !product.wishList!.contains(user);
  }

  // Future<void> fetchAllPackages() async {
  //   setLoading(true);
  //   allPackageList = await travelService.fetchAllPackages();
  //   setLoading(false);
  //   notifyListeners();
  //}

  Future<void> addTravelPackage(AdminModel travelPackage) async {
    await travelService.addTravelPackage(travelPackage);
    getAllTravelPackages();
  }

  Future<void> getAllTravelPackages() async {
    allPackageList = await travelService.getAllTravelPackage();
    notifyListeners();
  }

  startLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> deleteTravelPackage(String id) async {
    log('start deleting');
    await travelService.deleteTravelPackage(id);
    log('end deleting');
    await getAllTravelPackages();
  }

  void search(String value) {
    searchList = allPackageList
        .where(
          (package) => package.fullName!.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    notifyListeners();
  }
}
