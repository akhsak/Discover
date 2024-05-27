import 'package:discover/controller/authontication_provider.dart';
import 'package:discover/controller/bottom.dart';
import 'package:discover/controller/create_account_provider.dart';
import 'package:discover/firebase_options.dart';
import 'package:discover/view/splash_second.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>BottomProvider(),),
      ChangeNotifierProvider(create: (context)=>AuthenProvider()),
      //ChangeNotifierProvider(create: (context)=>CreateAccountProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      ),
    );
  }
}