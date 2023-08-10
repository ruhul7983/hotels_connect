import 'package:flutter/material.dart';

import '../../../main.dart';

class Recommended extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final Color textColor;
  const Recommended({Key? key, required this.text,required this.color,required this.borderColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
          height: mq.height * 0.05,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: borderColor),
            borderRadius: BorderRadius.circular(15.50),
          ),
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(text,style:TextStyle(color: textColor,fontWeight: FontWeight.w600,),),
        )),
      ),
    );
  }
}
