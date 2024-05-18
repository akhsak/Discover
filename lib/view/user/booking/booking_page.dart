
import 'package:flutter/material.dart';

class VacationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Go back
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.share),
        //     onPressed: () {
        //       // Share functionality
        //     },
        //   ),
       // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/splash1.img.jpeg', // Replace with your image URL
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lovely Vacation Home',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'What to expect:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.wifi, size: 30),
                      SizedBox(width: 16),
                      Icon(Icons.king_bed, size: 30),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Where you\'ll stay:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/splash1.img.jpeg', // Replace with your map image URL
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                      'assets/splash1.img.jpeg', // Replace with your image URL
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Image.asset(
                      'assets/splash1.img.jpeg', // Replace with your image URL
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Reviews:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://via.placeholder.com/50'), // Replace with user image URL
                    ),
                    title: Text('Jane D.'),
                    subtitle: Text('Loved the stay! Highly recommend.'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://via.placeholder.com/50'), // Replace with user image URL
                    ),
                    title: Text('John S.'),
                    subtitle: Text('A fantastic place with great amenities.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}