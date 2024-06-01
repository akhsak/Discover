import 'package:discover/controller/bottom.dart';
import 'package:discover/view/user/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class CategoryCard extends StatelessWidget {
//   final String categoryName;
//   final IconData iconData;

//   const CategoryCard(
//       {super.key, required this.categoryName, required this.iconData});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white.withOpacity(0.8),
//       child: Padding(
//         padding: const EdgeInsets.all(23),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(iconData),
//             const SizedBox(width: 8),
//             Text(
//               categoryName,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget popularPackageCard(BuildContext context, title, String imagePath) {
  return Container(
    width: 160,
    margin: const EdgeInsets.only(right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  // decoration: BoxDecoration(
                  //   color: Colors.black.withOpacity(0.5),
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  child: Text(
                    'bangook',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // const Text(
        //   'Lorem ipsum dolor sit amet.',
        //   style: TextStyle(color: Colors.grey),
        // ),
      ],
    ),
  );
}

Widget expandedTripCard(BuildContext context, String title, String imagePath) {
  final bottomProvider = Provider.of<BottomProvider>(context);
  return Container(
    width: 160,
    margin: const EdgeInsets.only(right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    bottomProvider.onTap(1);
                  },
                ),
              ),
            ),
          ],
        ),
        //Positioned(child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_outlined),color: Colors.black,)),
        // const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'Lorem ipsum dolor sit amet.',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}
