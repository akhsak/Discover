import 'dart:io';
import 'dart:developer';
import 'package:discover/model/admin_model.dart';
import 'package:discover/service/admin_service';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminProvider extends ChangeNotifier {
  TravelService travelService = TravelService();

  // TextEditingController doctorNameController = TextEditingController();
  // TextEditingController doctorAgeController = TextEditingController();
  // TextEditingController doctorAboutController = TextEditingController();
  // TextEditingController doctorAppointmentTimeController =
  //     TextEditingController();
  // TextEditingController doctorAppointmentEndTimeController =
  //     TextEditingController();
  // TextEditingController doctorPatientsController = TextEditingController();
  // TextEditingController doctorExperienceController = TextEditingController();
  // TextEditingController doctorRatingController = TextEditingController();

  // final doctorAddFormkey = GlobalKey<FormState>();

  // String? selectedGender;
  // List<String> genders = ['Male', 'Female'];

  // String? selectedCategory;
  // List<String> category = [
  //   'General',
  //   'Dentist',
  //   'Otology',
  //   'Cardiology',
  //   'Intestine',
  //   'Pediatric',
  //   'Herbal',
  // ];

  // String? selectedPosition;
  // List<String> position = [
  //   'Senior Surgeon',
  //   'Attending Physician',
  //   'Junior Surgeon',
  //   'Consultant',
  //   'Medical Officer'
  // ];

  void clearDoctorAddingControllers() {
    // doctorNameController.clear();
    // doctorAgeController.clear();
    // doctorAboutController.clear();
    // doctorAppointmentTimeController.clear();
    // doctorAppointmentEndTimeController.clear();
    // doctorPatientsController.clear();
    // doctorExperienceController.clear();
    // doctorRatingController.clear();
    // clearDoctorImage();
    // clearDropdownValues();
  }

  void clearDoctorImage() {
    travelImage = null;
    notifyListeners();
  }

  // void clearDropdownValues() {
  //   selectedGender = null;
  //   selectedCategory = null;
  //   selectedPosition = null;

  //   notifyListeners();
  // }

  File? travelImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;

  final ImagePicker imagePicker = ImagePicker();

  List<AdminModel> allDoctorList = [];

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> addDoctor(AdminModel data) async {
    await travelService.addTravelPackage(data);
    // getAllTravelPackage();

    notifyListeners();

    void deleteTravelPackage(String id) async {
      log('start deleting');
      await travelService.deleteTravelPackage(id);
      log('end deleting');
      // getAllTravelPackage();
    }

    void getAllTravelPackage() async {
      allDoctorList = await travelService.getAllTravelPackage();

      notifyListeners();
    }

    Future<String> uploadImage(image, imageName) async {
      try {
        if (image != null) {
          String downloadUrl =
              await travelService.uploadImage(imageName, image);
          log(downloadUrl);
          notifyListeners();
          return downloadUrl;
        } else {
          log('image is null');
          return '';
        }
      } catch (e) {
        log('got an error of $e');
        rethrow;
      }
    }

    Future getImage(ImageSource source) async {
      final pickedFile = await imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        travelImage = File(pickedFile.path);
        log("Image picked");
        notifyListeners();
      }
    }

    TextEditingController searchController = TextEditingController();

    List<AdminModel> searchList = [];

    void search(String value) {
      if (value.isEmpty) {
        searchList = [];
      } else {
        searchList = allDoctorList
            .where((AdminModel doctor) =>
                doctor.fullName!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
      notifyListeners();
    }

    Future<void> wishlistClicked(String id, bool status) async {
      await travelService.wishListClicked(id, status);
      notifyListeners();
    }

    bool wishListCheck(AdminModel doctor) {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final user = currentUser.email ?? currentUser.phoneNumber;
        if (doctor.wishList.contains(user)) {
          getAllTravelPackage();
          return false;
        } else {
          getAllTravelPackage();
          return true;
        }
      } else {
        return true;
      }
    }
  }
}
