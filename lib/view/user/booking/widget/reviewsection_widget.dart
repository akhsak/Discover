import 'package:discover/view/user/booking/widget/review.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({Key? key}) : super(key: key);

  @override
  _ReviewSectionState createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final List<Map<String, String>> reviews = [
    {
      'name': 'Jack Daniel',
      'date': 'Dec 2021',
      'review': 'Good Place',
      'description': 'Something to review here',
    },
    {
      'name': 'Jack Daniel',
      'date': 'Dec 2021',
      'review': 'Good Place',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
  ];

  void _addReview(String reviewText) {
    setState(() {
      reviews.add({
        'name': 'New User',
        'date': 'Jan 2022',
        'review': reviewText,
        'description': 'New review description',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text('( reviews)', style: TextStyle(color: Colors.grey)),
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
                          hintText: 'Write your review here',
                        ),
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
                            _addReview(reviewController.text);
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
        Column(
          children: reviews.map((review) {
            return ReviewCard(
              name: review['name']!,
              date: review['date']!,
              review: review['review']!,
              description: review['description']!,
            );
          }).toList(),
        ),
      ],
    );
  }
}

Widget travelDetailsText({
  required String value,
  required Color color,
  required double fontsize,
  required FontWeight fontWeight,
}) {
  return Text(
    value,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontWeight,
    ),
  );
}
