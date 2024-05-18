import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
           Navigator.pop(context);

        }, icon: Icon(Icons.arrow_back_ios)),
                 
        title: Text('Booking page'),
      ),
    );
  }
}