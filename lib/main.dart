import 'package:discover/view/splash_second.dart';
import 'package:discover/view/welcome_screen1.dart';
import 'package:discover/widgets/bottombar.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}