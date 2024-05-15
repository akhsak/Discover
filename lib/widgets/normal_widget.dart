import 'package:discover/widgets/textfield.dart';
import 'package:flutter/material.dart';

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
                        icon: Icons.book_sharp,

          //  icon: EneftyIcons.info_circle_outline,
            //iconColor: const Color(0xFF1995AD)
            ),
        isAdmin!
            ? const SizedBox()
            : profileContainerListTile(context,
                title: 'Privacy policy',
                suffixIcon: true,
                            icon: Icons.shield_moon_sharp,

                //icon: EneftyIcons.headphone_outline,
                //iconColor: const Color(0xFF1995AD)
                ),
        // profileContainerListTile(context,
        //     title: 'Log Out',
        //     suffixIcon: false,
        //     icon: Icons.logout,
        //     //icon: EneftyIcons.logout_outline,
        //     iconColor: Colors.red,
        //     onTap: onTap),
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
        suffixIcon ?? false
            ? const Icon(Icons.arrow_forward_ios_rounded,
                color: Color(0xFF888888))
            : const SizedBox()
      ],
    ),
  );
}