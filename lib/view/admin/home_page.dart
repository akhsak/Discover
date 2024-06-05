// // import 'package:flutter/material.dart';

// // class AdminHomeScreen extends StatelessWidget {
// //   const AdminHomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(child: Text('home')),
// //     );
// //   }
// // }

// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/widgets/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:enefty_icons/enefty_icons.dart';

// const double circleAvatarRadiusFraction = 0.1;

// class AdminHomeScreen extends StatelessWidget {
//   const AdminHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     // Provider.of<AdminProvider>(context, listen: false).getAllDoctors();
//     double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
//     final adminProvider = Provider.of<AdminProvider>(context, listen: false);
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
//                 color: Color(0xFF1995AD),
//               ),
//             ),
//           )),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Consumer<AdminProvider>(
//           builder: (context, doctorValue, child) {
//             if (doctorValue.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (doctorValue.searchList.isEmpty &&
//                 doctorValue.searchController.text.isNotEmpty) {
//               return Center(
//                   child: Center(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Center(
//                       child: Image.asset(
//                           'assets/searched doctor unavailable.png')),
//                 ),
//               ));
//             } else if (doctorValue.searchList.isEmpty) {
//               if (doctorValue.allDoctorList.isNotEmpty) {
//                 final allDoctor = doctorValue.;

//                 return ListView.builder(
//                   itemCount: allDoctor.length,
//                   itemBuilder: (context, index) {
//                     final doctors = allDoctor[index];
//                     return Column(
//                       children: [
//                         AllDoctorsContainer(
//                             size: size,
//                             isAdmin: true,
//                             doctors: doctors,
//                             value: doctorValue,
//                             circleAvatarRadius: circleAvatarRadius),
//                         SizedBox(height: size.height * .02),
//                       ],
//                     );
//                   },
//                 );
//               } else {
//                 return Center(
//                     child: Image.asset('assets/no doctors available.png'));
//               }
//             } else {
//               return ListView.builder(
//                 itemCount: doctorValue.searchList.length,
//                 itemBuilder: (context, index) {
//                   final doctor = doctorValue.searchList[index];
//                   return Column(
//                     children: [
//                       AllDoctorsContainer(
//                           size: size,
//                           isAdmin: true,
//                           doctors: doctor,
//                           value: doctorValue,
//                           circleAvatarRadius: circleAvatarRadius),
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
import 'package:discover/view/admin/container_home.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';

const double circleAvatarRadiusFraction = 0.1;

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
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
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<AdminProvider>(
          builder: (context, Value, child) {
            if (Value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (Value.searchList.isEmpty &&
                Value.searchController.text.isNotEmpty) {
              return Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(child: Image.asset('assets/search_image.png')),
                ),
              );
            } else if (Value.searchList.isEmpty) {
              if (Value.allPackageList.isNotEmpty) {
                final allDoctors = Value.allPackageList;

                return ListView.builder(
                  itemCount: allDoctors.length,
                  itemBuilder: (context, index) {
                    final doctors = allDoctors[index];
                    return Column(
                      children: [
                        AllPlaceContainer(
                            size: size,
                            isAdmin: true,
                            travelpackages: doctors,
                            value: Value,
                            circleAvatarRadius: circleAvatarRadius),
                        SizedBox(height: size.height * .02),
                      ],
                    );
                  },
                );
              } else {
                return Center(child: Image.asset('assets/profile_avatar.jpg'));
              }
            } else {
              return ListView.builder(
                itemCount: Value.searchList.length,
                itemBuilder: (context, index) {
                  final doctor = Value.searchList[index];
                  return Column(
                    children: [
                      AllPlaceContainer(
                          size: size,
                          isAdmin: true,
                          travelpackages: doctor,
                          value: Value,
                          circleAvatarRadius: circleAvatarRadius),
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
