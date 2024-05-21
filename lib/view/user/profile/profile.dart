import 'package:discover/view/user/booking/booking_page.dart';
import 'package:discover/view/user/booking/my_booking.dart';
import 'package:discover/view/user/profile/widget_prfl.dart';
import 'package:discover/view/user/wishlist.dart';
import 'package:discover/widgets/normal_widget.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:flutter/material.dart';

const double circleAvatarRadiusFraction = 0.15;

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.height * 0.041,
                  width: size.width * 0.2,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: CircleAvatar(
                    radius: circleAvatarRadius,
                    backgroundColor: const Color.fromARGB(255, 143, 189, 198),
                    backgroundImage:
                        const AssetImage('assets/profile_avatar.jpg'),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    poppinsHeadText(
                      text: 'John',
                      color: const Color(0xFF1D1617),
                      fontSize: 15,
                    ),
                    SizedBox(height: size.height * 0.008),
                    poppinsSmallText(
                      text: 'John@gmail.com',
                      color: const Color(0xFF888888),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            const Divider(
              color: Color.fromARGB(255, 186, 186, 186),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text('Booking'),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                   MyBooking()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ],
            ),
            ListTile(
              title: const Text('Wishlist'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WishList()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ),
            const Divider(
              color: Color.fromARGB(255, 186, 186, 186),
            ),
            const SizedBox(
              height: 10,
            ),
            userProfileScreenContainer(
              size,
              context,
              height: size.height * 0.13,
              width: size.width * 0.9,
              sizedBoxWidth: size.width * 0.02,
              
            ),
            SizedBox(height: size.height * 0.03),
            profileScreenContainer(
              context,
              containerHeight: size.height * 0.26,
              containerWidth: size.width * 0.9,
              isAdmin: false,
              onTap: () {
                // confirmationDialog(
                //   context, size,
                //   dialogWidth: size.width * 0.4,
                //   height: size.height * 0.015,
                //   alertMessage: 'Are you sure to log out ?',
                //   confirmText: 'log Out', onPressedConfirm: () {
                //     // Navigator.pushAndRemoveUntil(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) => const LoginTypeScreen()),
                //     //     (route) => false);
                //     // bottomProvider.adminOnTap(0);
                //     // bottomProvider.userOnTap(0);
                //     // authenticationProvider.logOut();
                //     // authenticationProvider.googleSignOut();
                //   },
                // );
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: size.width * 0.9,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color.fromARGB(255, 238, 236, 236)),
                ),
                onPressed: () {},
                child: Text(
                  'Logout',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
