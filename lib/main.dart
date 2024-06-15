import 'package:discover/controller/admin_provider.dart';
import 'package:discover/controller/authentication_provider.dart';
import 'package:discover/controller/booking_provider.dart';
import 'package:discover/controller/bottom.dart';
import 'package:discover/controller/revie_controller.dart';
// import 'package:discover/controller/login_provider.dart';
import 'package:discover/firebase_options.dart';
import 'package:discover/view/splash_second.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Razorpay razerpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomProvider(),
        ),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => AdminProvider()),
        ChangeNotifierProvider(create: (context) => ReviewState()),
        ChangeNotifierProvider(create: (context) => BookingProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
