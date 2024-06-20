import 'dart:developer';

import 'package:booking_calendar/booking_calendar.dart';
import 'package:discover/model/booking_model.dart';
import 'package:discover/model/user_model.dart';
import 'package:discover/model/review.model.dart';
import 'package:discover/service/booking_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewController extends ChangeNotifier {
  BookingPageService fireStoreService = BookingPageService();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController reviewController = TextEditingController();
  List<ReviewModel> allReviews = [];
  List<ReviewModel> myReviews = [];
  addReview(String bookingId) async {
    final data = ReviewModel(
        content: reviewController.text.trim(),
        bookingId: bookingId,
        reviewId: firebaseAuth.currentUser!.uid + DateTime.now().toString(),
        timeStamp: DateTime.now(),
        like: 5,
        uId: firebaseAuth.currentUser!.uid);
    await fireStoreService.addReview(data);
    reviewController.clear();
    getAllReviews(bookingId);

    notifyListeners();
  }

  getAllReviews(String bookingId) async {
    try {
      List<ReviewModel> items = await fireStoreService.getAllReviews(bookingId);
      List<UserModel> allUser = await fireStoreService.getAllUser();
      allReviews.clear();
      for (var item in items) {
        UserModel? user = allUser.firstWhere((user) => user.uId == item.uId,
            orElse: () => UserModel());
        ReviewModel selectedItem = ReviewModel(
          username: user.userName ?? '',
          userPic: user.profilepic ?? '',
          content: item.content,
          like: item.like,
          timeStamp: item.timeStamp,
        );
        // UserModel? user = allUser.firstWhere((user) => user.uId == item.uId,
        //     orElse: () => UserModel());
        // ReviewModel selectedItem = ReviewModel(
        //   username: user.userName ?? '',
        //   userPic: user.profilePic ?? '',
        //   content: item.content,
        //   like: item.like,
        //   timeStamp: item.timeStamp,
        // );
        // allReviews.add(selectedItem);
      }
      notifyListeners();
    } catch (e) {
      log('message$e');
    }
  }

  getMyReviews(String uId) async {
    try {
      List<ReviewModel> items = await fireStoreService.getMyReviews();
      myReviews = items.where((element) => element.uId == uId).toList();

      notifyListeners();
    } catch (e) {
      log('message$e');
    }
  }
}
