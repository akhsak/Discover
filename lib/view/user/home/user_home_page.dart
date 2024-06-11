// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/view/admin/container_home.dart';
// import 'package:discover/view/user/profile/profile.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:discover/view/user/home/booking_page.dart';
// import 'package:discover/view/user/search/search.dart';
// import 'package:discover/widgets/expanded_trip_card.dart';
// import 'package:provider/provider.dart';

// class UserHomepage extends StatelessWidget {
//   const UserHomepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Stack(
//           children: [
//             Positioned(
//               child: Image.asset(
//                 'assets/splash1.img.jpeg',
//                 height: size.height * 0.5,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 100),
//                   const Text(
//                     'Explore the world today',
//                     style: TextStyle(
//                       fontSize: 50,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     'Discover - take your travel to the next level',
//                     style: TextStyle(fontSize: 17, color: Colors.white),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             onChanged: (value) {
//                               Provider.of<AdminProvider>(context, listen: false)
//                                   .search(value);
//                             },
//                             decoration: const InputDecoration(
//                               hintText: 'Search destination',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const Icon(Icons.search),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 60),
//                   const Text(
//                     'Popular Packages in Asia',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 250,
//                     child: Consumer<AdminProvider>(
//                       builder: (context, value, child) {
//                         if (value.isLoading) {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         } else if (value.searchList.isEmpty &&
//                             value.searchController.text.isNotEmpty) {
//                           return Center(
//                             child: Image.asset('assets/search_image.png'),
//                           );
//                         } else if (value.searchList.isEmpty) {
//                           if (value.allTravelList.isNotEmpty) {
//                             final allPackages = value.allTravelList;
//                             return ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: allPackages.length,
//                               itemBuilder: (context, index) {
//                                 final trip = allPackages[index];
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             BookingDetailScreen(
//                                           isAdmin: false,
//                                           tripId: trip.id ?? 'unknown id',
//                                           placeName:
//                                               trip.placeName ?? 'Unknown Place',
//                                           aboutTrip: trip.aboutTrip ??
//                                               'No description available',
//                                           location: trip.location ??
//                                               'Unknown location',
//                                           duration: trip.duration ??
//                                               'Unknown duration',
//                                           image: NetworkImage(trip.image ?? ''),
//                                           transportation: trip.transportation ??
//                                               'Unknown transportation',
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Column(
//                                     children: [
//                                       expandedTripCard(context, trip: trip),
//                                       SizedBox(height: size.height * .02),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             );
//                           } else {
//                             return Center(
//                                 child: Image.asset('assets/search_image.png'));
//                           }
//                         } else {
//                           return ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: value.searchList.length,
//                             itemBuilder: (context, index) {
//                               final trip = value.searchList[index];
//                               return GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => BookingDetailScreen(
//                                         isAdmin: false,
//                                         tripId: trip.id.toString(),
//                                         placeName: trip.placeName.toString(),
//                                         aboutTrip: trip.aboutTrip.toString(),
//                                         location: trip.location.toString(),
//                                         duration: trip.duration.toString(),
//                                         image:
//                                             NetworkImage(trip.image.toString()),
//                                         transportation:
//                                             trip.transportation.toString(),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 child: Column(
//                                   children: [
//                                     expandedTripCard(context, trip: trip),
//                                     SizedBox(height: size.height * .02),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Expanding your trip around the world',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 200,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => BookingDetailScreen(
//                               isAdmin: false,
//                               tripId: 'aa',
//                               placeName: 'Beautiful Beach',
//                               aboutTrip:
//                                   'A wonderful trip to a beautiful beach.',
//                               location: 'Beach City',
//                               duration: '2 days',
//                               image: AssetImage('assets/beach.jpg'),
//                               transportation: 'Bus',
//                             ),
//                           ),
//                         );
//                       },
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (context, index) {
//                           return expandedTripCard(
//                             context,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Travel beyond the boundary',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 250,
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (context, index) {
//                           return expandedTripCard(
//                             context,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:discover/controller/admin_provider.dart';
import 'package:discover/view/user/home/booking_page.dart';
import 'package:discover/widgets/expanded_trip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHomepage extends StatelessWidget {
  const UserHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                'assets/splash1.img.jpeg',
                height: size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Explore the world today',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Discover - take your travel to the next level',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              Provider.of<AdminProvider>(context, listen: false)
                                  .search(value);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search destination',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(Icons.search),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Popular Packages in Asia',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: Consumer<AdminProvider>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (value.searchList.isEmpty &&
                            value.searchController.text.isNotEmpty) {
                          return Center(
                              child: Image.asset('assets/search_image.png'));
                        } else if (value.searchList.isEmpty) {
                          if (value.allTravelList.isNotEmpty) {
                            final allPackages = value.allTravelList;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: allPackages.length,
                              itemBuilder: (context, index) {
                                final trip = allPackages[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookingDetailScreen(
                                          isAdmin: false,
                                          tripId: trip.id ?? 'unknown id',
                                          placeName:
                                              trip.placeName ?? 'Unknown Place',
                                          aboutTrip: trip.aboutTrip ??
                                              'No description available',
                                          location: trip.location ??
                                              'Unknown location',
                                          duration: trip.duration ??
                                              'Unknown duration',
                                          image: NetworkImage(trip.image ?? ''),
                                          transportation: trip.transportation ??
                                              'Unknown transportation',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      expandedTripCard(context, trip: trip),
                                      SizedBox(height: size.height * .02),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                                child: Image.asset('assets/search_image.png'));
                          }
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.searchList.length,
                            itemBuilder: (context, index) {
                              final trip = value.searchList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookingDetailScreen(
                                        isAdmin: false,
                                        tripId: trip.id.toString(),
                                        placeName: trip.placeName.toString(),
                                        aboutTrip: trip.aboutTrip.toString(),
                                        location: trip.location.toString(),
                                        duration: trip.duration.toString(),
                                        image:
                                            NetworkImage(trip.image.toString()),
                                        transportation:
                                            trip.transportation.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    expandedTripCard(context, trip: trip),
                                    SizedBox(height: size.height * .02),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Expanding your trip around the world',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDetailScreen(
                              isAdmin: false,
                              tripId: 'aa',
                              placeName: 'Beautiful Beach',
                              aboutTrip:
                                  'A wonderful trip to a beautiful beach.',
                              location: 'Beach City',
                              duration: '2 days',
                              image: AssetImage('assets/splash 3.img.jpeg'),
                              transportation: 'Bus',
                            ),
                          ),
                        );
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return expandedTripCard(context);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Travel beyond the boundary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: GestureDetector(
                      onTap: () {},
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return expandedTripCard(context);
                        },
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
  }
}
