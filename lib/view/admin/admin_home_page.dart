// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/controller/authentication_provider.dart';
// import 'package:discover/view/admin/container_home.dart';
// import 'package:discover/view/authontication/Login/login_page.dart';
// import 'package:discover/view/user/home/booking_page.dart';
// import 'package:discover/view/user/profile/profile.dart';
// import 'package:discover/widgets/popular_package_card.dart';
// import 'package:discover/widgets/snackbar.dart';
// import 'package:discover/widgets/textfield.dart';
// import 'package:enefty_icons/enefty_icons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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

//     // Ensure the data is fetched when the screen is loaded
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       adminProvider.getAllTravelPackage();
//     });

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
//             } else if (value.searchList.isEmpty) {
//               if (value.allTravelList.isNotEmpty) {
//                 final allPackages = value.allTravelList;

//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => BookingDetailScreen()));
//                   },
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: allPackages.length,
//                     itemBuilder: (context, index) {
//                       final trips = allPackages[index];
//                       return Column(
//                         children: [
//                           expandedTripCard(context, trip: trips),
//                           SizedBox(height: size.height * .02),
//                         ],
//                       );
//                     },
//                   ),
//                 );
//               } else {
//                 return Center(child: Image.asset('assets/search_image.png'));
//               }
//             } else {
//               return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: value.searchList.length,
//                 itemBuilder: (context, index) {
//                   final travel = value.searchList[index];
//                   return Column(
//                     children: [
//                       expandedTripCard(
//                         context,
//                         trip: travel,
//                       ),
//                       // AllPlaceContainer(
//                       //     size: size,
//                       //     isAdmin: true,
//                       //     travelpackages: travel,
//                       //     value: value,
//                       //     circleAvatarRadius: circleAvatarRadius),
//                       SizedBox(height: size.height * .02),
//                     ],
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
import 'package:discover/view/admin/container_home.dart';
import 'package:discover/view/authontication/Login/login_page.dart';
import 'package:discover/view/user/home/booking_page.dart';
import 'package:discover/view/user/profile/profile.dart';
import 'package:discover/widgets/popular_package_card.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminProvider = Provider.of<AdminProvider>(context);

    // Ensure the data is fetched when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      adminProvider.getAllTravelPackage();
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        toolbarHeight: 100,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * .02),
          child: CustomTextFormField(
            labelText: 'Search',
            controller: adminProvider.searchController,
            hintText: 'Search',
            onChanged: (value) =>
                adminProvider.search(adminProvider.searchController.text),
            prefixIcon: const Icon(
              EneftyIcons.search_normal_2_outline,
              color: Color.fromARGB(255, 11, 11, 11),
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
            } else if (value.searchList.isEmpty) {
              if (value.allTravelList.isNotEmpty) {
                final allPackages = value.allTravelList;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allPackages.length,
                  itemBuilder: (context, index) {
                    final trips = allPackages[index];
                    return Column(
                      children: [
                        expandedTripCard(context, trip: trips),
                        SizedBox(height: size.height * .02),
                      ],
                    );
                  },
                );
              } else {
                return Center(child: Image.asset('assets/search_image.png'));
              }
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.searchList.length,
                itemBuilder: (context, index) {
                  final travel = value.searchList[index];
                  return Column(
                    children: [
                      expandedTripCard(
                        context,
                        trip: travel,
                      ),
                      SizedBox(height: size.height * .02),
                    ],
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
