// import 'package:flutter/material.dart';

// class NotificationPage extends StatelessWidget {
//   const NotificationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('Notification')),
//     );
//   }
// }

import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Number of notifications
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.notifications, color: Colors.white),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getNotificationTitle(index),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _getNotificationSubtitle(index),
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              // Text(
                              //   _getNotificationTime(index),
                              //   style: TextStyle(fontSize: 12, color: Colors.grey),
                              // ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('View'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getNotificationTitle(int index) {
    switch (index) {
      case 0:
        return 'New Recommended place\nJust for you';
      case 1:
        return 'Your Booking Success\nYou have been accepted as...';
      case 2:
        return 'Get an unlimited traveling\nReceived summer special pr...';
      default:
        return '';
    }
  }

  String _getNotificationSubtitle(int index) {
    switch (index) {
      case 0:
        return '1 day ago';
      case 1:
        return '1 day ago';
      case 2:
        return '2 days ago';
      default:
        return '';
    }
  }

  // String _getNotificationTime(int index) {
  //   switch (index) {
  //     case 0:
  //       return '1 day ago';
  //     case 1:
  //       return '1 day ago';
  //     case 2:
  //       return '2 days ago';
  //     default:
  //       return '';
  //   }
  // }
}
