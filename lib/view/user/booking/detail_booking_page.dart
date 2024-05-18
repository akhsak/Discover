import 'package:flutter/material.dart';

class DetalBooking extends StatelessWidget {
  const DetalBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Text('Detail Booking',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text('Get the best out of derleng by creating an account'),
        ],
      ),
    );
  }
}