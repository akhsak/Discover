

// import 'package:flutter/material.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         title: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: Colors.grey, 
//               width: 1.0,
//             ),
//           ),
//           child: TextField(
//             decoration: InputDecoration(
//             hintText: 'Search destination',
//               border: InputBorder.none,
//              // contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//               suffixIcon: Icon(Icons.search)
//             ),
//             onSubmitted: (value) {
//             },
            
//           ),
//         ),
        
//       ),
//       body: Container(
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey, 
              width: 1.0,
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search destination',
              border: InputBorder.none,
              // contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {},
          ),
        ),
      ),
      body: Container(),
    );
  }
}

