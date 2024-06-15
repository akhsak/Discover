import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discover/model/booking_model.dart';

class BookingService {
  final CollectionReference<BookingModel> booking;

  BookingService()
      : booking = FirebaseFirestore.instance
            .collection('booking')
            .withConverter<BookingModel>(
              fromFirestore: (snapshot, _) =>
                  BookingModel.fromJson(snapshot.id, snapshot.data()!),
              toFirestore: (model, _) => model.toJson(),
            );

  Future<List<BookingModel>> getUserBooking(String userId) async {
    final querySnapshot =
        await booking.where('userId', isEqualTo: userId).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> addBooking(BookingModel data) async {
    try {
      DocumentReference docRef = await booking.add(data);
      data.id = docRef.id;
      await docRef.set(data);
    } catch (error) {
      log('Error during adding booking: $error');
      throw error;
    }
  }

  Future<void> deleteBooking(String id) async {
    try {
      await booking.doc(id).delete();
    } catch (error) {
      log('Error during deleting booking: $error');
    }
  }

  Future<List<BookingModel>> getAllBooking() async {
    final snapshot = await booking.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateBooking(String id, BookingModel data) async {
    try {
      await booking.doc(id).update(data.toJson());
    } catch (error) {
      log('Error in updating booking: $error');
    }
  }

  Future<List<BookingModel>> getCanceledBooking(String userId) async {
    final querySnapshot = await booking
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: 'canceled')
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}



// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:discover/model/booking_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// String booking = 'booking';
// late CollectionReference<BookingModel> booking;
// FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// BookingService() {
//   booking = firebaseFirestore.collection(booking).withConverter<BookingModel>(
//       fromFirestore: (snapshot, options) {
//     return BookingModel.fromJson(snapshot.id, snapshot.data()!);
//   }, toFirestore: (value, options) {
//     return value.toJson();
//   });
// }




// Future<List<BookingModel>> getUserBooking(String userId) async {
//   final querySnapshot = await booking.where('userId', isEqualTo: userId).get();
//   return querySnapshot.docs.map((doc) => doc.data()).toList();
// }

// Future<void> addBooking(BookingModel data) async {
//   try {
//     DocumentReference docRef = await booking.add(data);
//     data.id = docRef.id;
//     await docRef.set(data);
//   } catch (error) {
//     log('Error during adding booking: $error');
//     throw error;
//   }
// }

// Future<void> deleteBooking(String id) async {
//   try {
//     await booking.doc(id).delete();
//   } catch (error) {
//     log('error during deleting booking :$error');
//   }
// }

// Future<List<BookingModel>> getAllBookking() async {
//   final snapshot = await booking.get();
//   return snapshot.docs.map((doc) => doc.data()).toList();
// }

// Future<void> updateBooking(String id, BookingModel data) async {
//   try {
//     await booking.doc(id).update(
//           data.toJson(),
//         );
//   } catch (e) {
//     log("error in updating booking : $e");
//   }
// }

// Future<List<BookingModel>> getCanceledBooking(String userId) async {
//   final querySnapshot = await booking
//       .where('userId', isEqualTo: userId)
//       .where('status', isEqualTo: 'canceled')
//       .get();
//   return querySnapshot.docs.map((doc) => doc.data()).toList();
// }


