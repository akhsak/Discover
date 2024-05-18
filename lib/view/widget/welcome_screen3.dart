import 'package:discover/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class WelcomeScreen3 extends StatefulWidget {
  const WelcomeScreen3({super.key});

  @override
  State<WelcomeScreen3> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<WelcomeScreen3> {
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
              Text('Lets explore the world',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 28,),),
              Text('Find thousans of tourist destination ready for you to visit',style: TextStyle(color: Colors.black,fontSize: 18,),),
              SizedBox(height: 20,),
              ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,minimumSize: Size(250,50)),
                
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomScreen()));},
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
