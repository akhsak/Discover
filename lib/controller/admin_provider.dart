// // import 'dart:io';
// // import 'dart:developer';
// // import 'package:discover/model/admin_model.dart';
// // import 'package:discover/service/admin_service.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// // class AdminProvider extends ChangeNotifier {
// //   TravelService travelService = TravelService();

// //   TextEditingController placeNameController = TextEditingController();
// //   //TextEditingController doctorAgeController = TextEditingController();
// //   TextEditingController placeAboutController = TextEditingController();
// //   //TextEditingController doctorAppointmentTimeController = TextEditingController();
// //   // TextEditingController doctorAppointmentEndTimeController =TextEditingController();
// //   //TextEditingController doctorPatientsController = TextEditingController();
// //   //TextEditingController doctorExperienceController = TextEditingController();
// //   //TextEditingController doctorRatingController = TextEditingController();

// //   final packageAddFormkey = GlobalKey<FormState>();

// //   // String? selectedGender;
// //   // List<String> genders = ['Male', 'Female'];

// //   // String? selectedCategory;
// //   // List<String> category = [
// //   //   'General',
// //   //   'Dentist',
// //   //   'Otology',
// //   //   'Cardiology',
// //   //   'Intestine',
// //   //   'Pediatric',
// //   //   'Herbal',
// //   // ];

// //   // String? selectedPosition;
// //   // List<String> position = [
// //   //   'Senior Surgeon',
// //   //   'Attending Physician',
// //   //   'Junior Surgeon',
// //   //   'Consultant',
// //   //   'Medical Officer'
// //   // ];

// //   void clearDoctorAddingControllers() {
// //     placeNameController.clear();
// //     //  doctorAgeController.clear();
// //     placeAboutController.clear();
// //     // doctorAppointmentTimeController.clear();
// //     // doctorAppointmentEndTimeController.clear();
// //     // doctorPatientsController.clear();
// //     // doctorExperienceController.clear();
// //     // doctorRatingController.clear();
// //     clearPlaceImage();
// //     // clearDropdownValues();
// //   }

// //   void clearPlaceImage() {
// //     travelImage = null;
// //     notifyListeners();
// //   }

// //   // void clearDropdownValues() {
// //   //   selectedGender = null;
// //   //   selectedCategory = null;
// //   //   selectedPosition = null;

// //   //   notifyListeners();
// //   // }

// //   File? travelImage;
// //   String imageName = DateTime.now().microsecondsSinceEpoch.toString();
// //   String? downloadUrl;

// //   final ImagePicker imagePicker = ImagePicker();

// //   List<AdminModel> allPackageList = [];

// //   bool isLoading = false;

// //   void setLoading(bool value) {
// //     isLoading = value;
// //     notifyListeners();
// //   }

// //   Future<void> getAllTravelPackage() async {
// //     allPackageList = await travelService.getAllTravelPackage();
// //     notifyListeners();
// //   }

// //   Future<void> addTravelPackage(AdminModel data) async {
// //     await travelService.addTravelPackage(data);
// //     await getAllTravelPackage();
// //     notifyListeners();
// //   }

// //   Future<void> deleteTravelPackage(String id) async {
// //     log('start deleting');
// //     await travelService.deleteTravelPackage(id);
// //     log('end deleting');
// //     await getAllTravelPackage();
// //   }

// //   Future<String> uploadImage(image, imageName) async {
// //     try {
// //       if (image != null) {
// //         String downloadUrl = await travelService.uploadImage(imageName, image);
// //         log(downloadUrl);
// //         notifyListeners();
// //         return downloadUrl;
// //       } else {
// //         log('image is null');
// //         return '';
// //       }
// //     } catch (e) {
// //       log('got an error of $e');
// //       rethrow;
// //     }
// //   }

// //   Future getImage(ImageSource source) async {
// //     final pickedFile = await imagePicker.pickImage(source: source);

// //     if (pickedFile != null) {
// //       travelImage = File(pickedFile.path);
// //       log("Image picked");
// //       notifyListeners();
// //     }
// //   }

// //   TextEditingController searchController = TextEditingController();

// //   List<AdminModel> searchList = [];

// //   void search(String value) {
// //     if (value.isEmpty) {
// //       searchList = [];
// //     } else {
// //       searchList = allPackageList
// //           .where((AdminModel doctor) =>
// //               doctor.fullName!.toLowerCase().contains(value.toLowerCase()))
// //           .toList();
// //     }
// //     notifyListeners();
// //   }

// //   Future<void> wishlistClicked(String id, bool status) async {
// //     await travelService.wishListClicked(id, status);
// //     notifyListeners();
// //   }

// //   bool wishListCheck(AdminModel doctor) {
// //     final currentUser = FirebaseAuth.instance.currentUser;
// //     if (currentUser != null) {
// //       final user = currentUser.email ?? currentUser.phoneNumber;
// //       if (doctor.wishList.contains(user)) {
// //         getAllTravelPackage();
// //         return false;
// //       } else {
// //         getAllTravelPackage();
// //         return true;
// //       }
// //     } else {
// //       return true;
// //     }
// //   }
// // }

// import 'dart:io';

// import 'package:discover/model/admin_model.dart';
// import 'package:discover/service/admin_service.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AdminProvider extends ChangeNotifier {
//   final TravelService travelService = TravelService();

//   List<AdminModel> allPackageList = [];
//   List<AdminModel> searchList = [];
//   bool isLoading = false;

//   final TextEditingController searchController = TextEditingController();
//   final TextEditingController placeNameController = TextEditingController();
//   final TextEditingController placeAboutController = TextEditingController();
//   final GlobalKey<FormState> packageAddFormkey = GlobalKey<FormState>();

//   XFile? travelImage;
//   String? imageName;

//   AdminProvider() {
//     fetchAllDoctors();
//   }

//   void setLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   Future<void> getImage(ImageSource source) async {
//     try {
//       final image = await travelService.imagePicker.pickImage(source: source);
//       if (image != null) {
//         travelImage = image;
//         imageName = image.name;
//         notifyListeners();
//       }
//     } catch (e) {
//       print(e);
//     }
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

//   Future<String?> uploadImage(File image, String? imageName) async {
//     return await travelService.uploadImage(image, imageName);
//   }

//   void search(String query) {
//     searchList = allPackageList
//         .where((package) =>
//             package.fullName!.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     notifyListeners();
//   }

//   void clearDoctorAddingControllers() {
//     placeNameController.clear();
//     placeAboutController.clear();
//     travelImage = null;
//     notifyListeners();
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:discover/model/admin_model.dart';
import 'package:discover/service/admin_service.dart';
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
  final GlobalKey<FormState> packageAddFormkey = GlobalKey<FormState>();

  // XFile? travelImage;
  String? imageName;
  File? pickedImage;
  List<File> productImages = [];
  Reference? reference;

  AdminProvider() {
    fetchAllDoctors();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // Future<void> getImage(ImageSource source) async {
  //   try {
  //     final image = await travelService.imagePicker.pickImage(source: source);
  //     if (image != null) {
  //       travelImage = image;
  //       imageName = image.name;
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      productImages.clear();
      productImages.addAll(
        pickedImages.map(
          (image) => File(image.path),
        ),
      );
      pickedImage = productImages.first;
      notifyListeners();
    }
  }

  uploadImages() async {
    if (productImages.isNotEmpty) {
      try {
        for (final element in productImages) {
          Reference videoReference = travelService.uploadImages(element);
          String downloadUrl = await videoReference.getDownloadURL();
          String Path = await videoReference.fullPath;
          imagePaths.add(Path);
          downloadUrls.add(downloadUrl);
          log('File successfully uploaded to Firebase Storage. Download URL: $downloadUrl');
        }
        productImages.clear();
      } catch (e) {
        log('Error uploading files: $e');
      }
    } else {
      log('No files selected.');
    }
  }

  Future<void> fetchAllDoctors() async {
    setLoading(true);
    allPackageList = await travelService.fetchAllPackages();
    setLoading(false);
  }

  Future<void> getAllTravelPackage() async {
    allPackageList = await travelService.getAllTravelPackage();
    notifyListeners();
  }

  Future<void> addTravelPackage(AdminModel travelPackage) async {
    await travelService.addTravelPackage(travelPackage);
    fetchAllDoctors();
  }

  // Future<String?> uploadImage(XFile image, String? imageName) async {
  //   final File file = File(image.path);
  //   return await travelService.uploadImage(file, imageName);
  // }

  Future<void> deleteTravelPackage(String id) async {
    log('start deleting');
    await travelService.deleteTravelPackage(id);
    log('end deleting');
    await getAllTravelPackage();
  }

  // void search(String query) {
  //   searchList = allPackageList
  //       .where((package) =>
  //           package.fullName!.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  //   notifyListeners();
  //}

  void search(String value) {
    if (value.isEmpty) {
      searchList = [];
    } else {
      searchList = allPackageList
          .where((AdminModel package) =>
              package.fullName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearTravelPackageAddingControllers() {
    placeNameController.clear();
    placeAboutController.clear();
    // travelImage = null;
    notifyListeners();
  }
}
