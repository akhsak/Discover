// import 'dart:developer';

// import 'package:booking_calendar/booking_calendar.dart';
// import 'package:discover/model/booking_model.dart';
// import 'package:discover/service/admin_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class BookingProvider extends ChangeNotifier {
//   final formKey = GlobalKey<FormState>();

//   final guestNameController = TextEditingController();
//   final guestNumberController = TextEditingController();
//   final countryCodeController = TextEditingController(text: '+91');
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final idNumberController = TextEditingController();

//   bool obscureText = true;

//   BookingService bookingService = BookingService();

//   final appointmentFormKey = GlobalKey<FormState>();

//   List<BookingModel> allAppointmentList = [];
//   bool isLoading = false;

//   String? selectedDate;
//   String? selectedTime;

//   idPasswordVisibility() {
//     // setState(() {
//     obscureText = !obscureText;
//     notifyListeners();
//     // });
//   }

//   void setSelectedTime(String time) {
//     if (selectedTime == time) {
//       selectedTime = null;
//     } else {
//       selectedTime = time;
//     }
//     notifyListeners();
//   }

//   void setLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   void setSelectedDate(String date) {
//     selectedDate = date;
//     notifyListeners();
//   }

//   Future<bool> addAppointment(
//       BookingModel data, Function(String) onError) async {
//     setLoading(true);
//     bool success = false;
//     try {
//       await bookingService.addBooking(data);
//       clearAppointmentControllers();
//       await getAllBooking();
//       success = true;
//     } catch (error) {
//       log('Error during adding appointment: $error');
//       onError('Slot is already booked');
//     }
//     setLoading(false);
//     return success;
//   }

//   Future<void> deleteAppointment(String id) async {
//     setLoading(true);
//     await bookingService.deleteBooking(id);
//     await getAllBooking();
//     setLoading(false);
//   }

//   Future<void> getAllBooking() async {
//     setLoading(true);
//     allAppointmentList = await bookingService.getAllBooking();
//     setLoading(false);
//   }

//   Future<void> updateAppointment(String id, BookingModel data) async {
//     setLoading(true);
//     await bookingService.updateBooking(id, data);
//     await getAllBooking();
//     setLoading(false);
//   }

//   void clearAppointmentControllers() {
//     guestNameController.clear();
//     guestNumberController.clear();
//     countryCodeController.clear();
//     phoneController.clear();
//     emailController.clear();
//     idNumberController.clear();
//     // userBookingDateController.clear();
//     // userBookingResheduledController.clear();
//     selectedTime = null;
//     notifyListeners();
//   }

//   final TravelService doctorService = TravelService();

//   Future<void> getUserAppointments() async {
//     setLoading(true);
//     try {
//       String userId = FirebaseAuth.instance.currentUser!.uid;
//       List<BookingModel> userAppointments =
//           await bookingService.getUserBooking(userId);
//       allAppointmentList = userAppointments;
//       setLoading(false);
//     } catch (error) {
//       setLoading(false);
//       rethrow;
//     }
//   }

//   Future<void> getUserCanceledAppointments() async {
//     setLoading(true);
//     try {
//       String userId = FirebaseAuth.instance.currentUser!.uid;
//       canceledAppointmentList = await bookingService.getCanceledBooking(userId);
//       setLoading(false);
//     } catch (error) {
//       setLoading(false);
//       log('Error fetching user canceled appointments: $error');
//       throw error;
//     }
//   }

//   List<BookingModel> canceledAppointmentList = [];

//   Future<void> cancelAppointment(String id, Function(String) onError) async {
//     try {
//       BookingModel appointment =
//           allAppointmentList.firstWhere((app) => app.id == id);
//       appointment.status = 'canceled';
//       await bookingService.updateBooking(id, appointment);
//       await getAllBooking();
//       canceledAppointmentList.add(appointment);
//       onError('Appointment cancelled');
//     } catch (error) {
//       log('Error during canceling appointment: $error');
//     }
//   }
// }

import 'dart:developer';
import 'package:discover/service/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import 'package:discover/model/booking_model.dart';
import 'package:discover/service/admin_service.dart';

class BookingProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final guestNameController = TextEditingController();
  final guestNumberController = TextEditingController();
  final countryCodeController = TextEditingController(text: '+91');
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final idNumberController = TextEditingController();

  bool obscureText = true;

  final BookingService bookingService = BookingService();

  final appointmentFormKey = GlobalKey<FormState>();

  List<BookingModel> allAppointmentList = [];
  bool isLoading = false;

  String? selectedDate;
  String? selectedTime;

  void idPasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void setSelectedTime(String time) {
    selectedTime = selectedTime == time ? null : time;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setSelectedDate(String date) {
    selectedDate = date;
    notifyListeners();
  }

  Future<bool> addBooking(BookingModel data, Function(String) onError) async {
    setLoading(true);
    bool success = false;
    try {
      await bookingService.addBooking(data);
      clearBookingControllers();
      await getAllBooking();
      success = true;
    } catch (error) {
      log('Error during adding boooking: $error');
      onError('Slot is already booked');
    }
    setLoading(false);
    return success;
  }

  Future<void> deleteBooking(String id) async {
    setLoading(true);
    await bookingService.deleteBooking(id);
    await getAllBooking();
    setLoading(false);
  }

  Future<void> getAllBooking() async {
    setLoading(true);
    allAppointmentList = await bookingService.getAllBooking();
    setLoading(false);
  }

  Future<void> updateBooking(String id, BookingModel data) async {
    setLoading(true);
    await bookingService.updateBooking(id, data);
    await getAllBooking();
    setLoading(false);
  }

  void clearBookingControllers() {
    guestNameController.clear();
    guestNumberController.clear();
    countryCodeController.clear();
    phoneController.clear();
    emailController.clear();
    idNumberController.clear();
    selectedTime = null;
    notifyListeners();
  }

  Future<void> getUserBookings() async {
    setLoading(true);
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      allAppointmentList = await bookingService.getUserBooking(userId);
      setLoading(false);
    } catch (error) {
      setLoading(false);
      rethrow;
    }
  }

  List<BookingModel> canceledAppointmentList = [];

  Future<void> getUserCanceledBookings() async {
    setLoading(true);
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      canceledAppointmentList = await bookingService.getCanceledBooking(userId);
      setLoading(false);
    } catch (error) {
      setLoading(false);
      log('Error fetching user canceled appointments: $error');
      throw error;
    }
  }

  Future<void> cancelAppointment(String id, Function(String) onError) async {
    try {
      BookingModel booking =
          allAppointmentList.firstWhere((app) => app.id == id);
      // booking.status = 'canceled';
      await bookingService.updateBooking(id, booking);
      await getAllBooking();
      canceledAppointmentList.add(booking);
      onError('Appointment cancelled');
    } catch (error) {
      log('Error during canceling appointment: $error');
    }
  }
}
