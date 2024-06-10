// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/controller/authentication_provider.dart';
// import 'package:discover/view/user/home/booking_page.dart';
// import 'package:discover/view/user/profile/profile.dart';
// import 'package:discover/widgets/popular_package_card.dart';
// import 'package:discover/widgets/textfield.dart';
// import 'package:enefty_icons/enefty_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AdminHomeScreen extends StatelessWidget {
//   const AdminHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
//     final adminProvider = Provider.of<AdminProvider>(context);
//     final authProvider = Provider.of<LoginProvider>(context);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//           backgroundColor: const Color(0xFFF5F5F5),
//           toolbarHeight: 100,
//           title: Padding(
//             padding: EdgeInsets.symmetric(vertical: size.height * .02),
//             child: CustomTextFormField(
//               labelText: 'search',
//               controller: adminProvider.searchController,
//               hintText: 'Search',
//               onChanged: (value) =>
//                   adminProvider.search(adminProvider.searchController.text),
//               prefixIcon: const Icon(
//                 EneftyIcons.search_normal_2_outline,
//                 color: Color(0xFFB2BAC6),
//               ),
//               suffixIcon: const Icon(
//                 EneftyIcons.firstline_outline,
//                 color: Color.fromARGB(255, 76, 111, 208),
//               ),
//             ),
//           )),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Consumer<AdminProvider>(
//           builder: (context, value, child) {
//             if (value.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (value.searchList.isEmpty &&
//                 value.searchController.text.isNotEmpty) {
//               return Center(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Center(child: Image.asset('assets/search_image.png')),
//                 ),
//               );
//             } else if (value.searchList.isEmpty &&
//                 value.allTravelList.isEmpty) {
//               return Center(
//                 child: Text(
//                   'No data available',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.grey,
//                   ),
//                 ),
//               );
//             } else {
//               final allPackages = value.searchController.text.isEmpty
//                   ? value.allTravelList
//                   : value.searchList;
//               return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: allPackages.length,
//                 itemBuilder: (context, index) {
//                   final trips = allPackages[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BookingDetailScreen(
//                             placeName: trips.placeName!,
//                             aboutTrip: trips.aboutTrip!,
//                             location: trips.location!,
//                             duration: trips.duration!,
//                             image: NetworkImage(trips.image
//                                 .toString()), // Use correct image path
//                             transportation: trips.transportation!,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Column(
//                       children: [
//                         expandedTripCard(context, trip: trips),
//                         SizedBox(height: size.height * .02),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:discover/controller/admin_provider.dart';
import 'package:discover/controller/authentication_provider.dart';
import 'package:discover/view/user/home/booking_page.dart';
import 'package:discover/view/user/profile/profile.dart';
import 'package:discover/widgets/popular_package_card.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminProvider = Provider.of<AdminProvider>(context);
    final authProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        toolbarHeight: 100,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * .02),
          child: CustomTextFormField(
            labelText: 'search',
            controller: adminProvider.searchController,
            hintText: 'Search',
            onChanged: (value) =>
                adminProvider.search(adminProvider.searchController.text),
            prefixIcon: const Icon(
              EneftyIcons.search_normal_2_outline,
              color: Color(0xFFB2BAC6),
            ),
            suffixIcon: const Icon(
              EneftyIcons.firstline_outline,
              color: Color.fromARGB(255, 76, 111, 208),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<AdminProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (value.searchList.isEmpty &&
                value.searchController.text.isNotEmpty) {
              return Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(child: Image.asset('assets/search_image.png')),
                ),
              );
            } else if (value.searchList.isEmpty &&
                value.allTravelList.isEmpty) {
              return Center(
                child: Text(
                  'No data available',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              );
            } else {
              final allPackages = value.searchController.text.isEmpty
                  ? value.allTravelList
                  : value.searchList;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allPackages.length,
                itemBuilder: (context, index) {
                  final trips = allPackages[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetailScreen(
                            isAdmin: true,
                            tripId: trips.id ?? 'unknown id',
                            placeName: trips.placeName ?? 'Unknown Place',
                            aboutTrip:
                                trips.aboutTrip ?? 'No description available',
                            location: trips.location ?? 'Unknown location',
                            duration: trips.duration ?? 'Unknown duration',
                            image: NetworkImage(trips.image ?? ''),
                            transportation: trips.transportation ??
                                'Unknown transportation',
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        expandedTripCard(context, trip: trips),
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
    );
  }
}
