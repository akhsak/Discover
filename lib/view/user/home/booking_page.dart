// import 'package:discover/controller/booking_provider.dart';
// import 'package:discover/view/user/booking/conform_payment.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';

// // BookingProvider class is assumed to be defined elsewhere

// class DetailBooking extends StatelessWidget {
//   const DetailBooking({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     final detailbookprovider =
//         Provider.of<BookingProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.04),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Form(
//             key: detailbookprovider.formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Detail Booking',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: screenHeight * 0.03,
//                   ),
//                 ),
//                 Gap(screenHeight * 0.02),
//                 Text(
//                   'Get the best out of derleng by creating an account',
//                   style: TextStyle(
//                       color: Colors.grey, fontSize: screenHeight * 0.02),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextFormField(
//                   controller: detailbookprovider.guestNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Guest name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter guest name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextFormField(
//                   controller: detailbookprovider.guestNumberController,
//                   decoration: InputDecoration(
//                     labelText: 'Guest number',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter guest number';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 Row(
//                   children: [
//                     Container(
//                       width: screenWidth * 0.2,
//                       child: TextFormField(
//                         controller: detailbookprovider.countryCodeController,
//                         decoration: InputDecoration(
//                           prefixText: '',
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter country code';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.02),
//                     Expanded(
//                       child: TextFormField(
//                         controller: detailbookprovider.phoneController,
//                         decoration: InputDecoration(
//                           labelText: 'Phone',
//                           border: OutlineInputBorder(),
//                         ),
//                         keyboardType: TextInputType.number,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly
//                         ],
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter phone number';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 TextFormField(
//                   controller: detailbookprovider.emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 Consumer<BookingProvider>(
//                   builder: (context, value, child) => TextFormField(
//                     controller: detailbookprovider.idNumberController,
//                     obscureText: value.obscureText,
//                     decoration: InputDecoration(
//                       labelText: 'ID Number',
//                       border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                           icon: Icon(
//                             value.obscureText
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           ),
//                           onPressed: () {
//                             value.idPasswordVisibility();
//                           }),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter ID number';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.2),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '\$1200/2 Person',
//                       style: TextStyle(
//                         fontSize: screenHeight * 0.023,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(
//                       width: screenWidth * 0.4,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (detailbookprovider.formKey.currentState
//                                   ?.validate() ??
//                               false) {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ConfirmPayment(
//                                   email:
//                                       detailbookprovider.emailController.text,
//                                   name: detailbookprovider
//                                       .guestNameController.text,
//                                   gestno: detailbookprovider
//                                       .guestNumberController.text,
//                                   phonenumber:
//                                       detailbookprovider.phoneController.text,
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           padding: EdgeInsets.symmetric(
//                             vertical: screenHeight * 0.02,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                         ),
//                         child: Text(
//                           'Next',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:discover/controller/booking_provider.dart';
import 'package:discover/model/booking_model.dart';
import 'package:discover/view/user/booking/conform_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DetailBooking extends StatelessWidget {
  const DetailBooking({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final detailBookProvider = Provider.of<BookingProvider>(context);

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
          child: Form(
            key: detailBookProvider.formKey,
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
                Gap(screenHeight * 0.02),
                Text(
                  'Get the best out of derleng by creating an account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: detailBookProvider.guestNameController,
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
                  controller: detailBookProvider.guestNumberController,
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
                        controller: detailBookProvider.countryCodeController,
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
                        controller: detailBookProvider.phoneController,
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
                  controller: detailBookProvider.emailController,
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
                TextFormField(
                  controller: detailBookProvider.idNumberController,
                  obscureText: detailBookProvider.obscureText,
                  decoration: InputDecoration(
                    labelText: 'ID Number',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        detailBookProvider.idPasswordVisibility();
                      },
                      icon: Icon(
                        detailBookProvider.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ID number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () async {
                    if (detailBookProvider.formKey.currentState!.validate()) {
                      BookingModel bookingModel = BookingModel(
                        name: detailBookProvider.guestNameController.text,
                        // ame: detailBookProvider.guestNameController.text,
                        gestNo: detailBookProvider.guestNumberController.text,
                        phoneNumber: detailBookProvider.phoneController.text,
                        email: detailBookProvider.emailController.text,
                        travelId: detailBookProvider.idNumberController.text,
                        date: detailBookProvider.selectedDate ?? '',
                        //: detailBookProvider.selectedTime ?? '',
                        // status: 'pending',
                      );

                      bool success = await detailBookProvider.addBooking(
                        bookingModel,
                        (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        },
                      );

                      if (success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmPayment(
                              bookingData: bookingModel,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Continue to payment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////
  // Row(
  //                 children: [
  //                   Container(
  //                     width: screenWidth * 0.2,
  //                     child: TextFormField(
  //                       controller: detailbookprovider.countryCodeController,
  //                       decoration: InputDecoration(
  //                         prefixText: '',
  //                         border: OutlineInputBorder(),
  //                       ),
  //                       validator: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'Please enter country code';
  //                         }
  //                         return null;
  //                       },
  //                     ),
  //                   ),
  //                   SizedBox(width: screenWidth * 0.02),
  //                   Expanded(
  //                     child: TextFormField(
  //                       controller: detailbookprovider.phoneController,
  //                       decoration: InputDecoration(
  //                         labelText: 'Phone',
  //                         border: OutlineInputBorder(),
  //                       ),
  //                       keyboardType: TextInputType.number,
  //                       inputFormatters: [
  //                         FilteringTextInputFormatter.digitsOnly
  //                       ],
  //                       validator: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'Please enter phone number';
  //                         }
  //                         return null;
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: screenHeight * 0.02),
  //               TextFormField(
  //                 controller: detailbookprovider.emailController,
  //                 decoration: InputDecoration(
  //                   labelText: 'Email',
  //                   border: OutlineInputBorder(),
  //                 ),
  //                 validator: (value) {
  //                   if (value == null || value.isEmpty) {
  //                     return 'Please enter email';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //               SizedBox(height: screenHeight * 0.02),
  //               Consumer<BookingProvider>(
  //                 builder: (context, value, child) => TextFormField(
  //                   controller: detailbookprovider.idNumberController,
  //                   obscureText: value.obscureText,
  //                   decoration: InputDecoration(
  //                     labelText: 'ID Number',
  //                     border: OutlineInputBorder(),
  //                     suffixIcon: IconButton(
  //                         icon: Icon(
  //                           value.obscureText
  //                               ? Icons.visibility_off
  //                               : Icons.visibility,
  //                         ),
  //                         onPressed: () {
  //                           value.idPasswordVisibility();
  //                         }),
  //                   ),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'Please enter ID number';
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //               ),
  //               SizedBox(height: screenHeight * 0.2),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     '\$1200/2 Person',
  //                     style: TextStyle(
  //                       fontSize: screenHeight * 0.023,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.blue,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: screenWidth * 0.4,
  //                     child: ElevatedButton(
  //                       onPressed: () {
  //                         if (detailbookprovider.formKey.currentState
  //                                 ?.validate() ??
  //                             false) {
  //                           Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                               builder: (context) => ConfirmPayment(
  //                                 email:
  //                                     detailbookprovider.emailController.text,
  //                                 name: detailbookprovider
  //                                     .guestNameController.text,
  //                                 gestno: detailbookprovider
  //                                     .guestNumberController.text,
  //                                 phonenumber:
  //                                     detailbookprovider.phoneController.text,
  //                               ),
  //                             ),
  //                           );
  //                         }
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                         backgroundColor: Colors.blue,
  //                         padding: EdgeInsets.symmetric(
  //                           vertical: screenHeight * 0.02,
  //                         ),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(16),
  //                         ),
  //                       ),
  //                       child: Text(
  //                         'Next',
  //                         style: TextStyle(color: Colors.white),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),