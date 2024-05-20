import 'package:discover/view/widget/welcome_screen3.dart';
import 'package:flutter/material.dart';

class WelcomeScreen2 extends StatefulWidget {
  const WelcomeScreen2({super.key});

  @override
  State<WelcomeScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<WelcomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash1.img.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Padding(
                padding: const EdgeInsets.only(right: 250),
                child: Container(
                        height: 150,
                        width: 100,
                        decoration:BoxDecoration( image: DecorationImage(image: AssetImage('assets/icon_white.png'))),
                      ),
              ),SizedBox(height: 20,),
            Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 150,top: 30),
                      child: Text(
                        'Visit tourist \nattractions',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 27,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(
                        'Find thousans of tourist destinations ready for you to visit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: Size(250, 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)) ),
                            
                            
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen3()));
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
