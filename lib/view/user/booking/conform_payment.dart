import 'package:flutter/material.dart';

// class ConformPayment extends StatelessWidget {
//   // const ConformPayment({super.key});

//   String name, email, phonenumber, gestno;
//   ConformPayment(
//       {required this.name,
//       required this.email,
//       required this.gestno,
//       required this.phonenumber});

//   @override
//   Widget build(BuildContext context) {
//     // Dummy data for payment confirmation
//     // final paymentData = {
//     //   'Name': 'Akhsa',
//     //   'Amount': '\$100.00',
//     //   'Date': '21 May 2024',
//     //   'Payment Method': 'Credit Card',
//     // };

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Conform Booking'),
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
//             Text('Name ${name}'),
//             Text('email ${email}'),
//             Text('gestNo ${gestno}'),
//             Text('phoneNumber${phonenumber}'),
//             // ...paymentData.entries.map((entry) {
//             //   return Padding(
//             //     padding: const EdgeInsets.symmetric(vertical: 4.0),
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       children: [
//             //         Text(
//             //           entry.key,
//             //           style: const TextStyle(fontSize: 16),
//             //         ),
//             //         Text(
//             //           entry.value,
//             //           style: const TextStyle(fontSize: 16),
//             //         ),
//             //       ],
//             //     ),
//             //   );
//             // }).toList(),
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

class ConfirmPayment extends StatelessWidget {
  final String name, email, phonenumber, gestno;

  ConfirmPayment(
      {required this.name,
      required this.email,
      required this.gestno,
      required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Guest No: $gestno'),
            Text('Phone Number: $phonenumber'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action to confirm the payment
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Payment Confirmed!'),
                      ),
                    );
                    // Add your payment confirmation logic here
                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
