

import 'package:discover/view/user/booking/date_page.dart';
import 'package:discover/view/user/booking/widget/booking_widget.dart';
import 'package:discover/view/user/booking/widget/review.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingDetailScreen extends StatelessWidget {
  final String imageUrl = 'assets/splash1.img.jpeg'; // Replace with your image URL
 // final String mapImageUrl = 'https://maps.googleapis.com/maps/api/staticmap?center=Bora+Bora&zoom=12&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C-16.500412,151.741490'; // Replace with your map image URL

  // void _bookNow() async {
  //   const url = 'https://booking.example.com';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
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
                    'What is included',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.abc), label: Text('aa')),
                      ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.abc), label: Text('aa')),
                                            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.abc), label: Text('aa'))


                      // Icon(Icons.wifi, size: 30),
                      // SizedBox(width: 16),
                      // Icon(Icons.king_bed, size: 30),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Where will you stay',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'View the location on map',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          'assets/download.jpg', // Placeholder for the map image
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Angkor Masti Hotel\nNR6, Krong Siem Reap, Cambodia',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                          'assets/splash1.img.jpeg', 
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Image.asset(
                          'assets/splash1.img.jpeg', 
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('See all 20 photos'),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Reviews',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('4.5 (200 reviews)', style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 185),
                            IconButton(onPressed: (){
                              
                            }, icon: Icon(Icons.message))
                          ],
                        ),
                        SizedBox(height: 10),
                        ReviewCard(
                          name: 'Jack Daniel',
                          date: 'Dec 2021',
                          review: 'Good Place',
                          description: 'Something to review here',
                        ),
                        ReviewCard(
                          name: 'Jack Daniel',
                          date: 'Dec 2021',
                          review: 'Good Place',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi ipsum, pretium dignissim blandit sed.',
                        ),
                        SizedBox(height: 20),
                        // FAQSection(
                        //   title: 'People frequently ask',
                        //   faqs: [
                        //     FAQItem(
                        //       question: 'About this place',
                        //       answer:
                        //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non ex, nunc, urna, in odio.',
                        //     ),
                        //     FAQItem(
                        //       question: 'Term and condition',
                        //       answer:
                        //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non ex, nunc, urna, in odio.',
                        //     ),
                        //     FAQItem(
                              
                        //       question: 'Cancelation Policy',
                        //       answer:
                        //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non ex, nunc, urna, in odio.',
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 16),
                        Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$600/Person',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                        //  if (_formKey.currentState?.validate() ?? false) {}
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DatePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => DatePage()));
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     padding: EdgeInsets.symmetric(vertical: 15.0),
                        //     backgroundColor: Colors.blue,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10.0),
                        //     ),
                        //   ),
                        //   child: Center(
                        //     child: Text(
                        //       'Book Now',
                        //       style: TextStyle(fontSize: 16.0, color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
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

