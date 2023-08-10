import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_connect/views/screens/starting_screens/start_page.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    whereToGo();
    super.initState();

  }
  whereToGo(){
    Timer(Duration(seconds: 3), () {
      Get.to(StartPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/splash.png',fit: BoxFit.cover,),
          ),
          Positioned(
            left: mq.width *0.12,
            bottom: mq.width/2,
            child: Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 43,
                fontWeight: FontWeight.w700,
                fontFamily: 'Urbanist',

              ),
            ),
          ),
          Positioned(
            left: mq.width *0.12,
            bottom: mq.width/2.6,
            child: Text(
              'Hotels Connect',
              style: TextStyle(
                color: Color(0xFF1AB65C),
                fontSize: 40,
                fontWeight: FontWeight.w700,
                fontFamily: 'Urbanist',
              ),
            ),
          ),
          Positioned(
            left: mq.width *0.12,
            bottom: mq.width/3.6,
            child: Text(
              'The best hotel bookings in the century to\naccompany your vacation',
              style: TextStyle(
                color: Colors.white ,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Urbanist',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
