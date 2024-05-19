// import 'package:discover/widgets/bottombar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SuccessAccount extends StatelessWidget {
//   const SuccessAccount({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.blue,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Spacer(flex: 2),
//             Image.asset('assets/icon_white.png',
//             height: 100,
//             width: 100,),
//             // Icon(
//             //   Icons.check_circle_outline,
//             //   color: Colors.white,
//             //   size: 100,
//             // ),
//            // SizedBox(height: 20),
//             Center(
//               child: Text(
//                 'Successfully\n ',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
              
//             ),
//             Text(
//                 'Successfully\n ',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//           ],
        
          
//               ),
//            // SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'After this you can explore any place you want enjoy it!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Spacer(flex: 3),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomScreen()));
//                   // Navigate back to home or perform another action
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.blue,
//                   backgroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//                 child: Text('Back to home'),
//               ),
//             ),
//             Spacer(),
          
//         ),
//       );
    
//   }
// }

import 'package:discover/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class SuccessAccount extends StatelessWidget {
  const SuccessAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Image.asset(
              'assets/icon_white.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Successfully\nCreated an account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'After this, you can explore any place you want. Enjoy it!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Let’s Explore',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}


