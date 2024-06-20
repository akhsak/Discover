// import 'package:flutter/material.dart';

// // class ConformPayment extends StatelessWidget {
// //   // const ConformPayment({super.key});

// //   String name, email, phonenumber, gestno;
// //   ConformPayment(
// //       {required this.name,
// //       required this.email,
// //       required this.gestno,
// //       required this.phonenumber});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Dummy data for payment confirmation
// //     // final paymentData = {
// //     //   'Name': 'Akhsa',
// //     //   'Amount': '\$100.00',
// //     //   'Date': '21 May 2024',
// //     //   'Payment Method': 'Credit Card',
// //     // };

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Conform Booking'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               'Payment Details:',
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 10),
// //             Text('Name ${name}'),
// //             Text('email ${email}'),
// //             Text('gestNo ${gestno}'),
// //             Text('phoneNumber${phonenumber}'),
// //             // ...paymentData.entries.map((entry) {
// //             //   return Padding(
// //             //     padding: const EdgeInsets.symmetric(vertical: 4.0),
// //             //     child: Row(
// //             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             //       children: [
// //             //         Text(
// //             //           entry.key,
// //             //           style: const TextStyle(fontSize: 16),
// //             //         ),
// //             //         Text(
// //             //           entry.value,
// //             //           style: const TextStyle(fontSize: 16),
// //             //         ),
// //             //       ],
// //             //     ),
// //             //   );
// //             // }).toList(),
// //             SizedBox(height: 20),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: const Text('Go Back'),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     // Action to confirm the payment
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: const Text('Payment Confirmed!'),
// //                       ),
// //                     );
// //                     // Add your payment confirmation logic here
// //                   },
// //                   child: const Text('Confirm'),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class ConfirmPayment extends StatelessWidget {
//   final String name, email, phonenumber, gestno;

//   ConfirmPayment(
//       {required this.name,
//       required this.email,
//       required this.gestno,
//       required this.phonenumber});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Confirm Booking'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Payment Details:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text('Name: $name'),
//             Text('Email: $email'),
//             Text('Guest No: $gestno'),
//             Text('Phone Number: $phonenumber'),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Go Back'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Action to confirm the payment
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: const Text('Payment Confirmed!'),
//                       ),
//                     );
//                     // Add your payment confirmation logic here
//                   },
//                   child: const Text('Confirm'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:discover/model/booking_model.dart';
import 'package:discover/view/user/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmPayment extends StatelessWidget {
  final BookingModel bookingData;

  const ConfirmPayment({Key? key, required this.bookingData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm your payment details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * 0.03,
              ),
            ),
            Gap(screenHeight * 0.02),
            Text(
              'Guest Name: ${bookingData.name}',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Guest Number: ${bookingData.gestNo}',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Phone: ${bookingData.phoneNumber}',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Email: ${bookingData.email}',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'ID Number: ${bookingData.travelId}',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Booking Date: ${bookingData.date}',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            // Text(
            //   'Booking Amount: 500 ₹',
            //   style: TextStyle(
            //     fontSize: screenHeight * 0.02,
            //   ),
            // ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go Back')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Payment confirmed!')),
                    );
                  },
                  child: Text('Confirm Payment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
