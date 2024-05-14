import 'package:discover/view/widget/smooth_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashSecond extends StatefulWidget {
  const SplashSecond({super.key});

  @override
  State<SplashSecond> createState() => _SplashSecondState();
}

class _SplashSecondState extends State<SplashSecond> {
  int activeindex = 0;
  final caroselImage = [
    'assets/splash 3.img.jpeg',
    'assets/splash1.img.jpeg',
    'assets/splash1.img.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.blue,
              child: Stack(
                children: [ElevatedButton(onPressed: () {}, child: Text("Next")),
                 builderIndicator(),],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget builderIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: caroselImage.length,
        effect: const WormEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.black,
          dotColor: Colors.grey,
        ),
      );
}
