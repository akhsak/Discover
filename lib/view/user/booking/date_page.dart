import 'package:discover/view/user/booking/detail_booking_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePage extends StatefulWidget {
  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Available date'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Choose Your Booking',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                _showBookingDialog(context, selectedDay);
              },
              calendarFormat: CalendarFormat.month,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      backgroundColor: Color.fromARGB(255, 244, 240, 240),
                    ),
                    child: const Text('Back',
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalBooking()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      backgroundColor:
                          Colors.blue, // Blue color for the next button
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context, DateTime selectedDay) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Booking for ${selectedDay.toLocal()}'.split(' ')[0]),
          content: Text('Do you want to book this date?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add your booking logic here
                Navigator.of(context).pop();
              },
              child: Text('Book'),
            ),
          ],
        );
      },
    );
  }
}








// // import 'package:flutter/material.dart';

// // class DatePage extends StatelessWidget {
// //   DatePage({super.key});
// //   DateTime today = DateTime.now();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: const Icon(Icons.arrow_back_ios),
// //         ),
// //         title: const Text('Available date'),
// //       ),
// //       body: Column(
// //         children: [
// //           Text('choose Your booking'),
// //           Container(
            
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:booking_calendar/booking_calendar.dart';
// import 'package:flutter/material.dart';

// class DatePage extends StatelessWidget {
//   DatePage({Key? key}) : super(key: key);
//   DateTime today = DateTime.now();

//   // Mock function to get booking stream (replace with actual implementation)
//   Stream<dynamic>? getBookingStream({required DateTime start, required DateTime end}) {
//     // Implement your logic to fetch bookings from the backend here
//     return null;
//   }

//   // Mock function to upload booking (replace with actual implementation)
//   Future<dynamic> uploadBooking({required BookingService newBooking}) async {
//     // Implement your logic to upload a new booking to the backend here
//   }

//   // Mock function to convert stream results to DateTimeRanges (replace with actual implementation)
//   List<DateTimeRange> convertStreamResultToDateTimeRanges({required dynamic streamResult}) {
//     // Implement your logic to convert stream results to DateTimeRanges here
//     return [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: const Text('Available date'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Choose Your Booking',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: BookingCalendar(
//               bookingService: BookingService(
//                 serviceName: 'Vacation Booking',
//                 serviceDuration: 30,
//                 bookingStart: DateTime.now(),
//                 bookingEnd: DateTime.now().add(Duration(days: 30)),
//               ),
//               getBookingStream: getBookingStream,
//               uploadBooking: uploadBooking,
//               convertStreamResultToDateTimeRanges: convertStreamResultToDateTimeRanges,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey, // Set color for the back button if needed
//                   ),
//                   child: const Text('Back'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Implement your next button functionality here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue, // Blue color for the next button
//                   ),
//                   child: const Text('Next'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
