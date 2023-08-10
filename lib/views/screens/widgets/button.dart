import 'package:flutter/material.dart';
import '../../../main.dart';
class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFF1AB65C),
        borderRadius: BorderRadius.circular(15),
      ),
      height: mq.height * 0.075,
      width: double.infinity,
      child: Center(
        child: Text(text,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
      ),
    );
  }
}
