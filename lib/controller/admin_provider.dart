import 'dart:developer';
import 'dart:io';

import 'package:discover/model/admin_model.dart';
import 'package:discover/service/admin_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminProvider extends ChangeNotifier {
  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrls;
  bool isLoading = false;
  bool isAddingData = false;

  final GlobalKey<FormState> packageAddFormkey = GlobalKey<FormState>();

  final TravelService travelService = TravelService();
  final ImagePicker imagePicker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController transportationController =
      TextEditingController();

  List<AdminModel> searchList = [];
  List<AdminModel> allTravelList = [];
  // List<File> travelImages = [];

  void setIsAddingData(bool value) {
    isAddingData = value;
    notifyListeners();
  }

  void clearTravelControllers() {
    placeNameController.clear();
    aboutController.clear();
    locationController.clear();
    durationController.clear();
    transportationController.clear();
    pickedImage = null;
  }

  void addTravelPackage(AdminModel data) async {
    await travelService.addTravelPackage(data);

    notifyListeners();
    getAllTravelPackage();
  }

  void deleteTravelPackage(String id) async {
    await travelService.deleteTravelPackage(id);
    getAllTravelPackage();
  }

  void getAllTravelPackage() async {
    isLoading = true;
    allTravelList = await travelService.getAllTravelPackages();
    isLoading = false;
    notifyListeners();
  }

  Future<String> uploadImage(image, imageName) async {
    try {
      if (image != null) {
        String downloadUrl = await travelService.uploadImage(imageName, image);
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
      pickedImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }

  void search(String value) {
    if (value.isEmpty) {
      searchList = [];
    } else {
      searchList = allTravelList
          .where((AdminModel travel) =>
              travel.placeName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> wishlistClicked(String id, bool status) async {
    await travelService.wishListClicked(id, status);
    notifyListeners();
  }

  bool wishListCheck(AdminModel package) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final user = currentUser.email ?? currentUser.phoneNumber;
      if (package.wishList!.contains(user)) {
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
