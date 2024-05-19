import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '1. Booking Information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Users can book travel services like flights, accommodations, and activities. Provide accurate personal and payment details for bookings.',
            ),
            SizedBox(height: 10),
            Text(
              '2. Payments:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Users are responsible for payments using accepted methods. Prices subject to change based on availability.',
            ),
            SizedBox(height: 10),
            Text(
              '3. Cancellations and Refunds:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Policies vary by service provider. Refunds follow provider cancellation policies.',
            ),
            SizedBox(height: 10),
            Text(
              '4. User Conduct:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Use Discover lawfully and responsibly.',
            ),
            SizedBox(height: 10),
            Text(
              '5. Intellectual Property:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'All content is property of Travel Booking.',
            ),
            SizedBox(height: 10),
            Text(
              '6. Privacy Policy:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Personal data collected and processed according to Privacy Policy.',
            ),
            SizedBox(height: 10),
            Text(
              '7. Disclaimer:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Discover does not guarantee information accuracy. Not liable for losses due to app use.',
            ),
            SizedBox(height: 10),
            Text(
              '8. Changes to Terms and Conditions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Travel Booking reserves right to update terms.',
            ),
            SizedBox(height: 20),
            Text(
              'By using Discover, you accept these terms. If not, please refrain from using the app.',
            ),
          ],
        ),
      ),
    );
  }
}
