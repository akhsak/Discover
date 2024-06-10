import 'package:discover/view/user/booking/date_page.dart';
import 'package:discover/view/user/booking/widget/review.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:flutter/material.dart';

class BookingDetailScreen extends StatelessWidget {
  final placeName;
  final aboutTrip;
  final location;
  final image;
  final duration;
  final transportation;

  const BookingDetailScreen(
      {super.key,
      this.placeName,
      this.aboutTrip,
      this.location,
      this.duration,
      this.image,
      this.transportation});
  // final String imageUrl =
  //     'assets/splash1.img.jpeg'; // Replace with your image URL

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
            Container(
              height: size.height * 0.3,
              width: size.width * .8,
              decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.contain),
                  color: Colors.white),
            ),
            // Image.asset(
            //   'assets/splash1.img.jpeg',
            //   width: double.infinity,
            //   height: 200,
            //   fit: BoxFit.cover,
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  travelDetailsText(
                      value: placeName.toString(),
                      color: Color.fromARGB(255, 7, 7, 7),
                      fontsize: 32,
                      fontWeight: FontWeight.bold),
                  // Text(aboutTrip),
                  SizedBox(height: 40),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'What is included',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 205, 198, 198),
                            ),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          icon: Icon(Icons.train, color: Colors.black),
                          label: travelDetailsText(
                              value: 'Bus\n${transportation.toString()}',
                              color: Color.fromARGB(255, 7, 7, 7),
                              fontsize: 15,
                              fontWeight: FontWeight.bold),
                          //  Text(
                          //   'Bus\n${transportation}',
                          //   style: TextStyle(color: Colors.black),
                          // ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.17,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 205, 198, 198),
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        icon: Icon(
                          Icons.punch_clock,
                          color: Colors.black,
                        ),
                        label: travelDetailsText(
                            value: '${duration.toString()}\n\Duration',
                            color: Color.fromARGB(255, 7, 7, 7),
                            fontsize: 15,
                            fontWeight: FontWeight.bold),
                        //  Text(
                        //   '2 days\n${duration}',
                        //   style: TextStyle(color: Colors.black),
                        // ),
                      ),
                      SizedBox(
                        width: 50,
                      ),

                      //     ElevatedButton.icon(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         side: const BorderSide(
                      //                   color: Color.fromARGB(255, 205, 198, 198),
                      //                 ),
                      //                 backgroundColor: Colors.white,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(0),
                      // ),
                      //       ),
                      //       icon: Icon(Icons.abc),
                      //       label: Text('id'),
                      //     ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Where will you stay',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location.toString(),
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
                          child: Padding(
                            padding: const EdgeInsets.only(right: 170),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                // padding: EdgeInsets.symmetric(horizontal: 130, ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 205, 198, 198),
                                  ),
                                ),
                              ),
                              child: Text(
                                'See all 20 photos',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Reviews',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(height: 5),
                        Row(
                          children: [
                            Text('(200 reviews)',
                                style: TextStyle(color: Colors.grey)),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    TextEditingController reviewController =
                                        TextEditingController();
                                    return AlertDialog(
                                      title: Text('Add a Review'),
                                      content: TextField(
                                        controller: reviewController,
                                        decoration: InputDecoration(
                                            hintText: 'Write your review here'),
                                        maxLines: 3,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Handle review submission
                                            String review =
                                                reviewController.text;
                                            print('Review submitted: $review');
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.message),
                            ),
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
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$600/Person',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
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
