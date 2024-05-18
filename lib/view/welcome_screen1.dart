import 'package:discover/view/widget/welcome_screen2.dart';
import 'package:flutter/material.dart';

class WelcomeScreen1 extends StatefulWidget {
  const WelcomeScreen1({super.key});

  @override
  State<WelcomeScreen1> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<WelcomeScreen1> {
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
            Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.white)),
           child: Column(
            children: [
              Text('Get ready fo the next trip',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 28,),),
              Text('Find thousans of tourist destination ready for you to visit',style: TextStyle(color: Colors.black,fontSize: 18,),),
              SizedBox(height: 20,),
              ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,minimumSize: Size(250,50)),
                
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen2()));
                },
                 child: Text('Next',style: TextStyle(color: Colors.white),),)
            ],
           )
            ),
            SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }
}
