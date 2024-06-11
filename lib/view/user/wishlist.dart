import 'package:discover/controller/admin_provider.dart';
import 'package:discover/model/admin_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  WishList({final AdminModel});

  // final AdminModel travelpackage;
  // final AdminProvider tripvalue;

  // const WishList({
  //   super.key,
  //   required this.travelpackage,
  //   required this.tripvalue,
  // });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'WishList',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Consumer<AdminProvider>(builder: (context, value, child) {
              final wishlistItems = checkUser(value);

              return ListView.builder(
                itemCount: wishlistItems.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.13,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  placeName!,
                                  //'2 days 1 night Siem Reap',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: size.height * 0.0),
                                Text(
                                  location!,
                                  // 'Krong Siem Reap',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                SizedBox(height: size.height * 0.01),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'From \$25',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/person',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                SizedBox(
                                  height: size.height * 0.03,
                                  width: size.height * 0.16,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 198, 198),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            0), // Square corners
                                      ),
                                    ),
                                    child: Text(
                                      duration,
                                      //'2 days 1 night',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromARGB(255, 54, 52, 52),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  List<AdminModel> checkUser(AdminProvider adminProvider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }
    final user = currentUser.email ?? currentUser.phoneNumber;
    List<AdminModel> myTrips = [];
    for (var travel in adminProvider.allTravelList) {
      if (travel.wishList!.contains(user)) {
        myTrips.add(travel);
      }
    }
    return myTrips;
  }
}

// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/model/admin_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class WishList extends StatelessWidget {
//   final AdminModel travelpackage;
//   final AdminProvider tripvalue;

//   const WishList({
//     super.key,
//     required this.tripvalue,
//     required this.travelpackage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'WishList',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Consumer<AdminProvider>(builder: (context, value, child) {
//               final wishlistItems = checkUser(value);

//               return ListView.builder(
//                 itemCount: wishlistItems.length, // Number of items in the list
//                 itemBuilder: (context, index) {
//                   final item = wishlistItems[index]; // Get the wishlist item
//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: size.height * 0.13,
//                             width: size.width * 0.3,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                               image: DecorationImage(
//                                 image:
//                                     NetworkImage(item.image!), // Use item.image
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: size.width * 0.05,
//                           ),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item.placeName!, // Use item.placeName
//                                   style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(height: size.height * 0.0),
//                                 Text(
//                                   item.location!, // Use item.location
//                                   style: TextStyle(
//                                       fontSize: 12, color: Colors.black),
//                                 ),
//                                 SizedBox(height: size.height * 0.01),
//                                 RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text:
//                                             'From \$25', // Update pricing as needed
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: '/person',
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: size.height * 0.01),
//                                 SizedBox(
//                                   height: size.height * 0.03,
//                                   width: size.height * 0.16,
//                                   child: ElevatedButton(
//                                     onPressed: () {},
//                                     style: ElevatedButton.styleFrom(
//                                       side: const BorderSide(
//                                         color:
//                                             Color.fromARGB(255, 205, 198, 198),
//                                       ),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(
//                                             0), // Square corners
//                                       ),
//                                     ),
//                                     child: Text(
//                                       item.duration!, // Use item.duration
//                                       style: TextStyle(
//                                         fontSize: 13,
//                                         color: Color.fromARGB(255, 54, 52, 52),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }

//   List<AdminModel> checkUser(AdminProvider adminProvider) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) {
//       return [];
//     }
//     final user = currentUser.email ?? currentUser.phoneNumber;
//     List<AdminModel> myTrips = [];
//     for (var travel in adminProvider.allTravelList) {
//       if (travel.wishList!.contains(user)) {
//         myTrips.add(travel);
//       }
//     }
//     return myTrips;
//   }
// }
