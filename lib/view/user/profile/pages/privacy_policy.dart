import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This Privacy Policy describes how Travel Booking Agency collects, uses, and shares information when you use our mobile application Discover. By using the App, you agree to the collection and use of information in accordance with this policy.\n',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'We may collect several types of information for various purposes to provide and improve our service to you.\n',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Personal Data:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). This may include, but is not limited to:\n',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Akhsa\nakhsamariyam2k2@gmail.com\n+919876543210\nMalappuram\n',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'We may also collect information on how the Service is accessed and used. This Usage Data may include information such as your device\'s Internet Protocol address (e.g., IP address).\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
