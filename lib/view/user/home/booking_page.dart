import 'package:discover/controller/booking_provider.dart';
import 'package:discover/view/user/booking/conform_payment.dart';
import 'package:discover/view/user/booking/success_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DetalBooking extends StatelessWidget {
  const DetalBooking({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final detailbookprovider =
        Provider.of<BookingProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: detailbookprovider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.03,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Get the best out of derleng by creating an account',
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.02),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: detailbookprovider.guestNameController,
                  decoration: InputDecoration(
                    labelText: 'Guest name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter guest name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: detailbookprovider.guestNumberController,
                  decoration: InputDecoration(
                    labelText: 'Guest number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter guest number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.2,
                      child: TextFormField(
                        controller: detailbookprovider.countryCodeController,
                        decoration: InputDecoration(
                          prefixText: '',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter country code';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: TextFormField(
                        controller: detailbookprovider.phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: detailbookprovider.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                Consumer<BookingProvider>(
                  builder: (context, value, child) => TextFormField(
                    controller: detailbookprovider.idNumberController,
                    obscureText: value.obscureText,
                    decoration: InputDecoration(
                      labelText: 'ID Number',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          value.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: value.idPasswordVisibility(),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ID number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$1200/2 Person',
                      style: TextStyle(
                        fontSize: screenHeight * 0.023,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          //   if (_formKey.currentState?.validate() ?? false) {
                          // }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConformPayment()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
