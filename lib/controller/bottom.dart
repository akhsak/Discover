import 'package:discover/view/admin/add_page.dart';
import 'package:discover/view/admin/admin_home_page.dart';
import 'package:discover/view/admin/admin_profile.dart';
import 'package:discover/view/user/home_page.dart';
import 'package:discover/view/user/notification_page.dart';
import 'package:discover/view/user/profile/profile.dart';
import 'package:discover/view/user/wishlist.dart';
import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int currentIndex = 0;
  // int initIndex = 0;
  int adminCurrentIndex = 0;

  void onTap(index) {
    currentIndex = index;
    notifyListeners();
  }

  void adminOnTap(int index) {
    adminCurrentIndex = index;
    notifyListeners();

    // void setInitIndex(int index) {
    //   initIndex = index;
    //   currentIndex = index;
    //   notifyListeners();
    // }
  }

  final List<Widget> screens = [
    Homepage(),
    WishList(),
    NotificationPage(),
    UserProfileScreen(),
  ];

  List adminScreens = [
    AdminHomeScreen(),
    AdminAddpage(),
    AdminProfileScreen(),
    // AdminProfileScreen()
  ];
}
