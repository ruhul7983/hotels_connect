import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/controller/auth_controller.dart';
import 'package:hotels_connect/views/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:hotels_connect/views/screens/splash_screen.dart';

import 'controller/hotel_details_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) =>   Get.put<HotelsController>(HotelsController()));
  AuthController authController = AuthController(); // Create an instance
  Get.put<AuthController>(authController);
  runApp(const MyApp());
}
late Size mq;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.black),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return BottomNav();
            }else if(snapshot.hasError){
              return SplashScreen();
            }
          }
          return BottomNav();
        },
      ),
    );
  }
}

