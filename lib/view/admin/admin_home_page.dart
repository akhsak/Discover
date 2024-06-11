import 'package:discover/controller/admin_provider.dart';
import 'package:discover/controller/authentication_provider.dart';
import 'package:discover/view/authontication/Login/login_page.dart';
import 'package:discover/view/user/home/booking_page.dart';
import 'package:discover/widgets/expanded_trip_card.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<AdminProvider>(context, listen: false).getAllTravelPackage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final authProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        toolbarHeight: 100,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * .02),
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
          // child: CustomTextFormField(
          //   labelText: 'search',
          //   controller: adminProvider.searchController,
          //   hintText: 'Search',
          //   onChanged: (value) =>
          //       adminProvider.search(adminProvider.searchController.text),
          //   prefixIcon: const Icon(
          //     EneftyIcons.search_normal_2_outline,
          //     color: Color(0xFFB2BAC6),
          //   ),
          //   suffixIcon: const Icon(
          //     EneftyIcons.firstline_outline,
          //     color: Color.fromARGB(255, 76, 111, 208),
          //   ),
          // ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color.fromARGB(255, 5, 4, 4)),
              ),
              onPressed: () {
                alertSheet(
                  context,
                  alertMessage: 'ARE YOU SURE TO LOGOUT?',
                  onPressed: () async {
                    await authProvider.googleSignOut();
                    await FirebaseAuth.instance.signOut();

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  confirmButtonLabel: 'LOGOUT',
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
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
                  scrollDirection: Axis.horizontal,
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
                scrollDirection: Axis.horizontal, // Changed to vertical
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
