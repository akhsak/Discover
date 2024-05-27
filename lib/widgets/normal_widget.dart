import 'package:discover/controller/authontication_provider.dart';
import 'package:discover/view/user/profile/pages/help_page.dart';
import 'package:discover/view/user/profile/pages/privacy_policy.dart';
import 'package:discover/view/user/profile/pages/terms_condition.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Widget profileScreenContainer(context,
    {required containerHeight,
    required containerWidth,
    required bool? isAdmin,
    required onTap}) {
  return Container(
    height: containerHeight,
    width: containerWidth,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(color: const Color(0xFFFFFFFF)),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        poppinsHeadText(text: 'Derleng Legal'),
        profileContainerListTile(context,
            title: 'Terms and Condition',
            suffixIcon: true,
            icon: Icons.book_sharp, onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TermsCondition()));
        }
            //  icon: EneftyIcons.info_circle_outline,
            //iconColor: const Color(0xFF1995AD)
            ),
        isAdmin!
            ? const SizedBox()
            : profileContainerListTile(context,
                title: 'Privacy policy',
                suffixIcon: true,
                icon: Icons.shield_moon_sharp, onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              }
                //icon: EneftyIcons.headphone_outline,
                //iconColor: const Color(0xFF1995AD)
                ),
        profileContainerListTile(context,
            title: 'Help',
            suffixIcon: false,
            icon: Icons.help,
            //icon: EneftyIcons.logout_outline,
            iconColor: Colors.black,
            onTap: (){
               Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelpPage()));
            }),
      ],
    ),
  );
}

Widget profileContainerListTile(BuildContext context,
    {required String title,
    bool? suffixIcon,
    onTap,
    required IconData icon,
    Color? iconColor}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: size.width * .02),
          poppinsSmallText(
            text: title,
          )
        ]),
        // suffixIcon ?? false
        //     ?
        //     // const Icon(Icons.arrow_forward_ios_rounded,
        //        // Color: Color(0xFF888888))
        //    // : const SizedBox()
      ],
    ),
  );
}

 Widget phoneTextFormField(context) {
    final authProvider =
        Provider.of<AuthenProvider>(context, listen: false);
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'enter a phone number';
        } else {
          return null;
        }
      },
      maxLength: 13,
      controller: authProvider.phoneController,
      onChanged: (value) {},
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        // prefixText: '+91',
        suffixIcon: Icon(Icons.phone_android_outlined),
        labelText: 'phone number',
        labelStyle: TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
      ),
    );
  }

  Widget otpTextFormField(context) {
    final authProvider =
        Provider.of<AuthenProvider>(context, listen: false);
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'otp is empty';
        } else {
          return null;
        }
      },
      maxLength: 6,
      controller: authProvider.otpController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.phone_android_outlined),
        labelText: 'Enter otp',
        labelStyle: TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00246B)),
        ),
      ),
    );
  }
