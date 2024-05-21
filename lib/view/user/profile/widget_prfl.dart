
// import 'package:discover/view/user/profile/pages/edit_profile.dart';
// import 'package:discover/widgets/textfield.dart';
// import 'package:flutter/material.dart';

// Widget userProfileScreenContainer(
//   Size size,
//   BuildContext context, {
//   required double height,
//   required double width,
//   required double sizedBoxWidth,
// }) {
//   return Container(
//     height: height,
//     width: width,
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: const Color(0xFFFFFFFF),
//       border: Border.all(
//         color: const Color(0xFFFFFFFF),
//       ),
//       borderRadius: BorderRadius.circular(18),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         poppinsHeadText(text: 'Account Setting'),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const EditProfile(),
//               ),
//             );
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.person),
//                   SizedBox(width: sizedBoxWidth),
//                   poppinsSmallText(
//                     text: "Edit Profile",
//                   )
//                 ],
//               ),
//               const Icon(Icons.arrow_forward_ios_rounded,
//                   color: Color(0xFF888888))
//             ],
//           ),
//         ),
       
//       ],
//     ),
//   );
// }


import 'package:discover/view/user/profile/pages/edit_profile.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:flutter/material.dart';

Widget userProfileScreenContainer(
  Size size,
  BuildContext context, {
  required double height,
  required double width,
  required double sizedBoxWidth,
}) {
  return Container(
    height: height,
    width: width,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        color: const Color(0xFFFFFFFF),
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        poppinsHeadText(text: 'Account Setting'),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfile(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: sizedBoxWidth),
                  poppinsSmallText(
                    text: "Edit Profile",
                  )
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF888888))
            ],
          ),
        ),
      ],
    ),
  );
}
