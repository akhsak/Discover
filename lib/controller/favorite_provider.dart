import 'package:discover/model/admin_model.dart';
import 'package:discover/service/admin_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouritesProvider extends ChangeNotifier {
  TravelService productService = TravelService();

  Future<void> wishlistCliscked(String id, bool status) async {
    await productService.favListClicked(id, status);
    notifyListeners();
  }

  bool wishlistCheck(AdminModel book) {
    final currentuser = FirebaseAuth.instance.currentUser;
    final user = currentuser!.email ?? currentuser.phoneNumber;
    return !book.wishList!.contains(user);
  }
}
