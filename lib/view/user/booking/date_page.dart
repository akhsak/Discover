import 'package:discover/view/user/home/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePage extends StatefulWidget {
  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
/////
  DateTime? rangeStart;
  DateTime? rangeEnd;

  @override
  void initState() {
    super.initState();
    selectedDay = focusedDay;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(selectedDay, selectedDay)) {
      setState(() {
        selectedDay = selectedDay;
        focusedDay = focusedDay;
      });
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      selectedDay = null;
      focusedDay = focusedDay;
      rangeStart = start;
      rangeEnd = end;
    });
  }

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
              focusedDay: focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDay = selectedDay;
                  focusedDay = focusedDay;
                });
                showBookingDialog(context, selectedDay);
              },
              rangeStartDay: rangeStart,
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              onRangeSelected: onRangeSelected,
              rangeEndDay: rangeEnd,
              calendarFormat: CalendarFormat.month,
              onPageChanged: (focusedDay) {
                focusedDay = focusedDay;
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
                      backgroundColor: Colors.blue,
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

  void showBookingDialog(BuildContext context, DateTime selectedDay) {
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
