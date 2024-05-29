import 'package:discover/controller/authentication_provider.dart';
import 'package:discover/controller/bottom.dart';
import 'package:discover/view/user/Login/login_page.dart';
import 'package:discover/view/user/booking/my_booking.dart';
import 'package:discover/view/user/profile/widget_prfl.dart';
import 'package:discover/view/user/wishlist.dart';
import 'package:discover/widgets/normal_widget.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double circleAvatarRadiusFraction = 0.15;

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    final bottomProvider = Provider.of<BottomProvider>(context, listen: false);
    final authProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
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
                      text: 'Akhsa',
                      color: const Color(0xFF1D1617),
                      fontSize: size.width * 0.05,
                    ),
                    SizedBox(height: size.height * 0.008),
                    poppinsSmallText(
                      text: 'akhsa@gmail.com',
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  title: const Text('Booking'),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyBooking()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  title: const Text('Wishlist'),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WishList()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 186, 186, 186),
            ),
            SizedBox(height: size.height * 0.02),
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
              onTap: () {},
            ),
            SizedBox(height: 15),
            SizedBox(
              width: size.width * 0.9,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  side: BorderSide(
                      color: const Color.fromARGB(255, 238, 236, 236)),
                ),
                onPressed: () {
                  alertSheet(
                    context,
                    alertMessage: 'ARE YOU SURE TO LOGOUT ?',
                    onPressed: () async {
                      authProvider.googleSignOut();
                      // bottomProvider.setInitIndex(0);
                      await FirebaseAuth.instance.signOut();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                      bottomProvider.currentIndex = 0;
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
            SizedBox(height: 30),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
