import 'package:flutter/material.dart';

import '../../../main.dart';

class Starting2 extends StatelessWidget {
  const Starting2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFF),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: mq.height * 0.56,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/start2.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'Find the best hotels for\nyour vacation',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(
            width: mq.width *0.9,
            height: mq.height * 0.09,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF616161),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: 320,
            height: 55,
            decoration: ShapeDecoration(
              color: Color(0xFF1AB65C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.50),
              ),
            ),
            child: Center(
              child: Text("Next",style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: mq.height * 0.02,
          ),
          Container(
            width: 320,
            height: 55,
            decoration: ShapeDecoration(
              color: Color(0xFFE8F8EF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.50),
              ),
            ),
            child: Center(
              child: Text("Skip",style: TextStyle(color: Color(0xFF1AB65C)),),
            ),
          ),
        ],
      ),
    );
  }
}
