// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/model/admin_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AllPlaceContainer extends StatelessWidget {
//   final Size size;
//   final bool isAdmin;
//   final AdminModel travelpackages;
//   final AdminProvider value;
//   final double circleAvatarRadius;

//   const AllPlaceContainer({
//     Key? key,
//     required this.size,
//     required this.isAdmin,
//     required this.travelpackages,
//     required this.value,
//     required this.circleAvatarRadius,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final adminProvider = Provider.of<AdminProvider>(context, listen: false);
//     return GestureDetector(
//       onTap: () {},
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: circleAvatarRadius,
//                 backgroundImage: NetworkImage(travelpackages.image.toString()),
//               ),
//               SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       travelpackages.placeName!,
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       travelpackages.aboutTrip.toString(),
//                       style: TextStyle(fontSize: 14),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                   ],
//                 ),
//               ),
//               if (isAdmin)
//                 IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     adminProvider.deleteTravelPackage(travelpackages.id!);
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ),
//     ):GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DoctorDetailScreen(
//                             doctors: doctors,
//                             value: value,
//                           )));
//             },
//             child: Container(
//               height: size.height * .16,
//               width: size.width * .93,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFFFFF),
//                 border: Border.all(
//                   color: const Color(0xFFFFFFFF),
//                 ),
//                 borderRadius: BorderRadius.circular(18),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: 10, vertical: size.height * .03),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleAvatar(
//                         radius: circleAvatarRadius,
//                         backgroundColor:
//                             const Color.fromARGB(255, 243, 242, 242),
//                         backgroundImage: NetworkImage(doctors!.image!)),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         poppinsHeadText(
//                           text: 'Dr. ${doctors?.fullName}',
//                           color: const Color(0xFF1D1617),
//                           fontSize: 14,
//                         ),
//                         Row(children: [
//                           poppinsSmallText(
//                             text: '${doctors?.category} | ',
//                           ),
//                           poppinsSmallText(
//                             text: doctors?.position,
//                           )
//                         ]),
//                         poppinsSmallText(
//                             text: '${doctors?.experience} Yrs Experience')
//                       ],
//                     ),
//                     SizedBox(width: size.width * .1),
//                     IconButton(
//                       onPressed: () {
//                         final wish = value.wishListCheck(doctors!);
//                         value.wishlistClicked(doctors!.id!, wish);
//                       },
//                       icon: value.wishListCheck(doctors!)
//                           ? const Icon(
//                               Icons.favorite_border_rounded,
//                               size: 30,
//                               color: Colors.red,
//                             )
//                           : const Icon(
//                               Icons.favorite_rounded,
//                               size: 30,
//                               color: Colors.red,
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//   }
// }

import 'package:discover/controller/admin_provider.dart';
import 'package:discover/model/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllPlaceContainer extends StatelessWidget {
  final Size size;
  final bool isAdmin;
  final AdminModel travelpackages;
  final AdminProvider value;
  final double circleAvatarRadius;

  const AllPlaceContainer({
    Key? key,
    required this.size,
    required this.isAdmin,
    required this.travelpackages,
    required this.value,
    required this.circleAvatarRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        // Handle onTap action
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: circleAvatarRadius,
                backgroundImage: NetworkImage(travelpackages.image.toString()),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      travelpackages.placeName!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      travelpackages.aboutTrip.toString(),
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (isAdmin)
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    adminProvider.deleteTravelPackage(travelpackages.id!);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorDetailScreen extends StatelessWidget {
  final Size size;
  final dynamic doctors; // Replace with the actual type
  final AdminProvider value;
  final double circleAvatarRadius;

  const DoctorDetailScreen({
    Key? key,
    required this.size,
    required this.doctors,
    required this.value,
    required this.circleAvatarRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorDetailScreen(
                      doctors: doctors,
                      value: value,
                      size: size,
                      circleAvatarRadius: circleAvatarRadius,
                    )));
      },
      child: Container(
        height: size.height * .16,
        width: size.width * .93,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(
            color: const Color(0xFFFFFFFF),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: size.height * .03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                  radius: circleAvatarRadius,
                  backgroundColor: const Color.fromARGB(255, 243, 242, 242),
                  backgroundImage: NetworkImage(doctors!.image!)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Dr. ${doctors?.fullName}',
                    style: TextStyle(
                      color: const Color(0xFF1D1617),
                      fontSize: 14,
                    ),
                  ),
                  Row(children: [
                    Text('${doctors?.category} | '),
                    Text(doctors?.position),
                  ]),
                  Text('${doctors?.experience} Yrs Experience'),
                ],
              ),
              SizedBox(width: size.width * .1),
              IconButton(
                onPressed: () {
                  final wish = value.wishListCheck(doctors!);
                  value.wishlistClicked(doctors!.id!, wish);
                },
                icon: value.wishListCheck(doctors!)
                    ? const Icon(
                        Icons.favorite_border_rounded,
                        size: 30,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_rounded,
                        size: 30,
                        color: Colors.red,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
