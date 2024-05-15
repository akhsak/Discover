// import 'package:discover/view/user/home_page.dart';
// import 'package:discover/view/user/notification_page.dart';
// import 'package:discover/view/user/profile.dart';
// import 'package:discover/view/user/wishlist.dart';
// import 'package:flutter/material.dart';


// class BottomScreen extends StatelessWidget {
//   BottomScreen({Key? key});

//   final List<Widget> screens = [
//     Homepage(),
//      WishList(),
//      Notification(),
//      Profile()
//   ];

//   @override
//   Widget build(BuildContext context) {
//      int currentIndex = 0;

//   void onTap( index) {
//     currentIndex = index;
//   }
//     return Scaffold(
//       body: Consumer<WidgetProvider>(
//         builder: (context, value, child) => screens[value.currentIndex],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         elevation: 0,
//         height: 80,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _BottomNavItem(Icons.home, 'ᴴᵒᵐᵉ', 0, context),
//             _BottomNavItem(Icons.collections, 'ᴹʸ ᴾʳᵒᵈᵘᶜᵗˢ', 1, context),
//             _BottomNavItem(Icons.settings, 'ˢᵉᵗᵗᶦⁿᵍˢ', 2, context),
//            _BottomNavItem(Icons.settings, 'ˢᵉᵗᵗᶦⁿᵍˢ', 3, context),

//           ],
//         ),
//       ),
//     );
//   }

//   Widget _BottomNavItem(
//       IconData icon, String label, int index, BuildContext context) {
//     final bottomProvider = Provider.of<WidgetProvider>(context);
//     final isSelected = bottomProvider.currentIndex == index;
//     final color = isSelected ? Colors.green : Colors.black;

//     return GestureDetector(
//       onTap: () => bottomProvider.onTap(index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: color),
//           Text(label, style: TextStyle(color: color)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:discover/view/user/home_page.dart';
import 'package:discover/view/user/notification_page.dart';
import 'package:discover/view/user/profile/profile.dart';
import 'package:discover/view/user/wishlist.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Homepage(),
    const WishList(),
    const NotificationPage(),
    const UserProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavItem(Icons.home, 'ᴴᵒᵐᵉ', 0, _currentIndex, _onTap),
            _BottomNavItem(Icons.favorite, 'ʷⁱˢʰˡⁱˢᵗ', 1, _currentIndex, _onTap),
            _BottomNavItem(Icons.notifications, 'ⁿᵒᵗⁱᶠⁱᶜᵃᵗⁱᵒⁿ', 2, _currentIndex, _onTap),
            _BottomNavItem(Icons.person, 'ᴾʳᵒᶠᶦˡᵉ', 3, _currentIndex, _onTap),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const _BottomNavItem(this.icon, this.label, this.index, this.currentIndex, this.onTap);

  @override
  Widget build(BuildContext context) {
    final color = currentIndex == index ? Colors.blue: Colors.black;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
