// import 'package:flutter/material.dart';

// class WishList extends StatelessWidget {
//   const WishList({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: const Text('WishList'),
//       ),
//       body: ListView.builder(
//         itemCount: 3, // Number of items in the list
//         itemBuilder: (context, index) {
//           return Card(
//             // elevation: 5,
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 170,
//                     width: 160,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       image: const DecorationImage(
//                         image: AssetImage('assets/splash1.img.jpeg'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           '2 days 1 night Siem Reap',
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           'Krong Siem Reap',
//                           style: TextStyle(fontSize: 14, color: Colors.black),
//                         ),
//                         const SizedBox(height: 4),
//                         RichText(
//                           text: const TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'From \$25',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '/person',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 20,
//                             ),
//                             side: const BorderSide(
//                               color: Color.fromARGB(255, 205, 198, 198),
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.circular(0), // Square corners
//                             ),
//                           ),
//                           child: const Text(
//                             '2 days 1 night',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Color.fromARGB(255, 54, 52, 52),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios),
        // ),
        // title: const Text('WishList'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'WishList',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Number of items in the list
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 170,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/splash1.img.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '2 days 1 night Siem Reap',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Krong Siem Reap',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'From \$25',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/person',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 205, 198, 198),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0), // Square corners
                                  ),
                                ),
                                child: const Text(
                                  '2 days 1 night',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 54, 52, 52),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

